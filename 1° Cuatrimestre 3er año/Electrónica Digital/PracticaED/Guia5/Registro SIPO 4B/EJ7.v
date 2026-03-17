`include "flipflopD/flip-flop-D.v" 
module EJ7(
    input wire D,   //Entrada en Serie
    input wire clk,
    output wire [3:0]Q, //Salida Paralela

    input set,
    input reset,
    input enable
);

wire [3:0] q_int;

//FF0: Recibe el dato en serie
flipflopD ff0(
            .clk(clk),
            .set(set),
            .reset(reset),
            .enable(enable),
            .D(D),
            .Q(q_int[0])
        );


//FF1: Recibe la salida (Q) de FF0 
flipflopD ff1(
            .clk(clk),
            .set(set),
            .reset(reset),
            .enable(enable),
            .D(q_int[0]),
            .Q(q_int[1])
        );

//FF2: Recibe la salida (Q) de FF1 
flipflopD ff2(
            .clk(clk),
            .set(set),
            .reset(reset),
            .enable(enable),
            .D(q_int[1]),
            .Q(q_int[2])
        );

//FF3: Recibe la salida (Q) de FF2
flipflopD ff3(
            .clk(clk),
            .set(set),
            .reset(reset),
            .enable(enable),
            .D(q_int[2]),
            .Q(q_int[3])
        );

assign Q = q_int;

        


endmodule

