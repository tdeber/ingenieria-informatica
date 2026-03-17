module EJ7(
     input wire A,B,C,D,
     output wire y,z
    );

    assign y = ((~A&D)|(A&~C&D)|(A&~B&C)|(A&B&C&D));
    assign z = ((B&C) | (A&~B&D));


endmodule
