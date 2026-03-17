module resta(
     input wire A,B,Bin,
     output wire R,Bout
    );
    
    assign R = ((~A&~B&Bin)|(~A&B&~Bin)|(A&B&Bin)|(A&~B&~Bin));
    assign Bout = (Bin&(~A|B)|(~A&B));


endmodule
