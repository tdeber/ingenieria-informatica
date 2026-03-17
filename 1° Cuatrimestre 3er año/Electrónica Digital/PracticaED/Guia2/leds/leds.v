
module leds(
            input wire btn0,
            input wire btn1,
            input wire btn2,
            input wire btn3,
            output wire LED0,
            output wire LED1,
            output wire LED2,
            output wire LED3);

//assign LED0 = ~btn0;
//assign LED1 = ~btn1;
//assign LED2 = ~btn2;
//assign LED3 = ~btn3;

wire[3:0] bin = {~btn3,~btn2,~btn1,~btn0}; 
wire[3:0] ex3;

assign ex3 = bin + 4'b0011;

assign LED0 = ex3[0];

endmodule
