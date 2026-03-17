module EJ3(
    input wire[7:0] ocho_lineas,
    output wire[2:0] bin_nat,
    output reg valid
);

reg[2:0] aux;


always @(*) begin
    valid = 1'b1;
    casex(ocho_lineas)
        8'b00000001: aux=3'b000;
        8'b0000001x: aux=3'b001;
        8'b000001xx: aux=3'b010;
        8'b00001xxx: aux=3'b011;
        8'b0001xxxx: aux=3'b100;
        8'b001xxxxx: aux=3'b101;
        8'b01xxxxxx: aux=3'b110;
        8'b1xxxxxxx: aux=3'b111;
        default: begin
            aux=3'b000;
            valid=1'b0;
        end
    endcase
end

assign bin_nat=aux;

endmodule