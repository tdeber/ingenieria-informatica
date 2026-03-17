`include "flip-flop-D/flip-flop-D.v"

module EJ8(
    input wire S_in,
    input wire dir,
    input wire clk,
    input wire set,
    input wire reset,
    input wire enable,
    output wire S_out
);

//Primero deberia hacer un D y desplazar
//luego varios flipflop con salida Q
//y al final S_out es mi Q dependiendo mi dir

wire[3:0] D_in; 
wire[3:0] Q_out;

assign D_in[0] = (dir) ? S_in : Q_out[1]; 
assign D_in[1] = (dir) ? Q_out[0] : Q_out[2]; 
assign D_in[2] = (dir) ? Q_out[1] : Q_out[3]; 
assign D_in[3] = (dir) ? Q_out[3] : S_in;

genvar i;
generate
    for(i=0;i<4;i=i+1) begin : FF_D
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

//Debo mostrar el bit que sale
assign S_out = (dir) ? Q_out[3] : Q_out[0];

endmodule