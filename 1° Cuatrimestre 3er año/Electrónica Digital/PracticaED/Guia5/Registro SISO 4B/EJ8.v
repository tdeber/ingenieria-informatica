`include "flipflopD/flip-flop-D.v"

module EJ8(
    input wire D,
    input wire dir,
    input wire clk,
    output wire Q,

    input wire set,
    input wire reset,
    input wire enable
);


wire[3:0] q_int;
reg [3:0] dir_d;

always @(*) begin

    if(dir) begin
        dir_d[3] = D;
        dir_d[2] = q_int[3];
        dir_d[1] = q_int[2];
        dir_d[0] = q_int[1];
    end else begin
        dir_d[0] = D;
        dir_d[1] = q_int[0];
        dir_d[2] = q_int[1];
        dir_d[3] = q_int[2];
    end
end

flipflopD FF0(
    .D(dir_d[3]), //Si dir=1, desplazo der a izq, entonces D0 = a la salida de FF1
    .clk(clk),
    .set(set),
    .reset(reset),
    .enable(enable),
    .Q(q_int[0])
);

flipflopD FF1(
    .D(dir_d[3] ),
    .clk(clk),
    .set(set),
    .reset(reset),
    .enable(enable),
    .Q(q_int[1])
);

flipflopD FF2(
    .D(dir_d[3]),
    .clk(clk),
    .set(set),
    .reset(reset),
    .enable(enable),
    .Q(q_int[2])
);

flipflopD FF3(
    .D(dir_d[3]),
    .clk(clk),
    .set(set),
    .reset(reset),
    .enable(enable),
    .Q(q_int[3])
);




assign Q = (dir) ? q_int[0] : q_int[3];





endmodule

