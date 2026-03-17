module TPI(
    input wire clk,
    input wire reset,
    input wire a,
    input wire b,
    output reg ingreso,
    output reg egreso
);

reg [2:0] current_state, next_state;

//Les doy una posicion a mis 7 parametros
parameter S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011,
            S4 = 3'b100,
            S5 = 3'b101,
            S6 = 3'b110;

reg[1:0] ab;

//Utilizo ab y no {a,b} por un "error" en el next_state cuando usaba el testbench
always @(posedge clk, posedge reset) begin
    if(reset) begin
        current_state <= S0; 
        ab <= 2'b00;
    end else begin
        current_state <= next_state;
        ab <= {a,b};
    end
end




always @(*) begin
    ingreso = 0;
    egreso = 0;

    case (current_state)
        S0: begin
            case (ab)
                2'b10: next_state = S1;         //auto entrando
                2'b01: next_state = S4;         //auto saliendo
            default: next_state = S0;
            endcase
        end
        //------ESTADOS DE REGISTRO SECUENCIA DE INGRESO -------------------------------------------
        S1: begin 
            case (ab)
                2'b10: next_state = S1;         //no detecta cambios, permanezo en el mismo estado
                2'b11: next_state = S2;         //el auto abarca los dos sensores, cambio de estado
                default: next_state = S0;       //casos particulares de presencia de personas
            endcase
            end

        S2: begin
            case (ab)
                2'b00: next_state = S0;         //situacion de presencia de personas
                2'b01: next_state = S3;         //el auto sigue saliendo
                2'b10: next_state = S1;         //el auto puede haber retrocedido
                2'b11: next_state = S2;         //permanece en el mismo estado
            endcase
        end 

        S3: begin
            case (ab)
                2'b00: begin next_state = S0; ingreso = 1; end      //completa la secuencia de egreso
                2'b01: next_state = S3;                             //permanece en el mismo estado
                2'b11: next_state = S2;                             //el auto puede haber retrocedido
                2'b10: next_state = S0;                             //situacion persona
            endcase
        end

        //------ESTADOS DE REGISTRO SECUENCIAS DE EGRESO ---------------------------------------------
        S4: begin
            case (ab)
                2'b01: next_state = S4;                     //permanezco en el mismo estado
                2'b11: next_state = S5;                     //sigue secuencia de salida del auto
                default: next_state = S0;                   //contempla casos de presencia de personas
            endcase
        end

        S5: begin
            case (ab)
                2'b01: next_state = S4;                     //el auto puede haber retrocedido
                2'b10: next_state = S6;                     //continua la secuencia de salida
                2'b11:  next_state = S5;                    //permanece en el mismo estado
                default: next_state = S0;                    //contempla casos de presenciade personas
            endcase
        end
        S6: begin
           case (ab)
                2'b00: begin next_state = S0; egreso = 1; end        //termina secuencia de egreso
                2'b10: next_state = S6;                             //permanece en el mismo estado
                2'b11: next_state = S5;                             //el auto puede haber retrocedido
                default: next_state = S0;                           //contempla casos de presencia de personas
           endcase
        end
        default: next_state = S0;
    endcase
end
endmodule