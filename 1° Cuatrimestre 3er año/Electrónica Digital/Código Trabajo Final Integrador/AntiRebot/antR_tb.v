`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module debouncer_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #1 clk = ~clk; // 50 MHz clock (ciclo cada 20ns)
//#1 equivalor a 100 ns
//Medio ciclo -> 100 ns
//Ciclo completo -> 200
reg btn_noisy;
wire btn_clean;

//Instancia del modulo
debouncer UUT(
  .clk(clk),
  .btn_noisy(btn_noisy),
  .btn_clean(btn_clean)
);



initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0,debouncer_tb);
    // Inicialización
    btn_noisy = 0;
    #100;

    // Rebote al presionar
    btn_noisy = 1;#2000000;
    btn_noisy = 0; #2000000;
    btn_noisy = 1;#200000;
    btn_noisy = 0;#200000;
    btn_noisy = 1; // finalmente se estabiliza
    #10000000;     // Esperamos 10ms = 10e6 ns = 500.000 ciclos de reloj

    // Rebote al soltar
    btn_noisy = 0; #200000;
    btn_noisy = 1; #200000;
    btn_noisy = 0; #200000;
    btn_noisy = 1; #200000;
    btn_noisy = 0; // finalmente se estabiliza
    #10000000;

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
