`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ5_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] EntradaDeDato;
reg [1:0] EntradaDeSelector;

//Saluda
reg Salida;

//-- Instantiate the unit to test
EJ5 UUT (  
        .ED(EntradaDeDato),
        .ES(EntradaDeSelector),
        .f(Salida)
         );

integer i;


initial begin
  EntradaDeDato = 4'b0100;
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ5_tb);


    for (i=0;i<4;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        EntradaDeSelector = i;

    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
