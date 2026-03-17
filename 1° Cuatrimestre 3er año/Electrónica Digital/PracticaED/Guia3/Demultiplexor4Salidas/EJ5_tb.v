`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module EJ5_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// Entradas al módulo
reg [1:0] S_sim;
reg D_sim;

//Salida

wire[3:0] C_sim;

//-- Instantiate the unit to test
EJ5 UUT (  
        .S(S_sim),
        .D(D_sim),
        .C(C_sim)
         );

integer i;

initial begin
  
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, EJ5_tb);
    D_sim = 1'b1;

    for (i=0;i<4;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        S_sim = i;
    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
