`include "CorrectoHam8B/CorrectoHam8B.v"
`include "GParidad_8B/GParidad.v"

module topHamm(
    input wire[7:0] COD_Inicial,
    output wire[11:0] COD_Final
);

wire [11:0]codigo;

GParidad CODPar(
    .Entrada(COD_Inicial),
    .Salida(codigo)
);

CorrectoHam8B CODCorr(
    .COD(codigo),
    .COD_C(COD_Final)
);



endmodule