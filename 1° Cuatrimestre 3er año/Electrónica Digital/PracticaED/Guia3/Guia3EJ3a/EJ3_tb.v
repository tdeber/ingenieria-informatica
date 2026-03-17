`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ3_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [9:0] decimal_sim;
//-- Instantiate the unit to test
EJ3 UUT (  
        .decimal_in(decimal_sim)
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ3_tb);

        #1
        decimal_sim = 10'b0000000000;
        #1
        decimal_sim = 10'b0000000000;
        #1
        decimal_sim = 10'b1000000000;
        #1
        decimal_sim = 10'b0100000000;
        #1
        decimal_sim = 10'b0010000000;
        #1
        decimal_sim = 10'b0001000000;
        #1
        decimal_sim = 10'b0000100000;
        #1
        decimal_sim = 10'b0000010000;
        #1
        decimal_sim = 10'b0000001000;
        #1
        decimal_sim = 10'b0000000010;
        #1
        decimal_sim = 10'b0000000001;


   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
