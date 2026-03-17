`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module flipflopJK_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sJ;
reg sK;
reg spreset;
reg sreset;
reg senable;

reg sclk = 0;
always #0.5 sclk = ~sclk;

// Salida del display


//-- Instantiate the unit to test
flipflopJK UUT (  
        .J(sJ), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .K(sK),
        .clk(sclk),
        .preset(spreset),
        .reset(sreset),
        .enable(senable) 
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, flipflopJK_tb);

    // Inicialización
    sJ = 0; sK = 0;
    spreset = 0;
    sreset = 0;
    senable = 1;

    // Esperamos un poco
    #1;

    // Prueba 1: Set (J=1, K=0)
    sJ = 1; sK = 0;
    #2;

    // Prueba 2: Reset (J=0, K=1)
    sJ = 0; sK = 1;
    #2;

    // Prueba 3: Toggle (J=1, K=1)
    sJ = 1; sK = 1;
    #2;

    // Prueba 4: Sin cambio (J=0, K=0)
    sJ = 0; sK = 0;
    #2;

    // Prueba 5: enable = 0 → no debería cambiar
    senable = 0;
    sJ = 1; sK = 1;
    #2;

    // Prueba 6: preset asincrónico
    spreset = 1;
    #1;
    spreset = 0;

    // Prueba 7: reset asincrónico
    sreset = 1;
    #1;
    sreset = 0;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
