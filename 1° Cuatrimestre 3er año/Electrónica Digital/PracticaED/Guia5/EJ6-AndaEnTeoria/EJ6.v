`include "flip-flop-D/flip-flop-D.v"
module EJ6(
    input wire[3:0] D_in,
    input wire clk,
    output wire[3:0] Q_out,
    input wire set,
    input wire reset,
    input wire enable
);


genvar i;

generate
    for(i=0;i<4;i=i+1) begin : FF_GEN

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

endmodule