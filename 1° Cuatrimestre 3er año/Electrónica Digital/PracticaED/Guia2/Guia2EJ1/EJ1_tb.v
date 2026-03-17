`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ1_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [1:0] AB;

// Salida del display
// wire X;

//-- Instantiate the unit to test
EJ1 UUT (  
        .A(AB[1]), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .B(AB[0])     
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ1_tb);

    for (i=0;i<4;i=i+1)begin
      #1
      AB = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
