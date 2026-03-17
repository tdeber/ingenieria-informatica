module debouncer(
    input wire clk,        //reloj del sistema
    input wire btn_noisy,  //entrada del boton con rebote
    output reg btn_clean  //boton corregido
);
//El codigo detecta cuando la señal del btn_noisy se mantiene estable
//durante varios ciclos de reloj. Si se mantiene igual por suficiente tiempo
//actualiza la salida limpia en btn_clen.


parameter MAX_COUNT = 19'd260000; //Es una constante de 500.000 ciclos -> 10 ms (milisegundos)
//Reloj = 50 MHz -> 1 ciclo cada 200 ns -> por lo q modifiquecd del tb
//10 ms = 10.000.000 ns -> 10.000.000/200 = 500.000 ciclos
//La señal debe mantenerse estable 10 ms antes de aceptarla
//Para contar 500.000 necestio (log2(500.000)=19) 19 bits
reg [17:0] count; //Contador, suficiente para contar hasta 524.287 ciclos

reg sync; //Copia de la señal de entrada original, la uso para detectar los cambios

always @(posedge clk) begin
    sync <= btn_noisy; //Actualizamos la copia

    if (sync == btn_noisy) begin 
        if (count < MAX_COUNT) count <= count +1; //Si se sigue manteniendo estable incremento el contador
        else btn_clean <= btn_noisy; //Actualizo el btn_clean porque se mantuvo estable la cant de tiempo requerida
    end else count <=0; //Sin cambios, reinicio el contador
end


endmodule