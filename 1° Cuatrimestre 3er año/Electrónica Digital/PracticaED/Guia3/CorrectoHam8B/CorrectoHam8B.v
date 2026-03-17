module CorrectoHam8B(
    input wire[11:0] COD,
    output reg[11:0] COD_C
);

//Bits de Paridad

wire P1,P2,P3,P4;


// Tener en cuenta como yo declare el codigo 11:0 no 0:11 entonces arranco al revez
assign P1 = COD[11] ^ COD[9] ^ COD[7] ^ COD[5] ^ COD[3]^ COD[1]; //Se supone que si es PAR en 1 me da 0.
assign P2 = COD[10] ^ COD[9] ^ COD[6] ^ COD[5] ^ COD[2] ^ COD[1];
assign P3 = COD[8] ^ COD[7] ^ COD[6] ^ COD[5] ^ COD[0];
assign P4 = COD[4] ^ COD[3] ^ COD[2] ^ COD[1] ^ COD[0];

wire[3:0] error;
assign error = {P4,P3,P2,P1};

always @* begin
    COD_C = COD;
    if (error != 4'b0000 && error <= 12) begin
        COD_C[12-error] = ~COD[12-error];  // Tener en cuenta como yo declare el codigo 11:0 no 0:11 entonces arranco al revez
    end
end


endmodule

//  11  10    9    8    7    6    5    4    3    2    1   0
//0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 
// P1   P2   D1   P3   D2  D3    D4  P4    D5   D6   D7   D8