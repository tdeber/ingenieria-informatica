`include "restador/restador.v"
`include "sumador/sumador.v"

module ALU(
    input wire[2:0] codigo,
    input wire OP1, OP2,
    output reg RTA, BCout
);

wire rta_suma, c_suma;
wire rta_resta, b_resta;

sumador Suma(
    .A(OP1),
    .B(OP2),
    .Cin(1'b0),
    .S(rta_suma),
    .Cout(c_suma)
);

restador Resta(
    .A(OP1),
    .B(OP2),
    .Bin(1'b0),
    .R(rta_resta),
    .Bout(b_resta)
);

always @(*) begin

    case (codigo)
        3'b001:begin RTA = rta_suma; BCout = c_suma; end
        3'b010:begin RTA = rta_resta; BCout = b_resta;  end
        3'b100: begin  RTA = (OP1 | OP2); BCout = 1'b0; end
        3'b101: begin  RTA = (OP1 & OP2); BCout = 1'b0; end 
        default: begin RTA = 3'b000; BCout=3'b000; end
    endcase

end







endmodule