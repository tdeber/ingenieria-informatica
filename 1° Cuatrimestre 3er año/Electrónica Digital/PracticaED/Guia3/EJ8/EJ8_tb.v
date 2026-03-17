`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ8_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] BCD;
reg U;
reg D;

//-- Instantiate the unit to test
EJ8 UUT (  
        .Entrada(BCD),
        .LT(U),
        .BI(D)   
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ8_tb);
    U = 1'b1;
    D = 1'b1;

    for (i=0;i<10;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        BCD = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
