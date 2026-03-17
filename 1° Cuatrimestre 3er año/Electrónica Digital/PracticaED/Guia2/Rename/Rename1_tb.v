`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module Renam1_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] bcd_input;

// Salida del display de 7 segmentos
 //wire [6:0] seg_output;

//-- Instantiate the unit to test
Rename1 UUT (  
        .A(bcd_input[3]),
        .B(bcd_input[2]), 
        .C(bcd_input[1]), 
        .D(bcd_input[0])     
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, Rename1_tb);


    for (i=0;i<10;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        bcd_input = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
