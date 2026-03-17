`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module mux8_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [7:0] Sim;
reg [2:0] S;

//-- Instantiate the unit to test
mux8 UUT (  
        .Ch(Sim),
        .Selector(S)    
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, mux8_tb);
    Sim = 8'b01101010;

    for (i=0;i<8;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        S = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
