module flipflopJK(
    input wire J,
    input wire K,
    input wire clk,
    input wire preset,
    input wire reset,
    input wire enable,
    output wire Q
);

reg aux=0; //Estado inicial? Osea seria mi Q(t)

always @(posedge clk or posedge preset or posedge reset) begin
        if (preset) begin aux <= 1; end
        if (reset) begin aux <= 0; end
        if (enable) begin
            case ({J, K})
            2'b00: aux <= aux;        // Sin cambio
            2'b01: aux <= 0;        // Reset
            2'b10: aux <= 1;        // Set
            2'b11: aux <= ~aux;     
            //Son no bloqueantes -> cambian en el prox ciclo
            endcase
        end
        

    end

assign Q = aux;

endmodule
