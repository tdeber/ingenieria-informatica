module FIFO(
    input wire D,
    input wire dir,
    input wire clk,
    output reg Q,

    input wire preset,
    input wire reset,
    input wire enable
);

reg [3:0] Reg = 4'b0000; //Estado inicial -  seria mi Q(t)

always @(posedge clk or posedge reset or posedge preset) begin
    if (reset) begin Reg <= 4'b0000; Q = 0; end
    if (preset) begin Reg <= 4'b1111; Q = 1; end        
    if (enable) begin
        case (dir)
            1'b0 : begin Reg <= {Reg[2:0],D}; Q <= D; end
            1'b1 : begin Reg <= {D,Reg[3:1]}; Q<= D; end
        endcase
    end
    
end


endmodule

