module EJ5(
    input wire[3:0] ED, //Entrada de Datos (Seria un solo valor)
    input wire[1:0] ES, //Entradas de Seleccion de Datos (Y aca todas las combinaciones)
    output wire f
);

assign f = (ED[0] & ~ES[1] & ~ES[0]) |
            (ED[1] & ~ES[1] & ES[0]) |
            (ED[2] & ES[1] & ~ES[0]) |
            (ED[3] & ES[1] & ES[0]);

endmodule


//Ejemplo para el ED=4'b0100

//ES ED F
//00 0  0
//01 0  0
//10 1  1
//11 0  0