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

    equilatero db 'Triangulo Equilatero', 0xa
    msgequilatero equ $ - equilatero

    isosceles db 'Triangulo Isosceles', 0xa
    msgisosceles equ $ - isosceles

    escaleno db 'Triangulo Escaleno', 0xa
    msgescaleno equ $ - escaleno

    retangulo db 'Retangulo', 0xa
    msgretangulo equ $ - retangulo
	
	quadrado db 'Quadrado', 0xa
    msgquadrado equ $ - quadrado

msgresult	db	10,"Resultado: "
lmsgresult	equ	$ - msgresult

float_n dq 6.28; Define o valor 6.28 como double-precision float

section .bss
    valor1 resd 1 ;resd reserva um double word
    valor2 resd 1
    valor3 resd 1
    valor4 resd 1
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
    mov ecx, 0x0
    mov ebx, 0x0

    mov bl, byte [valor1]     ; Primeiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0x64            ; Multiplica por 100
    mov ecx, ebx              ; Armazena em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor1+1]   ; Segundo dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0xa             ; Multiplica por 10
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor1+2]   ; Terceiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov [valor1], ecx         ; Armazena o valor convertido de volta em valor1

   mov ebx, 0x0

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
    mov ecx, 0x0
    mov ebx, 0x0

    mov bl, byte [valor2]     ; Primeiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0x64            ; Multiplica por 100
    mov ecx, ebx              ; Armazena em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor2+1]   ; Segundo dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0xa             ; Multiplica por 10
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor2+2]   ; Terceiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov [valor2], ecx         ; Armazena o valor convertido de volta em valor2


   mov ebx, 0x0

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
    mov ecx, 0x0
    mov ebx, 0x0

    mov bl, byte [valor3]     ; Primeiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0x64            ; Multiplica por 100
    mov ecx, ebx              ; Armazena em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor3+1]   ; Segundo dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0xa             ; Multiplica por 10
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor3+2]   ; Terceiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov [valor3], ecx         ; Armazena o valor convertido de volta em valor3
   mov ebx, 0x0


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
    mov ecx, 0x0
    mov ebx, 0x0

    mov bl, byte [valor4]     ; Primeiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0x64            ; Multiplica por 100
    mov ecx, ebx              ; Armazena em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor4+1]   ; Segundo dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0xa             ; Multiplica por 10
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor4+2]   ; Terceiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov [valor4], ecx         ; Armazena o valor convertido de volta em valor4


   mov ebx, 0x0

	;soma os valores e verifica se da zero
    mov eax, [valor1]
    add eax, [valor2]
    add eax, [valor3]
    add eax, [valor4]
    cmp eax, 0 ;n ta funcionando
    je le_raio

    ; verifica se valor4 é zero
    mov eax, [valor4]
    cmp eax, 0
    je valida_triangulo

    ; ==============[AJUSTA VALORES (teste)]=============== ;

    ; ==============[Valida triangulo]=============== ;
valida_triangulo:
mov eax,1
	int 0x80
    ; ==============[Caso esfera]=============== ;
le_raio:
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

    ; verifica se o numero não é negativo
    mov al,[valor1]
    cmp al,'-'
    jne input_validor

    mov eax, 4
    mov ebx, 1
    mov ecx, erro
    mov edx, msgerro
    int 0x80
    jmp le_raio

input_validor:
    mov ecx, 0x0
    mov ebx, 0x0

    mov bl, byte [valor1]     ; Primeiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0x64            ; Multiplica por 100
    mov ecx, ebx              ; Armazena em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor1+1]   ; Segundo dígito
    sub bl, '0'               ; Converte ASCII para decimal
    imul ebx, 0xa             ; Multiplica por 10
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov ebx, 0x0              ; Limpa ebx
    mov bl, byte [valor1+2]   ; Terceiro dígito
    sub bl, '0'               ; Converte ASCII para decimal
    add ecx, ebx              ; Adiciona ao valor em ecx

    mov [valor1], ecx         ; Armazena o valor convertido de volta em valor1

calculo_esfera:
;ta fazendo a mutiplicaçao mas nao consegui mostrar o resultado para conferir
fild dword [valor1]
fld qword [float_n]
fmulp st1,st0
fistp dword [valor1] ; Transfere o resultado para valor1 
mov eax, [valor1]
jmp organizar
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


