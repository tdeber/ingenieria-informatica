`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module topHamm_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [7:0] C;

//-- Instantiate the unit to test
topHamm UUT (  
        .COD_Inicial(C)   
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, topHamm_tb);

    C = 8'b10110010;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
