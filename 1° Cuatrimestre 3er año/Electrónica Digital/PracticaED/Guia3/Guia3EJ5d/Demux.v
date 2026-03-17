module EJ5(
     input wire D, //Dato
     input wire [1:0] S, //Entradas de Seleccion S0 S1
     output reg [3:0] C //Canales de Salida, C0 C1 C2 C3
    );
    
    always @(*) begin 
        C = 4'b0000;
        case(S) 
            2'b00: C[0] = D;
            2'b01: C[1] = D;
            2'b10: C[2] = D;
            2'b11: C[3] = D;
        endcase
    end


endmodule
