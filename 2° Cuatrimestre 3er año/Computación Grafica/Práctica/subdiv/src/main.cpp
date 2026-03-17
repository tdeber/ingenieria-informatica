#include <algorithm>
#include <stdexcept>
#include <vector>
#include <string>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/ext.hpp>
#include "Model.hpp"
#include "Window.hpp"
#include "Callbacks.hpp"
#include "Debug.hpp"
#include "Shaders.hpp"
#include "SubDivMesh.hpp"
#include "SubDivMeshRenderer.hpp"

#define VERSION 20241025

// models and settings
std::vector<std::string> models_names = { "cubo", "icosahedron", "plano", "suzanne", "star" };
int current_model = 0;
bool fill = true, nodes = true, wireframe = true, smooth = false, 
	 reload_mesh = true, mesh_modified = false;

// extraa callbacks
void keyboardCallback(GLFWwindow* glfw_win, int key, int scancode, int action, int mods);

SubDivMesh mesh;
void subdivide(SubDivMesh &mesh);

int main() {
	
	// initialize window and setup callbacks
	Window window(win_width,win_height,"CG Demo");
	setCommonCallbacks(window);
	glfwSetKeyCallback(window, keyboardCallback);
	view_fov = 60.f;
	
	// setup OpenGL state and load shaders
	glEnable(GL_DEPTH_TEST); glDepthFunc(GL_LESS); 
	glEnable(GL_BLEND); glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
	glClearColor(0.8f,0.8f,0.9f,1.f);
	Shader shader_flat("shaders/flat"),
	       shader_smooth("shaders/smooth"),
		   shader_wireframe("shaders/wireframe");
	SubDivMeshRenderer renderer;
	
	// main loop
	Material material;
	material.ka = material.kd = glm::vec3{.8f,.4f,.4f};
	material.ks = glm::vec3{.5f,.5f,.5f};
	material.shininess = 50.f;
	
	FrameTimer timer;
	do {
		
		glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
		
		if (reload_mesh) {
			mesh = SubDivMesh("models/"+models_names[current_model]+".dat");
			reload_mesh = false; mesh_modified = true;
		}
		if (mesh_modified) {
			renderer = makeRenderer(mesh,false);
			mesh_modified = false;
		}
		
		if (nodes) {
			shader_wireframe.use();
			setMatrixes(shader_wireframe);
			renderer.drawPoints(shader_wireframe);
		}
		
		if (wireframe) {
			shader_wireframe.use();
			setMatrixes(shader_wireframe);
			renderer.drawLines(shader_wireframe);
		}
		
		if (fill) {
			Shader &shader = smooth ? shader_smooth : shader_flat;
			shader.use();
			setMatrixes(shader);
			shader.setLight(glm::vec4{2.f,1.f,5.f,0.f}, glm::vec3{1.f,1.f,1.f}, 0.25f);
			shader.setMaterial(material);
			renderer.drawTriangles(shader);
		}
		
		// settings sub-window
		window.ImGuiDialog("CG Example",[&](){
			if (ImGui::Combo(".dat (O)", &current_model,models_names)) reload_mesh = true;
			ImGui::Checkbox("Fill (F)",&fill);
			ImGui::Checkbox("Wireframe (W)",&wireframe);
			ImGui::Checkbox("Nodes (N)",&nodes);
			ImGui::Checkbox("Smooth Shading (S)",&smooth);
			if (ImGui::Button("Subdivide (D)")) { subdivide(mesh); mesh_modified = true; }
			if (ImGui::Button("Reset (R)")) reload_mesh = true;
			ImGui::Text("Nodes: %i, Elements: %i",mesh.n.size(),mesh.e.size());
		});
		
		// finish frame
		window.finishFrame();
		
	} while( glfwGetKey(window,GLFW_KEY_ESCAPE)!=GLFW_PRESS && !glfwWindowShouldClose(window) );
}

void keyboardCallback(GLFWwindow* glfw_win, int key, int scancode, int action, int mods) {
	if (action==GLFW_PRESS) {
		switch (key) {
		case 'D': subdivide(mesh); mesh_modified = true; break;
		case 'F': fill = !fill; break;
		case 'N': nodes = !nodes; break;
		case 'W': wireframe = !wireframe; break;
		case 'S': smooth = !smooth; break;
		case 'R': reload_mesh=true; break;
		case 'O': case 'M': current_model = (current_model+1)%models_names.size(); reload_mesh = true; break;
		}
	}
}

// La struct Arista guarda los dos indices de nodos de una arista
// Siempre pone primero el menor indice, para facilitar la búsqueda en lista ordenada;
//    es para usar con el Mapa de más abajo, para asociar un nodo nuevo a una arista vieja
struct Arista {
	int n[2];
	Arista(int n1, int n2) {
		n[0]=n1; n[1]=n2;
		if (n[0]>n[1]) std::swap(n[0],n[1]);
	}
	Arista(Elemento &e, int i) { // i-esima arista de un elemento
		n[0]=e[i]; n[1]=e[i+1];
		if (n[0]>n[1]) std::swap(n[0],n[1]); // pierde el orden del elemento
	}
	const bool operator<(const Arista &a) const {
		return (n[0]<a.n[0]||(n[0]==a.n[0]&&n[1]<a.n[1]));
	}
};

// Mapa sirve para guardar una asociación entre una arista y un indice de nodo (que no es de la arista)
using Mapa = std::map<Arista,int>;

void subdivide(SubDivMesh &mesh) {
	
	/// @@@@@: Implementar Catmull-Clark... lineamientos:
	
	int cant_nodos = mesh.n.size(); // Cantidad original de nodos
	int cant_elem = mesh.e.size(); // Cantidad original de nodos
	
	std::vector<Elemento> &elementos = mesh.e;// referencia para mantener actualizados los elementos
	std::vector<Nodo> &nodos = mesh.n; // referencia para mantener actualizados los nodos
	
	// Mapa para almacenar el índice de los centroides de cada elemento
	std::map<int, int> centroides;
	
	// Paso 1: Para cada elemento, calcula y agrega el centroide
	// Los nuevos nodos centroides se agregarán al final del vector `nodos`.
	for(int i=0; i < elementos.size(); i++){
		Elemento elem = elementos[i];
		glm::vec3 centroide(0.f,0.f,0.f);
		for(int j=0; j < elem.nv; j++){
			centroide += nodos[elem[j]].p; // Suma las posiciones de los vértices del elemento
		}
		centroide /= elem.nv; // Calcula el promedio para obtener el centroide
		centroides[i] = nodos.size(); // Guarda el índice del nuevo centroide en el mapa
		nodos.push_back(Nodo(centroide)); // Agrega el centroide como un nuevo nodo
	}
	// Paso 2: Para cada arista de cada elemento, agrega un punto medio.
	// Este punto es el promedio de los vértices de la arista y los centroides de las caras adyacentes.
	Mapa aristas; // Mapa auxiliar para almacenar puntos medios de aristas
	for(int i=0; i < elementos.size(); i++){
		Elemento elem = elementos[i];
		for(int j=0; j < elem.nv; j++){
			Arista arista(elem[j], elem[(j + 1)]);
			
			glm::vec3 punto(0.f);
			// Evita procesar aristas duplicadas
			auto it = aristas.find(arista); // Busco si la arista esta en el mapa ya
			if(it == aristas.end()){ 
				glm::vec3 p_nodo1 = nodos[elem[j]].p;
				glm::vec3 p_nodo2 = nodos[elem[j+1]].p;
				
				// Si la arista está en la frontera, el punto medio es simplemente el promedio de sus dos nodos
				if(elem.v[j] == -1){ 
					punto = (p_nodo1 + p_nodo2) / 2.f;
				}else{
					// Si la arista no está en la frontera, considera también los centroides de las caras adyacentes
					glm::vec3 pn_centroide1 = nodos[centroides[i]].p;
					glm::vec3 pn_centroide2 = nodos[centroides[elem.v[j]]].p;
					punto = (p_nodo1 + p_nodo2 + pn_centroide1 + pn_centroide2) / 4.f;
				}
				// Almacena el índice del nuevo nodo en el mapa de aristas y lo agrega a `nodos`
				aristas[Arista(elem[j], elem[j+1])] = nodos.size();
				nodos.push_back(Nodo(punto));
			}			
		}
		
	}
	// Paso 3: Crear los nuevos elementos a partir de los centroides y puntos medios calculados
	int q = elementos.size();// Guardar el tamaño inicial de elementos
	for(int i=0; i< q; i++){
		Elemento elem = elementos[i];
		int n0 = centroides[i];// Centroide del elemento
		// Para cada vértice del elemento, crear nuevos elementos
		for(int j=1 ; j<elem.nv;j++){
			int n1 = aristas[Arista(elem[j],elem[j-1])];//(el vértice anterior)
			int n2 = elem[j];
			int n3 = aristas[Arista(elem[j],elem[j+1])];//(el vértice siguiente).
			mesh.agregarElemento(n0, n1, n2, n3);
		}
		// Reemplazar el elemento original por un nuevo elemento
		int n1 = aristas[Arista(elem[0],elem[-1])];
		int n2 = elem[0];
		int n3 = aristas[Arista(elem[0], elem[1])];
		mesh.reemplazarElemento(i, n0, n1, n2,n3);
	}
	// Actualizar la información de vecinos después de la subdivisión
	mesh.makeVecinos();

	// Paso 4: Calcular las nuevas posiciones de los nodos originales
	for(int i=0; i<cant_nodos; ++i){ 
		glm::vec3 r(0.f);
		std::vector<int>& elemento_nodo = nodos[i].e;
		int N = elemento_nodo.size();
		
		// Si el nodo no es frontera, aplicamos la fórmula de Catmull-Clark para nodos interiores
		if(!nodos[i].es_frontera){ 
			glm::vec3 f(0.f);				
			for(int j=0; j<N; ++j){
				
				Elemento elem = elementos[elemento_nodo[j]];
				
				f += nodos[elem[0]].p;// Suma de los nodos interiores de las caras
				r += nodos[elementos[elemento_nodo[j]][1]].p+nodos[elementos[elemento_nodo[j]][3]].p;// Suma de los nodos interiores de las aristas
			}
			f /= N;// Promedio de los nodos interiores de las caras
			r /= (2*N);// Promedio de puntos medios de las aristas
			nodos[i].p = (4.f*r - f +(N-3.f)*nodos[i].p)*(1.f/N);
		}else{
			for(int j=0; j<	N; ++j){
				// Si el nodo es de frontera:
				if(nodos[elementos[elemento_nodo[j]][1]].es_frontera){
					r += nodos[elementos[elemento_nodo[j]][1]].p;
				}
				if(nodos[elementos[elemento_nodo[j]][3]].es_frontera){
					r += nodos[elementos[elemento_nodo[j]][3]].p;
				}
			}
			r /= 2;
			nodos[i].p = (r+nodos[i].p)*0.5f;
		}
	}
	// Validación final para asegurar que la estructura de datos quedó consistente
	mesh.verificarIntegridad();
}

