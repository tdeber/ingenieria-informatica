module EJ3(

input wire[3:0] BCD_in,
output wire[9:0] decimal_out
);

reg[9:0] dec_aux;

always @(*) begin

    case(BCD_in)
        4'b0000 : dec_aux = 10'b1000000000;
        4'b0001 : dec_aux = 10'b0100000000;
        4'b0010 : dec_aux = 10'b0010000000;
        4'b0011 : dec_aux = 10'b0001000000;
        4'b0100 : dec_aux = 10'b0000100000;
        4'b0101 : dec_aux = 10'b0000010000;
        4'b0110 : dec_aux = 10'b0000001000;
        4'b0111 : dec_aux = 10'b0000000100;
        4'b1000 : dec_aux = 10'b0000000010;
        4'b1001 : dec_aux = 10'b0000000001;
        default: dec_aux=10'b0000000000;
    endcase
end

assign decimal_out = dec_aux;

endmodule