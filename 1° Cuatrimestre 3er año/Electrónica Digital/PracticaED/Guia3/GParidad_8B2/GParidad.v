module GParidad(
    input wire[7:0] Entrada,
    output wire [11:0] Salida
);

//Bits de Dato
 wire D1,D2,D3,D4,D5,D6,D7,D8;
 assign D1 = Entrada[0];
 assign D2 = Entrada[1];
 assign D3 = Entrada[2];
 assign D4 = Entrada[3];
 assign D5 = Entrada[4];
 assign D6 = Entrada[5];
 assign D7 = Entrada[6];
 assign D8 = Entrada[7];

//Bits de Paridad

 wire P1,P2,P3,P4;

 assign P1 = (D1^D2^D4^D5^D7);
 assign P2 = (D1^D3^D4^D7);
 assign P3 = (D2^D3^D4^D8);
 assign P4 = (D5^D6^D7^D8);

//Cod Hamming

 assign Salida = {P1,P2,D1,P3,D2,D3,D4,P4,D5,D6,D7,D8};

endmodule
