`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module estacionamiento_top_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg sclk = 0;
always #1 sclk = ~sclk;

// Entradas al módulo
reg sreset, sa,sb;
// Salida del display
wire[2:0] scount;

//-- Instantiate the unit to test
estacionamiento_top UUT (
  .clk(sclk),
  .reset(sreset),
  .a(sa),
  .b(sb),
 .count(scount)
);



initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, estacionamiento_top_tb);

  // Inicializacion
  sclk = 0;
  sreset = 1;
  sa = 0; sb = 0;
  #5000;
  sreset = 0;

  // Simular ingreso de 2 autos
  repeat (8) begin
    #2000000 sa = 1; sb = 0;  // 10
    #2000000 sa = 1; sb = 1;  // 11
    #2000000 sa = 0; sb = 1;  // 01
    #2000000 sa = 0; sb = 0;  // 00 -> ingreso
    #10000000;
  end
#5
// Simular salida de 1 auto
  #2000000 sa = 0; sb = 1;  // 01
  #2000000 sa = 1; sb = 1;  // 11
  #2000000 sa = 1; sb = 0;  // 10
  #2000000 sa = 0; sb = 0;  // 00 -> egreso
#10000000;
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
