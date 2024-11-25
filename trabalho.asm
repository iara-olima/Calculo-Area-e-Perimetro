;Pendencias:
;calcular perimetro quadrado - feito
;calcular perimetro triangulo - feito
;calcular comprimento circulo
;calcular area quadrado
;calcular area triangulo
;calcular area circulo
; !!!! Mostrar resultados !!!!

; - Todos os direcionamentos estao feitos (eu acho) -

section .data
    traco db '---------------------------------------------------------------',0xa
    msgtraco equ $ - traco

invalido db 'Insercao Invalida', 0xa
msginvalido equ $ - invalido

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

    resultado_perimetro db 'Perímetro: ', 0xa
    msgperimetro equ $ - resultado_perimetro

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

resultado_area	db	10,"Area: "
msgresultadoarea equ	$ - resultado_area

float_n dq 6.28; Define o valor 6.28 como double-precision float

section .bss
    valor1 resd 1 ;resd reserva um double word
    valor2 resd 1
    valor3 resd 1
    valor4 resd 1
    area resb 10
	perimetro resb 10

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
    cmp eax, 0
    je le_raio

    ; verifica se valor4 é zero
    mov eax, [valor4]
    cmp eax, 0
    je valida_triangulo

; ===================[Verifica se é Retângulo]================= ; 
mov ax, [valor1] 
cmp ax, [valor3] 
jne verifica_invalido 
mov ax, [valor2] 
cmp ax, [valor4] 
jne verifica_invalido 
; Se os lados opostos são iguais, verificar se é um quadrado 
mov ax, [valor1] 
cmp ax, [valor2] 
jne imprime_retangulo 
mov ax, [valor2] 
cmp ax, [valor3] 
jne imprime_retangulo 
; É um quadrado 
mov eax, 4 
mov ebx, 1 
mov ecx, quadrado 
mov edx, msgquadrado 
int 0x80 
jmp calculo_quadrado 

imprime_retangulo: 
; É um retângulo 
mov eax, 4 
mov ebx, 1 
mov ecx, retangulo 
mov edx, msgretangulo 
int 0x80 
jmp calculo_retangulo

verifica_invalido: 
; Inserção inválida 
mov eax, 4 
mov ebx, 1 
mov ecx, invalido 
mov edx, msginvalido
int 0x80
mov eax,1
int 0x80

    ; ==============[Valida triangulo]=============== ;
valida_triangulo:
mov ax, [valor1]
add ax, [valor2]
cmp ax,[valor3]
jle erro_tri
mov ax,[valor1]
add ax,[valor3]
cmp ax,[valor2]
jle erro_tri
mov ax,[valor2]
add ax,[valor3]
cmp ax,[valor1]
jle erro_tri

 ; ===============[Classificacao triangulo]============= ;
tipo_triangulo: 
mov ax, [valor1] 
cmp ax, [valor2] 
jne verifica_isosceles 
mov ax, [valor2] 
cmp ax, [valor3] 
jne verifica_isosceles 
; Se todos os lados são iguais 
mov eax, 4 
mov ebx, 1
mov ecx, equilatero
mov edx, msgequilatero
int 0x80 
mov eax,1
int 0x80

verifica_isosceles: 
mov ax, [valor1] 
cmp ax, [valor2] 
je imprime_isosceles 
mov ax, [valor1] 
cmp ax, [valor3] 
je imprime_isosceles 
mov ax, [valor2] 
cmp ax, [valor3] 
je imprime_isosceles 
; Se todos os lados são diferentes 
mov eax, 4 
mov ebx, 1 
mov ecx, escaleno 
mov edx, msgescaleno 
int 0x80
mov eax,1
int 0x80

imprime_isosceles: 
; Se dois lados são iguais 
mov eax, 4  
mov ebx, 1 
mov ecx, isosceles 
mov edx, msgisosceles 
int 0x80
 ; ==============[Caso triangulo]=============== ;
calculo_triangulo:
mov ax,[valor1]
add ax,[valor2]
add ax,[valor3]
mov [perimetro],ax
    mov eax, 1
    int 0x80

erro_tri:
    mov eax, 4
    mov ebx, 1
    mov ecx, erro_triangulo
    mov edx, msgerrotriangulo
    int 0x80
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
;jmp organizar

    ; ==============[Caso retangulo/quadrado]=============== ;
calculo_retangulo:
mov eax,[valor1]
add eax,[valor2]
add eax,[valor3]
add eax,[valor4]
mov [perimetro],eax
mov eax,[valor1]
;mul eax,[valor4] -erro
mov [area],eax

    ; finaliza o sistema;
    mov eax, 1
    int 0x80

calculo_quadrado:
mov eax,[valor1]
;mul eax,4 - erro
mov [perimetro],eax
mov eax,[valor1]
;mul eax,[valor1] - erro

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


