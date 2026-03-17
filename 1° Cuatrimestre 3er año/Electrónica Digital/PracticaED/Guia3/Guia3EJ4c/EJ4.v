module EJ4(
    input wire[3:0] COD,
    output wire[6:0] Cod_Ham
);

//Bits de Paridad
wire P1,P2,P3; 

//Bits de Dato
wire D1 = COD[0];
wire D2 = COD[1];
wire D3 = COD[2];
wire D4 = COD[3];

//Paridad Par

assign P1 = (D1 ^ D2 ^ D4);
assign P2 = (D1 ^ D3 ^ D4);
assign P3 = (D2 ^ D3 ^ D4);

//Codigo de Hamm con Paridad Par

assign Cod_Ham = {P1,P2,D1,P3,D2,D3,D4};

endmodule

//0001 0010 0011 0100 0101 0110 0111 

//P1   P2    D1   P3   D2   D3   D4
