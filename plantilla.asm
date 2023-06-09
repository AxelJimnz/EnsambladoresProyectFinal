
.data segment				 
datasegment
data segment				 
;Variables
tecla db 0 
Vtecla BD 0 
7tecla Wd 0 
tecla db 0 
 pkey db "press any key...$"
    var1 db 'hola'
	 pkey db "press any key...$
    var2 dw 0
simbolo db 045H
simbolo db 45H
simbolo db 45
ends

.code segment
code
mov ah, 1 ;Leer un caracter de la entrada estandar
int 21h ;Llamada al sistema operativo (DOS)
mov tecla, al
mov ah, 2 ;imprime un simbolo a la consola
mov dl, simbolo ;el caracter a mostrar, en este caso la E
int 21h ;Llamada al DOS

inc tecla
mov ah, 7 ;NO imprime un simbolo a la consola
mov dl, tecla ; 
int 21h ;Llamada al DOS
ret
;ah = 1 guarda caracter en al
;ah = 2 escribe un caracter en la consola. El ascii del cacacter a imprimir se pone el dl
;AH = 7 es igual a el ah=2 pero el resultado no se ve en pantalla 
;ah = 9 imprime una cadena en la consola. Considera el caracter $ como fin de cadena.
;La direccion de la cadena se expresa en 
mov msg[2], 34H
mov dx, offset msg 
mov ah, 9
int 21h
ret
msg db "hello world $"
lectura:
 mov ah,7
 int 21h
 mov tecla, al
 cmp al,13
 jz fin:
cmp tecla, 122 ;si tecla es mayor a 122 entonces ir a fin3 (tecla > 122)
ja fin3
cmp tecla,96 ;si tecla no es mayor a 96 ir a fin3 (tecla <= 96)
jng fin3
sub tecla, 32 ;si es 'a' hasta 'z' entonces restarle 32
fin3: 
mov ah,2
add ax, var1
mov dl,tecla
int 21h
jmp lectura  
INTO 
INTO DH  DX 
CLI 
CLI AX CL
CLC 
CLC AX CL
STI
STI AX CL
CMPSW
CMPSW SS CL
AAM 
AAM BX  BL
MOV
MOV AX  BX
LDS
LDS AX  BX
MUL BX
MUL BL SS
DEC BX
DEC DATO[DI], DH
DIV BX
DIV BX CL
IDIV BX
IDIV BX CL
ROR BX  AL
ROR CL  DX
SAR AX
SAR CL  DX
JGE LEER:
JGE AX DH 
JNA LEER1:
JNA BL CX 
JS LEER2:
JS CL AX 
JNS LEER3:
JNS AX BH 
JA LEER4:
JA DX CH 
JAE LEER5:
JAE BL DX
LOOPNE LEER5:
LOOPNE BL DX
fin:
ends

.stack segment				 
 dw   128  dup(0)			 
 dw   128  dupy(0)	
 
section .text
    global _start

_start:
    ; DAA: Decimal Adjust Accumulator
    ; Ajusta el contenido del registro AL despu�s de una operaci�n de suma o resta en BCD.
    ; Esta instrucci�n ajusta los d�gitos decimales y el flag de acarreo.
    mov al, 0x49     
    daa             
    
    ; DAS: Decimal Adjust for Subtraction
    ; Ajusta el contenido del registro AL despu�s de una operaci�n de resta en BCD.
    ; Esta instrucci�n ajusta los d�gitos decimales y el flag de acarreo.
    mov al, 0x32     
    das             

    ; PUSHF: Push Flags onto Stack
    ; Guarda los flags en la pila de la CPU.
    pushf 

    ; RET: Return from Procedure
    ; Devuelve el control a la instrucci�n siguiente a la llamada de la funci�n.
    ret           

    ; CLC: Clear Carry Flag
    ; Borra el flag de acarreo (Carry Flag).
    clc 

    ; CLD: Clear Direction Flag
    ; Borra el flag de direcci�n (Direction Flag).
    cld 

    ; DEC: Decrement by 1
    ; Resta 1 al valor del operando.
    mov eax, 10 
    dec eax

    ; IDIV: Signed Divide
    ; Divide un n�mero entero con signo en el registro DX:AX por un operando de 8 bits o 16 bits.
    mov eax, 20     
    mov ebx, 4      
    idiv ebx        

    ; IMUL: Signed Multiply
    ; Multiplica dos n�meros con signo y guarda el resultado en el registro de destino.
    mov eax, 5      
    imul ebx, 4     

    ; POP: Pop a Value from the Stack
    ; Saca un valor de la pila de la CPU y lo guarda en el operando.
    pop ecx         

    ; CMP: Compare Two Operands
    ; Compara dos operandos y ajusta los flags de la CPU en consecuencia.
    mov eax, 10   
    cmp eax, 5      

    ; LES: Load Far Pointer
    ; Carga un puntero largo en un registro de segmento y un registro de desplazamiento.
    les eax, [ebx] 

    ; RCL: Rotate Through Carry Left
    ; Rota los bits hacia la izquierda a trav�s del flag de acarreo (Carry Flag).
    mov eax, 0xFF   
    rcl eax, 1      

    ; XCHG: Exchange Register/Memory with Register
    ; Intercambia el contenido de un registro o una ubicaci�n de memoria con otro registro.
    mov eax, 10     
    mov ebx, 20     
    xchg eax, ebx

    ; JB: Jump if Below
    ; Salta a la etiqueta especificada si el flag de acarreo (Carry Flag) est� activo.
    mov eax, 5
    mov ebx, 10
    cmp eax, ebx
    jb etiqueta  

    ; JE: Jump if Equal
    ; Salta a la etiqueta especificada si el flag de igualdad (Zero Flag) est� activo.
    mov eax, 5
    cmp eax, 5
    je etiqueta   

    ; JLE: Jump if Less or Equal
    ; Salta a la etiqueta especificada si el flag de menos o igual (Less or Equal Flag) est� activo.
    mov eax, 5
    cmp eax, 10
    jle etiqueta   

    ; JNL: Jump if Not Less
    ; Salta a la etiqueta especificada si el flag de no menos (Not Less Flag) est� activo.
    mov eax, 5
    cmp eax, 5
    jnl etiqueta    

    ; JNS: Jump if Not Sign
    ; Salta a la etiqueta especificada si el flag de no signo (Not Sign Flag) est� activo.
    mov eax, 5
    cmp eax, 0
    jns etiqueta   

    ; JS: Jump if Sign
    ; Salta a la etiqueta especificada si el flag de signo (Sign Flag) est� activo.
    mov eax, -5
    cmp eax, 0
    js etiqueta 

etiqueta:
    ; C�digo adicional aqu�...

section .data
    ; Datos aqu�...

section .bss
    ; Variables no inicializadas aqu�... 
ends



