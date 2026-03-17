`include "Multiplexor8B/mux8.v"
module barrel_shifter(
    input wire[2:0] codigo,
    input wire[3:0] E,
    output reg [3:0] S
);


mux8 S0(
    .d0(E[0]), //NO
    .d1(E[1]), //DLD
    .d2(1'b0), //DLI
    .d3(E[1]), //RD
    .d4(E[0]), 
    .d5(E[1]), //DAD
    .d6(1'b0), //DAI
    .d7(E[3]), //RI
    .Selector(codigo),
    .SCh(S[0])
);

mux8 S1(
    .d0(E[1]), //NO
    .d1(E[2]), //DLD
    .d2(E[0]), //DLI
    .d3(E[2]), //RD
    .d4(E[1]), 
    .d5(E[2]), //DAD
    .d6(E[0]), //DAI
    .d7(E[0]), //RI
    .Selector(codigo),
    .SCh(S[1])
);






endmodule