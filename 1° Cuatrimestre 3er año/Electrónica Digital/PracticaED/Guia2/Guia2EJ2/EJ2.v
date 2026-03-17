module EJ2(
     input wire A,B,C,
     output wire X
    );
   
    assign X = ~(A |B | C);

endmodule
