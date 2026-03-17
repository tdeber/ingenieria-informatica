module ContadorUD (
    input wire clk,
    input wire reset,
    input wire up,
    input wire down,
    output wire [2:0] count
);

reg [2:0] count_reg;

always @(posedge clk or posedge reset)
begin
    if (reset)
        count_reg <= 4'b0000;
    else if (up && !down && count < 3'd7)
        count_reg <= count_reg + 4'b0001;
    else if (down && !up && count > 3'd0)
        count_reg <= count_reg - 4'b0001;
end

assign count = count_reg;

endmodule