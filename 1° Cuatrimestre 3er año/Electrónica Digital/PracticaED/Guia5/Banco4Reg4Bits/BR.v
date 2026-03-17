`include "Registro-PP-4B/EJ.V"
module BR(
    input wire clk,     //Reloj
    input wire a1,      //Direccion del registro que quiero leer
    input wire a2,      //Idem
    input wire a3,      //Direccion del registor donde se escribe
    input wire we,      //Me habilida a escribir
    input wire [3:0] wd3, //Datos a escribir
    output wire [3:0] rd1,//Dato leido (a1)
    output wire [3:0] rd2 //Dato leido (a2)
);

reg [3:0] s_Reg [3:0]; //4 registros de 4 bits

always @(*) begin
    rd1 = s_Reg[a1];
    rd2 = s_Reg[a2];
end

always @(posedge clk) begin
    if (we) begin 
        s_Reg[a3] = wd3;
    end
end


endmodule

