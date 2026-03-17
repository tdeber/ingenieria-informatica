`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ6_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] ABCD;
//-- Instantiate the unit to test
EJ6 UUT (  
        .A(ABCD[3]),
        .B(ABCD[2]), 
        .C(ABCD[1]), 
        .D(ABCD[0])     
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ6_tb);


    for (i=0;i<16;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        ABCD = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
