module comparador(
    input wire[3:0] A,
    input wire[3:0] B,
    output a,b,c
);

assign a = ~A & B;
assign b = (~A&~B) | (A&B);
assign c = A & ~B;

endmodule