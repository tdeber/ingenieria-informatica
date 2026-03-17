module mux8(
    input wire[7:0] Ch,
    input wire[2:0] Selector,
    output wire SCh
);

assign SCh = Ch[Selector];

endmodule