module restador(
    input wire A,B,Bin,
    output wire Bout, R
);

assign R = ((~A&~B&Bin)|(~A&B&~Bin)|(A&B&Bin)|(A&~B&~Bin));
assign Bout = ((~A&B)|(~A&Bin)|(B&Bin));

endmodule;