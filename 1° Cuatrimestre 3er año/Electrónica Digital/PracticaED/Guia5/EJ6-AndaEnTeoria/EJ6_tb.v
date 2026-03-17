`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ6_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sset;
reg sreset;
reg senable;
reg[3:0] sD;

reg sclk = 0;
always #0.5 sclk = ~sclk;

// Salida del display


//-- Instantiate the unit to test
EJ6 UUT (  
        .D_in(sD),
        .clk(sclk),
        .set(sset),
        .reset(sreset),
        .enable(senable) 
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ6_tb);

  sreset = 1; senable = 0; sD = 4'b0000; #10;
  sreset = 0;

  // Primer carga
  sD = 4'b1010; senable = 1; #10;

  // Segunda carga
  sD = 4'b1111; #10;

 // Desactivo enable
  senable = 0; sD = 4'b0000; #10;

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
