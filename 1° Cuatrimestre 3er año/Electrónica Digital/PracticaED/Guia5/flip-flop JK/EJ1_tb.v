`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ1_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg [1:0] sJK;
reg sclk = 0;
always #0.5 sclk = ~sclk;

// Salida del display


//-- Instantiate the unit to test
EJ1 UUT (  
        .J(sJK[1]), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .K(sJK[0]),
        .clk(sclk)    
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ1_tb);

    for (i=0;i<4;i=i+1)begin
      #1
      sJK = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
