
module estacionamiento_top(
    input wire clk,
    input wire reset,
    input wire a,b,
    output wire [2:0] count
);

wire ingreso, egreso;
wire a_clean,b_clean;

//debouncer btn0(
//    .clk(clk),
//    .btn_noisy(a),
//    .btn_clean(a_clean)
//);
//debouncer btn1(
//    .clk(clk),
//    .btn_noisy(b),
//    .btn_clean(b_clean)
//);

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