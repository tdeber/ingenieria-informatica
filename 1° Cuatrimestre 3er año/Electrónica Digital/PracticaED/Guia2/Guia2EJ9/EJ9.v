module EJ9(
     input wire A,B,C,D,
     output wire f,g,h
    );
    
    assign f = ((A&~B&C)|(~A&B&~C)|(A&B&C));
    assign g = ((A|~B)&(A|~B|~C)&(B|C|~D)&(~A|B|~C|D));
    assign h = ((A|B|C)&(~A|~B|~C)&(A|~B|C));


endmodule
