`include "flipflopD/flip-flop-D.v"
module EJ6(
    input wire [3:0] D, //Entada de datos
    input wire clk,     //Reloj
    input wire enable,
    input wire reset,
    input wire set,
    output wire [3:0]Q  //Salida del registro
);

//Consultar sobre el lanch que pide el ejercicio GUI5EJ6
//No estaria implementado ya directamente? El Q ya seria el lanch



genvar i;
generate
    for(i=0;i<4;i=i+1)begin : FF_GEN
        flipflopD ff(
            .clk(clk),
            .reset(reset),
            .set(set),
            .enable(enable),
            .D(D[i]),
            .Q(Q[i])
        );
    end
endgenerate



endmodule

