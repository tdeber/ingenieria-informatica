module EJ5(
     input wire A,B,C,
     output wire f1,f2,g1,g2,h1,h2,l1,l2
    );
    
    assign f1 = A & (~A | (A & B));
    assign f2 = (A & B);
    
    assign g1 = ((B & C) | (~B & C));
    assign g2 = (C);

    assign h1 = ((A&B) | (A&(B | C)) | (B & (B | C)) );
    assign h2 = (B | (A & C));

    assign l1 = ((A | ~A) & ((A & B) | (A & B & ~C)));
    assign l2 = (A & B);

endmodule
