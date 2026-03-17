
.global _start 
 
.section .vectors, "ax" 
_start: 
    j app_main        # Salto a la función principal 
 
.section .text 
app_main: 
    # Inicialización del stack pointer 
    la sp, _stack_end 
     
    # Operaciones aritméticas básicas 
    li a0, 15          # a0 = 15 
    li a1, 7           # a1 = 7 
     
    # Suma: a2 = a0 + a1 
    add a2, a0, a1     # a2 = 22 
     
    # Resta: a3 = a0 - a1 
    sub a3, a0, a1     # a3 = 8 
     
    # Operaciones lógicas 
    and a4, a0, a1     # AND: 15 & 7 = 7 
    or a5, a0, a1      # OR: 15 | 7 = 15 
    xor a6, a0, a1     # XOR: 15 ^ 7 = 8 
     
    # Bucle infinito 
    j . 
 
 
.section .text 
.global _start 
 
_start: 
    #Aca va nuestro código, empecemos con el punto 1 de la guia 
“Guía Práctica Programacion  nº 1 – ASM”