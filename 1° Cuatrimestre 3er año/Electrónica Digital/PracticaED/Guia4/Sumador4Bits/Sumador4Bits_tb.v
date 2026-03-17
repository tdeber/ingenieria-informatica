`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module Sumador4Bits_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] A;
reg [3:0] B;

//-- Instantiate the unit to test
Sumador4Bits UUT (  
        .E1(A),
        .E2(B)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, Sumador4Bits_tb);

    A     = 4'b0110;  // 6 en decimal
    B     = 4'b1011;  // 11 en decimal

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
