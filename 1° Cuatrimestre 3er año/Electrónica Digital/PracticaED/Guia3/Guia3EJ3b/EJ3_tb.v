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
reg [3:0] BCD_sim;

//-- Instantiate the unit to test
EJ3 UUT (  
         .BCD_in(BCD_sim)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ3_tb);

        #1
        BCD_sim = 4'b0000;
        #1
        BCD_sim = 4'b0001;
        #1
        BCD_sim = 4'b0010;
        #1
        BCD_sim = 4'b0011;
        #1
        BCD_sim = 4'b0100;
        #1
        BCD_sim = 4'b0101;
        #1
        BCD_sim = 4'b0110;
        #1
        BCD_sim = 4'b0111;
        #1
        BCD_sim = 4'b1000;
        #1
        BCD_sim = 4'b1001;

  $finish;
end

endmodule
