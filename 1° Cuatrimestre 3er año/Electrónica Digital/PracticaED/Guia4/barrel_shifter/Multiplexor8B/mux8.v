module mux8(
    input wire d0,
    input wire d1,
    input wire d2,
    input wire d3,
    input wire d4,
    input wire d5,
    input wire d6,
    input wire d7,
    input wire[2:0] Selector,
    output wire SCh
);

always @(*) begin

    case(Selector)

        3'b000: SCh = d0;
        3'b001: SCh = d1;
        3'b010: SCh = d2;
        3'b011: SCh = d3;
        3'b100: SCh = d4;
        3'b101: SCh = d5;
        3'b110: SCh = d6;
        3'b111: SCh = d7;

    endcase
end

endmodule