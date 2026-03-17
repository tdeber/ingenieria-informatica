`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module GParidad_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [7:0] CodEntrada;

//-- Instantiate the unit to test
GParidad UUT (  
        .Entrada(CodEntrada)    
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, GParidad_tb);

    CodEntrada = 8'b10110010;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
