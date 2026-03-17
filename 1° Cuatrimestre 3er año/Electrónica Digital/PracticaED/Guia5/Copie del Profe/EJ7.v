module BR(
    input clk,
    input [1:0] a1,
    input [1:0] a2,
    input [1:0] a3,
    input [5:0] wd3,
    input we,
    output reg [5:0] rd1,
    output reg [5:0] rd2
);

reg [5:0] s_Reg [5:0];
 
genvar  i;
for(i=0;i<6;i+=1) begin
    initial $dumpvars(0,s_Reg[i]);
end


always @(*) begin
    rd1 = s_Reg[a1]; //A1 elige el registro que pasa a la salida
    rd2 = s_Reg[a2];
end


always (posedge clk) begin
    if (we) begin 
        s_Reg[a3] = wd3; //Pongo el dato en w3, pongo una ubicacion de donde voy a guardar el registro y se guarda
    end
end

//Uso el a3 para cargar datos - Leo con el a1 a2

endmodule

