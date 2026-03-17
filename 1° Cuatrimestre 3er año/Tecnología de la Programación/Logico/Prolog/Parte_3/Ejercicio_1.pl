
factorial_aux(0, Acc, Acc).
factorial_aux(N, Acc, Factorial) :-
	N > 0, Nuevo_N is N - 1, Nuevo_Acc is Acc*N, 
	factorial_aux(Nuevo_N, Nuevo_Acc, Factorial).
factorial(N, Resultado) :-
	N >= 0, 
	factorial_aux(N, 1, Resultado).