module maquina_estado(
    input x,clk,reset,
    output z
);

parameter A=2'b00, B=2'b01, C = 2'b10, D=2'b11;
reg [1:0] current_state,next_state;


always @(posedge clk, posedge reset) begin
    if(reset) begin current_state <= A; 
    else current_state <= next_state;
    end
end

always @(current_state,x) begin
    z=0;
    case(current_state) 
        A : if (x == 1) next_state=B; else next_state = A;
        B : if (x == 0) next_state=C; else next_state = B;
        C : if (x == 0) next_state=D; else next_state = B;
        D : if (x == 0) next_state=A; else begin next_state = B; z=1; end

    endcase 

end 



endmodule;

