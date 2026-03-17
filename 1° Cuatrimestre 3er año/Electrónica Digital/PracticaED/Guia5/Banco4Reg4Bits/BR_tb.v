`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module BR_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sclk = 0;
always #0.5 sclk = ~sclk;

reg [3:0] sD;
reg senable;
reg sreset, sset;

// Salida del display


//-- Instantiate the unit to test
BR UUT (  
        .D(sD), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .clk(sclk),
        .enable(senable),
        .reset(sreset),
        .set(sset)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, BR_tb);
    
    //Inicializamos datos de entrada
    sD = 4'b0;
    senable = 1;
    sreset = 0;
    sset = 0;

    //Esperamos
    #1

    //Prueba 1: D = 1101 E=1
    sD = 4'b1101;

    #2
    sD = 4'b0010;

    #2
    senable = 0;
    sD = 4'b1111;

    #2
    sD=4'b1000;

    #2
    senable = 1;
    sD=4'b0101;
    


   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
