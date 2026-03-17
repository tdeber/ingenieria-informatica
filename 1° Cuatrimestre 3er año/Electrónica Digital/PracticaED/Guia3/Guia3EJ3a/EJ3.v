module EJ3(
     input wire [9:0] decimal_in,
     output wire [3:0]  BCD_out
    );
    

    reg [3:0] o_reg;

   always @(*) begin
    case (decimal_in)
        10'b0000000000:o_reg=4'b1111;
        10'b1000000000: o_reg=4'b0000;
        10'b0100000000: o_reg=4'b0001;
        10'b0010000000: o_reg=4'b0010;
        10'b0001000000: o_reg=4'b0011;
        10'b0000100000: o_reg=4'b0100;
        10'b0000010000: o_reg=4'b0101;
        10'b0000001000: o_reg=4'b0110;
        10'b0000000100: o_reg=4'b0111;
        10'b0000000010: o_reg=4'b1000;
        10'b0000000001: o_reg=4'b1001;
        default: o_reg = 4'b1111;
    endcase
end 

assign BCD_out = o_reg;

endmodule
