module sumador(
    input wire A,B,Cin,
    output wire S,Cout
);

assign S = ((~A&~B&Cin)|(~A&B&~Cin)|(A&B&Cin)|(A&~B&~Cin));
assign Cout = ((Cin&(A|B))|(A&B));


endmodule