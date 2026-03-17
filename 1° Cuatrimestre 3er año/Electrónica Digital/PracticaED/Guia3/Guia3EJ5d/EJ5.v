'include "Demultiplexor4Salidas/DEMUX4.v"
'include "Multiplexor4Entradas/MUX4.v"

module transmisor(
    input wire[3:0] Entradas,
    input wire[1:0] Selector,
    output wire[3:0] Salidas
);

wire cable;

MUX4 mux(
    .ED(Entradas),
    .ES(Selector),
    .f(cable)
);

DEMUX4 demux(
    .D(cable),
    .S(Selector),
    .C(Salidas)
);



endmodule