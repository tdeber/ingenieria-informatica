#Dados los valores en t0 = 3, t1 = 5, y t2 = 7, calcular t3 = t0 + t1 + t2. 

addi t0,x0,3
addi t1,x0,5
addi t2,x0,7

add t3,t0,t1
add t3,t3,t2
	#La funcion add solo puedo operar con 2 registros a la vez
	#por lo que realizo la suma por partes.