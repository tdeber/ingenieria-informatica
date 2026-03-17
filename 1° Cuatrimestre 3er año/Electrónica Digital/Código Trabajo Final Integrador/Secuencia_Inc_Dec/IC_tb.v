`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module TPI_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg sclk = 0;
always #0.5 sclk = ~sclk;

// Entradas al módulo
reg sreset, sa,sb;
// Salida del display
wire singreso, segreso;
//-- Instantiate the unit to test
TPI UUT (
 .clk(sclk),
 .reset(sreset),
 .a(sa),
 .b(sb),
 .ingreso(singreso),
 .egreso(segreso)
);



initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, TPI_tb);

  // Inicialización
  sreset = 1; sa = 0; sb = 0;
  #5;
  sreset = 0;

     

        

  // Secuencia de egreso: 00 → 01 → 11 → 10 → 00
  #1; sa = 0; sb = 1; //01
  #1; sa = 1; sb = 1; //11
  #1; sa = 1; sb = 0; //10
  #1; sa = 0; sb = 0; //00 -> egreso 1


  // Secuencisa de ingreso: 00 → 10 → 11 → 01 → 00
  #1; sa = 1; sb = 0;  // 10
  #1; sa = 1; sb = 1;  // 11
  #1; sa = 0; sb = 1;  // 01
  #1; sa = 0; sb = 0;  // 00 → ingreso deberia ser 1
  #5;


  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
