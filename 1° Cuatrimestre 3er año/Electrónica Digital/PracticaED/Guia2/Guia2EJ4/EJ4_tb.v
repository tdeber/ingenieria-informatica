`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ4_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [5:0] BCD;

//-- Instantiate the unit to test

EJ4 UUT (  
        .A(BCD[5]),
        .B(BCD[4]), 
        .C(BCD[3]), 
        .D(BCD[2]),
        .E(BCD[1]),
        .F(BCD[0])  
         );
integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ4_tb);


    for (i=0;i<64;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        BCD = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
