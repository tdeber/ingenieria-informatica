module EJ4(
     input wire A,B,C,D,E,F,
     output wire f,g
    );
    
    assign f = ~( (A & ~B) | (~C & D) | (E & F) );
    assign g = ~( ~(A | (B & ~C)) | (D & ~(E & ~F)) );

endmodule
