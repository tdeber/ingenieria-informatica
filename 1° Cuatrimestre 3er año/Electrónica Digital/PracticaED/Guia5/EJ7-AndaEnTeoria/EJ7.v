`include "flip-flop-D/flip-flop-D.v"

module EJ7(
    input wire S_in,
    input wire clk,
    input wire set,
    input wire reset,
    input wire enable,
    output wire[3:0] P_out
);

wire[3:0] D_in;
wire[3:0] Q_out;

assign D_in[0] = S_in;
assign D_in[1] = Q_out[0];
assign D_in[2] = Q_out[1];
assign D_in[3] = Q_out[2];

genvar i;
generate
    for(i=0;i<4;i=i+1)begin : FF_D
        flipflopD ff(
            .D(D_in[i]),
            .clk(clk),
            .Q(Q_out[i]),
            .set(set),
            .reset(reset),
            .enable(enable)
        );        
    end
endgenerate

assign P_out = Q_out;



endmodule