#1. Cargar el numero 5 al registro t0
	#Sumar a t0 el valor de t1=7
#Hay dos formas, utilizando sumas o 
	#guardandolo directamente

addi t0,x0,5 #t0 = x0+5 -> x0 es un registro que tiene el valor 0 siempre
		#utilizo addi porque estoy trabajando con una constante (5)
		
#li t0,5      t0 = 5, li := load immediated -> Carga la constante
		#inmediatamente en el registro

addi t1,x0,7 #t1 = x0+7
add t0,t0,t1 #t0 = t0 + t1 = 5+7=12 
		#Utilizo ahora add porque estoy trabajando con registros