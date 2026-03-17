module EJ8(
    input wire[3:0] Entrada,
    input wire LT, BI,
    output wire [6:0] Salida
);


reg[6:0]  aux;


always @(*) begin

    case (Entrada)
            4'b0001: aux = 7'b0110000;
            4'b0010: aux = 7'b1101101;
            4'b0011: aux = 7'b1111001;
            4'b0100: aux = 7'b0110011;
            4'b0101: aux = 7'b1011011;
            4'b0110: aux = 7'b1011111;
            4'b0111: aux = 7'b1110000;
            4'b1000: aux = 7'b1111111;
            4'b1001: aux = 7'b1110011;
            default: aux = 7'b1111110;
        endcase

    if (BI == 1'b0) begin
        aux = 7'b0000000;
    end

    if ((LT == 1'b0) && (BI == 1'b1)) begin
        aux = 7'b1111111;
    end

    

end
 assign Salida = aux;




endmodule