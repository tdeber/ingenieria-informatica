module EJ4(
    input wire[3:0] Bin,
    output reg[3:0] BCD_dec,
    output reg[3:0] BCD_uni
);


always @(*) begin
    
    case(Bin)

        4'd0: begin BCD_dec=4'd0; BCD_uni=4'd0; end
        4'd1: begin BCD_dec=4'd0; BCD_uni=4'd1; end
        4'd2: begin BCD_dec=4'd0; BCD_uni=4'd2; end
        4'd3: begin BCD_dec=4'd0; BCD_uni=4'd3; end
        4'd4: begin BCD_dec=4'd0; BCD_uni=4'd4; end
        4'd5: begin BCD_dec=4'd0; BCD_uni=4'd5; end
        4'd6: begin BCD_dec=4'd0; BCD_uni=4'd6; end
        4'd7: begin BCD_dec=4'd0; BCD_uni=4'd7; end
        4'd8: begin BCD_dec=4'd0; BCD_uni=4'd8; end
        4'd9: begin BCD_dec=4'd0; BCD_uni=4'd9; end
        4'd10: begin BCD_dec=4'd1; BCD_uni=4'd0; end
        4'd11: begin BCD_dec=4'd1; BCD_uni=4'd1; end
        4'd12: begin BCD_dec=4'd1; BCD_uni=4'd2; end
        4'd13: begin BCD_dec=4'd1; BCD_uni=4'd3; end
        4'd14: begin BCD_dec=4'd1; BCD_uni=4'd4; end
        4'd15: begin BCD_dec=4'd1; BCD_uni=4'd5; end
        default : begin BCD_dec=4'd15; BCD_uni = 4'd15; end
    endcase
end



endmodule