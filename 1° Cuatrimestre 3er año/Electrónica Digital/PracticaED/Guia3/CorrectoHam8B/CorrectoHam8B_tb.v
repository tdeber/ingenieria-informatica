`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module CorrectoHam8B_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

reg [11:0] Cod_Entrada;
wire [11:0] Cod_Salida;

CorrectoHam8B UUT (
    .COD(Cod_Entrada),
    .COD_C(Cod_Salida)
);



initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, CorrectoHam8B_tb);

    Cod_Entrada = 12'b011110001010;
    //Cod Correcto 001110001010
   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
