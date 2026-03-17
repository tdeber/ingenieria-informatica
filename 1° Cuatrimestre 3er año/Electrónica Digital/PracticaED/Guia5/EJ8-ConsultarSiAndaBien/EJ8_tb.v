`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ8_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sD;
reg sdir;
reg sset;
reg sreset;
reg senable;

reg sclk = 0;
always #0.5 sclk = ~sclk;

// Salida del display


//-- Instantiate the unit to test
EJ8 UUT (  
        .S_in(sD),
        .dir(sdir),
        .clk(sclk),
        .set(sset),
        .reset(sreset),
        .enable(senable) 
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ8_tb);

  // Reset inicial
  sreset = 1; senable = 0; sdir = 0; sD = 0; #10;
  sreset = 0; senable = 1;

  // Desplazo a la izq: cargo 1010
  sD = 1; #1;
  sD = 0; #1;
  sD = 1; #1;
  sD = 0; #1;

  // Cambio de dirección
  sdir = 1;
  sD = 1; #1;
  sD = 0; #1;

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
