
A = [1 -2 3 0;3 -6 9 3;2 1 4 1;1 -2 2 -2];

[L, U, A_cp, r, P] = doolitle_p(A);

C1 = P*A;
C2 = L*U;
