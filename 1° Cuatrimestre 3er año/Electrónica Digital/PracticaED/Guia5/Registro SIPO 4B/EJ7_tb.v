`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ7_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sD;
reg sclk = 0;
always #0.5 sclk = ~sclk;
reg sset, sreset,senable;

// Salida del display


//-- Instantiate the unit to test
EJ7 UUT (  
        .D(sD), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .clk(sclk),
        .set(sset),
        .reset(sreset),
        .enable(senable)
         );

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ7_tb);
    
    //Datos Iniciales
    sD = 0;
    senable = 1;
    sset = 0;
    sreset = 0;
    //Espero un tiempo
    #1
    sD = 1;

    #1
    sD = 1;
    #1
    sD = 0;
    #1
    sD = 1;

    #1

    senable=0;
    sreset = 1;

    #1

    sreset=0;
    sset =1;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
