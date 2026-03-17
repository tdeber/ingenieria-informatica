`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module restador_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [2:0] Entrada;

//-- Instantiate the unit to test
restador UUT (  
        .A(Entrada[2]),
        .B(Entrada[1]), 
        .Bin(Entrada[0])    
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, restador_tb);


    for (i=0;i<8;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        Entrada = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
