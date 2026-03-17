module EJ3(
     input wire A,B,C,D,
     output wire a,b
    );


    assign a = (A | B | C | D);
    assign b = (A & B & C & D);


endmodule
