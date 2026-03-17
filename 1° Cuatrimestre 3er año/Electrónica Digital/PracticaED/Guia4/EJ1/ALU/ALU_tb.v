`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module ALU_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg A,B;
reg[2:0] cod;

//-- Instantiate the unit to test
ALU UUT (  
        .OP1(A),
        .OP2(B), 
        .codigo(cod)    
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, ALU_tb);

    cod = 3'b001;
    A=1;
    B=0;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
