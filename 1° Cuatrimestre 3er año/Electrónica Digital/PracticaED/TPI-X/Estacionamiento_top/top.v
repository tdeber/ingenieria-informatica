
module estacionamiento_top(
    input wire clk,
    input wire reset,
    input wire a,b,
    output wire [2:0] count
);

wire ingreso, egreso;

TPI detector (
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .ingreso(ingreso),
    .egreso(egreso)
);

ContadorUD contador(
    .clk(clk),
    .reset(reset),
    .up(ingreso),
    .down(egreso),
    .count(count)
);



endmodule