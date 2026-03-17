`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module contador_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg sclk = 0;
always #0.5 sclk = ~sclk;

// Entradas al módulo
reg sreset, sup,sdown;
// Salida del display
wire[2:0] scount;

//-- Instantiate the unit to test
contador UUT (
 .clk(sclk),
 .reset(sreset),
 .up(sup),
 .down(sdown),
 .count(scount)
);



initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, contador_tb);

  // Inicialización
  sclk = 0;
  sreset = 1;
  sup = 0;
  sdown = 0;

  #5
  sclk=1;
  sreset=0;
  
  sup=1;
  #1
  sup=1;
  #1
  sup=1;
  #1
  sup=1;
  #1
  sup=1;
  #1
  sup=1;
  #1
  sup=1;

  #1
  sup=1; //Aca seria el 8
  #1
  sup=0;
  #5

  sdown=1;
  #1
  sdown=1;
  #1

  sdown=0;
  sup=0;
  #1
  sdown=1;
  sup=1;
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
