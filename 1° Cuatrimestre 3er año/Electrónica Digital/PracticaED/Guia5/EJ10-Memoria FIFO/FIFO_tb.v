`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ8_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sD;
reg sclk = 0;
always #0.5 sclk = ~sclk;

reg sdir, spreset, sreset,senable;

// Salida del display


//-- Instantiate the unit to test
EJ8 UUT (  
        .D(sD), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .clk(sclk),
        .dir(sdir),
        .preset(spreset),
        .reset(sreset),
        .enable(senable)   
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ8_tb);
   // Inicialización
    sD = 0;
    sdir = 0;
    spreset = 0;
    sreset = 1;
    senable = 0;
    #1;

    sreset = 0;  // Liberamos reset
    senable = 1;

    // --- Desplazamiento hacia la izquierda (dir = 0)
    sdir = 0;
    sD = 1; #1;
    sD = 0; #1;
    sD = 1; #1;
    sD = 1; #1;

    // --- Aplicamos reset (pone Reg = 0000)
    senable = 0;
    spreset = 0;
    sreset = 1;
   











   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
