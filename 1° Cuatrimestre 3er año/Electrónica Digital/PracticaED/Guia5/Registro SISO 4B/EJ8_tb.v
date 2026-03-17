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

reg sdir, sset, sreset,senable;

// Salida del display


//-- Instantiate the unit to test
EJ8 UUT (  
        .D(sD), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .clk(sclk),
        .dir(sdir),
        .set(sset),
        .reset(sreset),
        .enable(senable)   
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ8_tb);
  // Inicialización
    sD = 0;
    sdir = 0; // Primero desplazamos hacia la derecha
    sset = 0;
    sreset = 0;
    senable = 1;

    // Reseteamos registro
    sreset = 1;
    #1
    sreset = 0;

    // === Desplazamiento derecha ===
    // Cargamos los bits: 1, 0, 1, 1 → bit más nuevo entra por FF0
    sD = 1; #1
    sD = 0; #1
    sD = 1; #1
    sD = 1; #1

    // Ahora desplazamos 4 ciclos sin nueva entrada (rellenamos con ceros)
    sD = 0;
    #4

    // === Cambiamos dirección ===
    sdir = 1; // Ahora hacia la izquierda
    sD = 1;   // Inyectamos un nuevo bit desde el MSB
    #1
    sD = 0; #1
    sD = 1; #1
    sD = 1; #1

    // Desplazamos con ceros
    sD = 0;
    #4

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
