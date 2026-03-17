module flipflopD(
    input wire D,
    input wire clk,
    output wire Q,
    input wire set,
    input wire reset,
    input wire enable
);

reg aux = 0; //Estado inicial? Osea seria mi Q(t)

always @(posedge clk or posedge set or posedge reset) begin
        if (reset) begin aux <= 0; end
        else if (set) begin aux <= 1; end
        else if (enable) begin aux <= D; end
    end

assign Q = aux;

endmodule

