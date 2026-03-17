`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ9_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] bcd_input;

//-- Instantiate the unit to test
EJ9 UUT (  
        .A(bcd_input[3]),
        .B(bcd_input[2]), 
        .C(bcd_input[1]), 
        .D(bcd_input[0])     
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ9_tb);


    for (i=0;i<16;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        bcd_input = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
