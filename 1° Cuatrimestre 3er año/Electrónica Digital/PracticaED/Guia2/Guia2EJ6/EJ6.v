module EJ6(
     input wire A,B,C,D,
     output wire f,f1,f2,g,g1,g2
    );
    
    assign f = ((A | (~B & C)) & C);
    assign f1 = ((A&B&C)|(A&C&~B)|(~A&~B&C));
    assign f2 = ((A|B|C)&(A|~B|C)&(~A|~B|C)&(A|~B|~C)&(~A|B|C));

    assign g = ((A&~B&C)|(~A&~B)|(A&B&~C&D));
    assign g1 = ((A&~B&C&D)|(A&~B&C&~D)|(~A&~B&C&D)|(~A&~B&C&~D)|(~A&~B&~C&D)|(~A&~B&~C&~D)|(A&B&~C&D));
    assign g2 = ((A|~B|C|D)&(A|~B|C|~D)&(A|~B|~C|~D)&(~A|B|C|D)&(~A|B|C|~D)&(~A|~B|C|D))&(~A|~B|~C|D)&(~A|~B|~C|~D);

endmodule
