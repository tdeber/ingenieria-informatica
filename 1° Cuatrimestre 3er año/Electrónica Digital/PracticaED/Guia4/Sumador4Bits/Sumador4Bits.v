`include "Sumador/suma.v"

module Sumador4Bits(
    input wire[3:0] E1,
    input wire[3:0] E2,
    output wire[3:0] R,
    output wire Co
);

wire c1,c2,c3;

suma S1(
    .A(E1[0]),
    .B(E2[0]),
    .Cin(1'b0),
    .S(R[0]),
    .Cout(c1)
);

suma S2(
    .A(E1[1]),
    .B(E2[1]),
    .Cin(c1),
    .S(R[1]),
    .Cout(c2)
);

suma S3(
    .A(E1[2]),
    .B(E2[2]),
    .Cin(c2),
    .S(R[2]),
    .Cout(c3)
);

suma S4(
    .A(E1[3]),
    .B(E2[3]),
    .Cin(c3),
    .S(R[3]),
    .Cout(Co)
);




endmodule