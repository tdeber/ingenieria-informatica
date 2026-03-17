`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module comparador_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [3:0] E1;
reg [3:0] E2;

//-- Instantiate the unit to test
comparador UUT (  
        .A(E1),
        .B(E2)  
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, comparador_tb);

    E2 = 4'b0110;
    E1 = 4'b0110;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
