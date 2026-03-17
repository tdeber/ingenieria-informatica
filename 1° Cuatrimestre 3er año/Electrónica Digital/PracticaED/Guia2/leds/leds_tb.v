//-------------------------------------------------------------------
//-- leds_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module leds_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//Instancias de botones (inputs)
  reg b0 ,b1,b2,b3;

//-- Leds port
wire l0, l1, l2, l3;

//-- Instantiate the unit to test
leds UUT (  
            .btn0(b0),
            .btn1(b1),
            .btn2(b2),
            .btn3(b3),
           .LED0(l0),
           .LED1(l1),
           .LED2(l2),
           .LED3(l3)
         );

integer i;
reg [3:0] entradas;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, leds_tb);


    for (i=0;i<16;i++ ) begin
        $display("Current loop # %0d",i);
        #1
        entradas = i;
        b0 = entradas[0];
        b1 = entradas[1];
        b2 = entradas[2];
        b3 = entradas[3];


    end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
