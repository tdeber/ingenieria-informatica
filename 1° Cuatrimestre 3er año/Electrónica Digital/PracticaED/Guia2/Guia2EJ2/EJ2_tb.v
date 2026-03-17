`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ2_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [2:0] ABC;


//-- Instantiate the unit to test
EJ2 UUT (  
        .A(ABC[2]),
        .B(ABC[1]), 
        .C(ABC[0])     
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ2_tb);


    for (i=0;i<9;i++ ) begin
        #1
        ABC = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
