module EJ1(
    input wire J,
    input wire K,
    input wire clk,
    output wire Q
);

reg aux=0; //Estado inicial? Osea seria mi Q(t)

always @(posedge clk) begin
        case ({J, K})
            2'b00: aux <= aux;        // Sin cambio
            2'b01: aux <= 0;        // Reset
            2'b10: aux <= 1;        // Set
            2'b11: aux <= ~aux;     
            //Son no bloqueantes -> cambian en el prox ciclo
        endcase
    end

assign Q = aux;

endmodule
