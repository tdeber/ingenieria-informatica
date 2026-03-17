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
reg [7:0] ocho_in;

//-- Instantiate the unit to test
EJ3 UUT (  
        .ocho_lineas(ocho_in)   
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ3_tb);
  
  for(i=0;i<256;i++)begin
    #1
    ocho_in = i;
  end


  $finish;
end

endmodule
