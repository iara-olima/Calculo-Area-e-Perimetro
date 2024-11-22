section .data
    traco db '---------------------------------------------------------------',0xa
    msgtraco equ $ - traco

    erro db 'Nao eh permitido numero negativo', 0xa
    msgerro equ $ - erro

	erro_triangulo db 'Triangulo invalido', 0xa
	msgerrotriangulo equ $ - erro_triangulo

    info db 'CALCULO DO PERÍMETRO E DA ÁREA (OBS: DIGITE 3 ALGARISMOS)',0xa
    msginfo equ $ - info

    lado1 db 'Informe lado 1: ', 0xa
    msglado1 equ $ - lado1

    lado2 db 'Informe lado 2: ', 0xa
    msglado2 equ $ - lado2

    lado3 db 'Informe lado 3: ', 0xa
    msglado3 equ $ - lado3

    lado4 db 'Informe lado 4: ', 0xa
    msglado4 equ $ - lado4

    raio db 'Informe o raio: ', 0xa
    msgraio equ $ - raio

    area db 'Área: ', 0xa
    msgarea equ $ - area

    perimetro db 'Perímetro: ', 0xa
    msgperimetro equ $ - perimetro

    equilatero db 'Triangulo Equilatero!', 0xa
    msgequilatero equ $ - equilatero

    isosceles db 'Triangulo Isosceles!', 0xa
    msgisosceles equ $ - isosceles

    escaleno db 'Triangulo Escaleno!', 0xa
    msgescaleno equ $ - escaleno

    retangulo db 'Retangulo!', 0xa
    msgretangulo equ $ - retangulo

section .bss
    valor1 resb 4
    valor2 resb 4
    valor3 resb 4
    valor4 resb 4

    var1 resb 1
    result resb 10

section .text
    global _start

_start:
    ; ==============[imprime inicio]=============== ;
    mov eax, 4
    mov ebx, 1
    mov ecx, traco
    mov edx, msgtraco
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, info
    mov edx, msginfo
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, traco
    mov edx, msgtraco
    int 0x80

    ; ==============[coleta valores (lado)]=============== ;

    ; PRINT + COLETA LADO 1 ;

    le_lado1:
    mov eax, 4
    mov ebx, 1
    mov ecx, lado1
    mov edx, msglado1
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, valor1
    mov edx, 8
    int 0x80

    ; verifica se o numero não é negativo
    mov al,[valor1]
    cmp al,'-'
    jne input_valido1

    mov eax, 4
    mov ebx, 1
    mov ecx, erro
    mov edx, msgerro
    int 0x80
    jmp le_lado1

    input_valido1:
    ; continua com a coleta dos outros lados

    ; PRINT + COLETA LADO 2 ;
    le_lado2:
    mov eax, 4
    mov ebx, 1
    mov ecx, lado2
    mov edx, msglado2
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, valor2
    mov edx, 8
    int 0x80

    ; verifica se o numero não é negativo
    mov al,[valor2]
    cmp al,'-'
    jne input_valido2

    mov eax, 4
    mov ebx, 1
    mov ecx, erro
    mov edx, msgerro
    int 0x80
    jmp le_lado2

    input_valido2:
    ; continua com a coleta dos outros lados

    ; PRINT + COLETA LADO 3 ;
    le_lado3:
    mov eax, 4
    mov ebx, 1
    mov ecx, lado3
    mov edx, msglado3
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, valor3
    mov edx, 8
    int 0x80

    ; verifica se o numero não é negativo
    mov al,[valor3]
    cmp al,'-'
    jne input_valido3

    mov eax, 4
    mov ebx, 1
    mov ecx, erro
    mov edx, msgerro
    int 0x80
    jmp le_lado3

    input_valido3:
    ; continua com a coleta dos outros lados

    ; PRINT + COLETA LADO 4 ;
    le_lado4:
    mov eax, 4
    mov ebx, 1
    mov ecx, lado4
    mov edx, msglado4
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, valor4
    mov edx, 8
    int 0x80

    ; verifica se o numero não é negativo
    mov al,[valor4]
    cmp al,'-'
    jne input_valido4

    mov eax, 4
    mov ebx, 1
    mov ecx, erro
    mov edx, msgerro
    int 0x80
    jmp le_lado4

    input_valido4:

	;soma os valores e verifica se da zero
	mov eax,[valor1]
	add eax,[valor2]
	add eax,[valor3]
	add eax,[valor4]
	cmp eax, 0
	je calculo_esfera
	mov al,[valor4]
	cmp al, 0
	je valida_triangulo
    ; ==============[AJUSTA VALORES (teste)]=============== ;

    ; ==============[Valida triangulo]=============== ;
valida_triangulo:
mov eax,1
	int 0x80
    ; ==============[Caso esfera]=============== ;
calculo_esfera:
    mov eax, 4
    mov ebx, 1
    mov ecx, raio
    mov edx, msgraio
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, valor1
    mov edx, 8
    int 0x80

    ; finaliza o sistema;
    mov eax, 1
    int 0x80

    ; ==============[Caso triangulo]=============== ;
calculo_triangulo:
    ; finaliza o sistema;
    mov eax, 1
    int 0x80

    ; ==============[Caso retangulo/quadrado]=============== ;
calculo_retangulo:
    ; finaliza o sistema;
    mov eax, 1
    int 0x80

    ; ==============[Finalização + subrotinas]=============== ;
clr_registradores:
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    mov eax, 1 ; finaliza o sistema
    int 0x80

