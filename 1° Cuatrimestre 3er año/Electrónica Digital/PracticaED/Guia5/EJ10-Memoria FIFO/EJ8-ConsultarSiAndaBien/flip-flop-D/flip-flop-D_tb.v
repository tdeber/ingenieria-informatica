`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module flipflopD_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation

// Entradas al módulo
reg sD;
reg sclk = 0;
always #0.5 sclk = ~sclk;
reg sreset, sset, senable;

// Salida del display


//-- Instantiate the unit to test
flipflopD UUT (  
        .D(sD), //el .A es el boton del .pcf, y el A dentro es la entrada del modulo (lo de arriba)
        .clk(sclk),
        .reset(sreset),
        .set(sset),
        .enable(senable) 
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, flipflopD_tb);
    #1
    sD = 0;
    sreset=0;
    sset=0;
    senable=1;
    
    for (i=0;i<3;i=i+1)begin
      #1
      sD = ~sD;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
