`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ7_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sD;
reg sset;
reg sreset;
reg senable;

reg sclk = 0;
always #0.5 sclk = ~sclk;

// Salida del display


//-- Instantiate the unit to test
EJ7 UUT (  
        .S_in(sD),
        .clk(sclk),
        .set(sset),
        .reset(sreset),
        .enable(senable) 
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ7_tb);
  sreset = 1; senable = 0; sD = 0; #10;
  sreset = 0; senable = 1;

  // Carga de 4 bits seriales: 1 0 1 1 (sD entra a LSB primero)
  sD = 1; #1;
  sD = 0; #1;
  sD = 1; #1;
  sD = 1; #1;

  // Dejo enable en 0
  senable = 0;
  sreset = 1;

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
