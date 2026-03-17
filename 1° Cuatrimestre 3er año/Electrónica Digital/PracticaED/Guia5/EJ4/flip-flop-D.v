module flipflopD(
    input wire D,
    input wire clk,
    input wire preset,  //Activo alto
    input wire reset,   //Activo alto
    input wire enable, //Señal de control
    output wire Q
);

reg aux = 0; //Estado inicial? Osea seria mi Q(t)

always @(posedge clk or posedge preset or posedge reset) begin

    if (reset) begin aux <= 0; end // El <= es que lo cambia en el prox ciclo
    else if (preset) begin aux <= 1; end
    else if (enable) begin aux <= D; end //Lo usamos para activar o desactivar el flipflop

end

assign Q = aux;

//En el sincrono el reset depende del clk osea
//always @(posedge clk) begin
//  if(reset) Q<=0
//  else Q<=D
//end


endmodule

