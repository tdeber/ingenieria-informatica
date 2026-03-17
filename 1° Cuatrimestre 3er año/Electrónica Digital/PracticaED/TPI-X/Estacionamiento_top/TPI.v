module TPI(
    input wire clk,
    input wire reset,
    input wire a,
    input wire b,
    output reg ingreso,
    output reg egreso
);

reg [2:0] current_state, next_state;

parameter S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011,
            S4 = 3'b100,
            S5 = 3'b101,
            S6 = 3'b110;

reg[1:0] ab;

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
                2'b10: next_state = S1;
                2'b01: next_state = S4;
            default: next_state = S0;
            endcase
        end

        S1: next_state = (ab == 2'b11) ? S2 : S0; //->Entiendo que estando en S1(10) o entra 11 o vuelvo al S0
        S2: next_state = (ab == 2'b01) ? S3 : S1;
        S3: begin
            if (ab == 2'b00) begin
                next_state = S0;
                ingreso = 1;    
            end else next_state = S3;
        end
        S4: next_state = (ab == 2'b11) ? S5 : S0;
        S5: next_state = (ab == 2'b10) ? S6: S4;
        S6: begin
            if(ab == 2'b00) begin
                next_state = S0;
                egreso = 1;
            end else next_state = S5;
        end
        default: next_state = S0;
    endcase


end




endmodule