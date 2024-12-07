section .data
traco db '---------------------------------------------------------------',0xa
msgtraco equ $ - traco

invalido db 'Insercao Invalida', 0xa
msginvalido equ $ - invalido

erro db 'Nao eh permitido numero negativo. Insira novamente: ', 0xa
msgerro equ $ - erro

erro_triangulo db 'Triangulo invalido', 0xa
msgerrotriangulo equ $ - erro_triangulo

info db 'CALCULO DO PERÍMETRO E DA ÁREA (OBS: DIGITE 3 ALGARISMOS)',0xa
msginfo equ $ - info

lado1 db 'Informe lado 1 (base, caso seja triangulo): ', 0xa
msglado1 equ $ - lado1

lado2 db 'Informe lado 2: ', 0xa
msglado2 equ $ - lado2

lado3 db 'Informe lado 3: ', 0xa
msglado3 equ $ - lado3

lado4 db 'Informe lado 4: ', 0xa
msglado4 equ $ - lado4

altura db 'Informe a altura: ', 0xa
msgaltura equ $ - altura

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

;float_n dq 6.28; Define o valor 6.28 como double-precision float

section .bss
input resd 1
valor1 resd 1 ;resd reserva um double word
valor2 resd 1
valor3 resd 1
valor4 resd 1
alt resd 1
perimetro resb 10
area resb 10
resultado resb 10

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
mov eax, 4
mov ebx, 1
mov ecx, lado1
mov edx, msglado1
int 0x80

call inputvalido
mov eax,[input]
mov [valor1],eax

    ; PRINT + COLETA LADO 2 ;
mov eax, 4
mov ebx, 1
mov ecx, lado2
mov edx, msglado2
int 0x80

call inputvalido
mov eax,[input]
mov [valor2],eax

    ; PRINT + COLETA LADO 3 ;
mov eax, 4
mov ebx, 1
mov ecx, lado3
mov edx, msglado3
int 0x80

call inputvalido
mov eax,[input]
mov [valor3],eax

    ; PRINT + COLETA LADO 4 ;
mov eax, 4
mov ebx, 1
mov ecx, lado4
mov edx, msglado4
int 0x80


call inputvalido
mov eax,[input]
mov [valor4],eax

; ================[Verificações para desvios]===========================
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
jne erro_invalido 
mov ax, [valor2] 
cmp ax, [valor4] 
jne erro_invalido 
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

erro_invalido: 
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
call calcula_perimetro
jmp organizar

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

call inputvalido
mov eax,[input]
mov [valor1],eax

calculo_esfera:


    ; ==============[Caso retangulo/quadrado]=============== ;
calculo_retangulo:
call calcula_perimetro
mov eax, 4
mov ebx, 1
mov ecx, resultado_perimetro
mov edx, msgperimetro
int 0x80
mov eax,[perimetro]
call organizar


mov eax,4
mov ebx,1
mov ecx, resultado_area
mov edx, msgresultadoarea
int 0x80

mov eax,[valor1]
mov ebx,[valor4]
imul eax,ebx
call organizar

mov eax,1
int 0x80
calculo_quadrado:
call calcula_perimetro
mov eax, 4
mov ebx, 1
mov ecx, resultado_perimetro
mov edx, msgperimetro
int 0x80
mov eax,[perimetro]
call organizar

mov eax,4
mov ebx,1
mov ecx, resultado_area
mov edx, msgresultadoarea
int 0x80

mov eax,[valor1]
imul eax,4 ;multiplica por 4
call organizar

mov eax,1
int 0x80

    ; ==============[Finalização + subrotinas]=============== ;
clr_registradores:
mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0
ret

inputvalido:
mov eax, 3
mov ebx, 0
mov ecx, input
mov edx, 8
int 0x80

;verifica se o numero eh negativo
mov al,[input]
cmp al,'-'
jne converte
erroneg:
mov eax,4
mov ebx,1
mov ecx,erro
mov edx,msgerro
int 0x80
jmp erroneg

converte:
mov ecx, 0x0
mov ebx, 0x0
mov bl, byte [input]     ; Primeiro dígito
sub bl, '0'               ; Converte ASCII para decimal
imul ebx, 0x64            ; Multiplica por 100
mov ecx, ebx              ; Armazena em ecx
mov ebx, 0x0              ; Limpa ebx
mov bl, byte [input+1]   ; Segundo dígito
sub bl, '0'               ; Converte ASCII para decimal
imul ebx, 0xa             ; Multiplica por 10
add ecx, ebx              ; Adiciona ao valor em ecx
mov ebx, 0x0              ; Limpa ebx
mov bl, byte [input+2]   ; Terceiro dígito
sub bl, '0'               ; Converte ASCII para decimal
add ecx, ebx              ; Adiciona ao valor em ecx
mov [input], ecx         ; Armazena o valor convertido de volta no input
ret

calcula_perimetro:
mov eax,[valor1]
add eax,[valor2]
add eax, [valor3]
add eax, [valor4]
mov [perimetro],eax

ret	

organizar:
; O RESULTADO DE TODAS AS OPERAÇÃO ESTÁ ARMAZENADO NO EAX.
; Nessa parte iremos organizar o resultado para podermos imprimir na tela, ou seja,
; pegaremos cada digíto dividindo por (100.000, 10.000, 1.000, 100, 10) e transformaremos em hexa.
; Em seguida, moveremos para o seu byte respectivo dentro do [result].

; EAX/100000
	mov edx, 0x0			; zera o edx para nao entrar na divisão
	mov ebx, 0x186A0		; move 100000 para ebx
	div ebx				; divide EAX/EBX
	add al, '0'			; transforma em hexa
	mov byte[resultado], al		; move para o resultado
	mov eax, edx			; move o resto para eax

; EAX/10000
	mov edx, 0x0			; zera o edx
	mov ebx, 0x2710			; move 10000 para ebx
	div ebx				; divide EAX/EBX (o EDX está zerado)
	add al, '0'			; transforma em hexa
	mov byte[resultado+1], al		; move para o resultado
	mov eax, edx			; move o resto para eax

; EAX/1000
	mov edx, 0x0			; zera o edx
	mov bx, 0x3E8			; move 1000 para bx
	div bx				; divide AX/BX (o DX está zerado)
	add al, '0'			; transforma em hexa
	mov byte[resultado+2], al		; move para o resultado
	mov ax, dx			; move o resto para ax

; AX/100
	mov edx, 0x0			; zera o edx
	mov bl, 0x64			; move 100 para bl
	div bl				; divide AX/BL
	add al, '0'			; transforma em hexa
	mov byte [resultado+3], al		; move para o resultado
	mov bl, ah			; move o resto para bl

; AL/10
	mov eax,0x0			; zera o eax
	mov al, bl			; move o resto (em bl) para al
	mov bl, 0xa			; move 10 para bl
	div bl				; divide AL/BL
	add al, '0'			; transforma em hexa	
	mov byte[resultado+4], al		; move para o resultado


; AH = RESTO
	add ah, '0'			; transforma em hexa	
	mov byte[resultado+5], ah		; move para o resultado


mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 6
	int 0x80	
ret
