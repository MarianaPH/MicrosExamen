#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
  
    GOTO    START

MAIN_PROG CODE                      ; let linker place main program

START

i equ 0x29
j equ 0x30
 num1 equ 0x31
 num2 equ 0x32
 num3 equ 0x33
 num4 equ 0x34
 num5 equ 0x35
 num6 equ 0x36
 num7 equ 0x37
 num8 equ 0x38
 num9 equ 0x39
 num0 equ 0x40
 numero0 equ 0x20
 numero1 equ 0x41
 numero2 equ 0x42
 numero3 equ 0x43
 numero4 equ 0x44
 numero5 equ 0x45
 numero6 equ 0x46
 numero7 equ 0x47
 numero8 equ 0x48
 numero9 equ 0x49
 con equ 0x50
 aux equ 0x51
 aux1 equ 0x52
 
 
START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    MOVLW d'255'
    MOVWF TRISA 
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    BCF STATUS,RP1
    BCF STATUS,RP0
    BCF PORTC,1
    BCF PORTC,0
    
INITLCD
    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
    
    clrf PORTA
    movlw b'11110000'  ;Set RA1 as input and RA0,RA2,RA3 as output
    tris PORTA
     
INICIO	
    
    BSF PORTE,1
    BCF PORTE,0
    
    CLRF numero1
    CLRF numero2
    CLRF numero3
    CLRF numero4
    CLRF numero5
    CLRF numero6
    CLRF numero7
    CLRF numero8
    
    CLRF num1
    CLRF num2
    CLRF num3
    CLRF num4
    CLRF num5
    CLRF num6
    CLRF num7
    CLRF num8
    CLRF num9
    CLRF num0
    clrf numero0
    
    CLRF con
    
    CLRF aux
    
    MOVLW d'9'
    MOVWF numero1
    MOVLW d'2'
    MOVWF numero2
    MOVLW d'2'
    MOVWF numero3
    MOVLW d'6'
    MOVWF numero4
    MOVLW d'5'
    MOVWF numero5
    MOVLW d'0'
    MOVWF numero6
    MOVLW d'0'
    MOVWF numero7
    MOVLW d'3'
    MOVWF numero8
    
    MOVLW d'0'
    MOVWF num1
    MOVLW d'0'
    MOVWF num2
    MOVLW d'0'
    MOVWF num3
    MOVLW d'0'
    MOVWF num4
    MOVLW d'0'
    MOVWF num5
    MOVLW d'0'
    MOVWF num6
    MOVLW d'0'
    MOVWF num7
    MOVLW d'0'
    MOVWF num8
    MOVLW d'0'
    MOVWF num9
    MOVLW d'0'
    MOVWF num0
    MOVLW d'0'
    MOVWF numero0
    
    

    MOVLW d'8'
    MOVFW con
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode
    CALL time
    
    MOVLW 'P'		;message1
    MOVWF PORTD
    CALL exec
    MOVLW 'A'
    MOVWF PORTD
    CALL exec
    MOVLW 'S'
    MOVWF PORTD
    CALL exec
    MOVLW 'S'
    MOVWF PORTD
    CALL exec
    MOVLW ':'
    MOVWF PORTD
    CALL exec
    MOVLW '9'
    MOVWF PORTD
    CALL exec
    MOVLW '2'
    MOVWF PORTD
    CALL exec
    MOVLW '2'
    MOVWF PORTD
    CALL exec
    MOVLW '6'
    MOVWF PORTD
    CALL exec
    MOVLW '5'
    MOVWF PORTD
    CALL exec
    MOVLW '0'
    MOVWF PORTD
    CALL exec
    MOVLW '0'
    MOVWF PORTD
    CALL exec
    MOVLW '3'
    MOVWF PORTD
    CALL exec

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC1		;LCD position 
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTC,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTD
    CALL exec
    MOVLW 'L'
    MOVWF PORTD
    CALL exec
    MOVLW 'A'
    MOVWF PORTD
    CALL exec
    MOVLW 'V'
    MOVWF PORTD
    CALL exec
    MOVLW 'E'
    MOVWF PORTD
    CALL exec
    MOVLW ':'
    MOVWF PORTD
    CALL exec
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xD1	;LCD position 
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTC,0		;data mode
    CALL time
    
   
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC7		;LCD position 
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTC,0		;data mode
    CALL time
       
    CALL Buscar
     
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x81		;LCD position
    MOVWF PORTD
    CALL exec    
    GOTO INICIO

    exec
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
    RETURN
        
    Buscar  
    CALL BuscaA
    CALL BuscaB
    CALL BuscaC
    CALL BuscaD
    
    BuscaA
    BSF PORTA, 3
    BTFSC PORTA,4
    CALL uno
    BTFSC PORTA,5
    CALL dos
    BTFSC PORTA,6
    CALL tres
    BCF PORTA, 3
    return
    
    BuscaB
    BSF PORTA, 2
    BTFSC PORTA,4
    CALL cuatro
    BTFSC PORTA,5
    CALL cinco
    BTFSC PORTA,6
    CALL seis
    BCF PORTA, 2
    return
    
    BuscaC
    BSF PORTA, 1
    BTFSC PORTA,4
    CALL siete
    BTFSC PORTA,5
    CALL ocho
    BTFSC PORTA,6
    CALL nueve
    BCF PORTA, 1
    return
    
    BuscaD
    BSF PORTA, 0
    BTFSC PORTA,5
    CALL cero
    BTFSC PORTA,6
    CALL gato
    BCF PORTA, 0
   
    GOTO Buscar
    
    uno
    MOVLW d'1'
    MOVWF num1
    DECFSZ con
    CALL timedos
    CALL Iuno
    
    dos
    MOVLW d'2'
    MOVWF num2
    DECFSZ con
    CALL timedos
    CALL Idos
    
    tres
    MOVLW d'3'
    MOVWF num3
    DECFSZ con
    CALL Itres

    cuatro
    MOVLW d'4'
    MOVWF num4
    DECFSZ con
    CALL timedos
    CALL Icuatro

    cinco
    MOVLW d'5'
    MOVWF num5
    DECFSZ con
    CALL timedos
    CALL Icinco

    seis
    MOVLW d'6'
    MOVWF num6
    DECFSZ con
    CALL timedos
    CALL Iseis
 
    siete
    MOVLW d'7'
    MOVWF num7
    DECFSZ con
    CALL timedos
    CALL Isiete

    ocho
    MOVLW d'8'
    MOVWF num8
    DECFSZ con
    CALL timedos
    CALL Iocho

    nueve
    MOVLW d'9'
    MOVWF num9
    DECFSZ con
    CALL timedos
    CALL Inueve

    cero
    MOVLW d'0'
    MOVWF num0
    DECFSZ con
    CALL timedos
    CALL Icero
    
    gato
    CALL comp
    
    Iuno
    MOVLW '1'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Idos
    MOVLW '2'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Itres
    MOVLW '3'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Icuatro
    MOVLW '4'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Icinco
    MOVLW '5'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Iseis
    MOVLW '6'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Isiete
    MOVLW '7'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Iocho
    MOVLW '8'
    MOVWF PORTD
    CALL timedos
    CALL exec
    CALL timedos
    GOTO Buscar
    Inueve
    MOVLW '9'
    MOVWF PORTD
    call timedos
    CALL exec
    call timedos
    GOTO Buscar
    Icero
    MOVLW '0'
    MOVWF PORTD
    call timedos
    CALL exec
    call timedos
    GOTO Buscar
  
    comp
   
    CALL acceso
    
    acceso
    
    MOVFW num9
    XORWF numero1,1
    BTFSC numero1,0
    CALL errorr
    BTFSC numero1,1
    CALL errorr
    BTFSC numero1,2
    CALL errorr
    BTFSC numero1,3
    CALL errorr
    BTFSC numero1,4
    CALL errorr
    BTFSC numero1,5
    CALL errorr
    BTFSC numero1,6
    CALL errorr
    BTFSC numero1,7
    CALL errorr
    
    
    MOVFW num2
    XORWF numero2,1
    BTFSC numero2,0
    CALL errorr
    BTFSC numero2,1
    CALL errorr
    BTFSC numero2,2
    CALL errorr
    BTFSC numero2,3
    CALL errorr
    BTFSC numero2,4
    CALL errorr
    BTFSC numero2,5
    CALL errorr
    BTFSC numero2,6
    CALL errorr
    BTFSC numero2,7
    CALL errorr
    
    

    MOVFW num2
    XORWF numero3,1
    BTFSC numero3,0
    CALL errorr
    BTFSC numero3,1
    CALL errorr
    BTFSC numero3,2
    CALL errorr
    BTFSC numero3,3
    CALL errorr
    BTFSC numero3,4
    CALL errorr
    BTFSC numero3,5
    CALL errorr
    BTFSC numero3,6
    CALL errorr
    BTFSC numero3,7
    CALL errorr
    
    

    MOVFW num6
    XORWF numero4,1
    BTFSC numero4,0
    CALL errorr
     BTFSC numero4,1
    CALL errorr
     BTFSC numero4,2
    CALL errorr
     BTFSC numero4,3
    CALL errorr
     BTFSC numero4,4
    CALL errorr
     BTFSC numero4,5
    CALL errorr
     BTFSC numero4,6
    CALL errorr
     BTFSC numero4,7
    CALL errorr
    
   
    MOVFW num5
    XORWF numero5,1
    BTFSC numero5,0
    CALL errorr
    BTFSC numero5,1
    CALL errorr
    BTFSC numero5,2
    CALL errorr
    BTFSC numero5,3
    CALL errorr
    BTFSC numero5,4
    CALL errorr
    BTFSC numero5,5
    CALL errorr
    BTFSC numero5,6
    CALL errorr
    BTFSC numero5,7
    CALL errorr
    

    MOVFW num0
    XORWf numero6,1
    BTFSC numero6,0
    CALL errorr
    BTFSC numero6,1
    CALL errorr
    BTFSC numero6,2
    CALL errorr
    BTFSC numero6,3
    CALL errorr
    BTFSC numero6,4
    CALL errorr
    BTFSC numero6,5
    CALL errorr
    BTFSC numero6,6
    CALL errorr
    BTFSC numero6,7
    CALL errorr
    
    MOVFW num0
    XORWf numero7,1
    BTFSC numero7,0
    CALL errorr
    BTFSC numero7,1
    CALL errorr
    BTFSC numero7,2
    CALL errorr
    BTFSC numero7,3
    CALL errorr
    BTFSC numero7,4
    CALL errorr
    BTFSC numero7,5
    CALL errorr
    BTFSC numero7,6
    CALL errorr
    BTFSC numero7,7
    CALL errorr
    

    MOVFW num3
    XORWf numero8,1
    BTFSC numero8,0
    CALL errorr
    BTFSC numero8,1
    CALL errorr
    BTFSC numero8,2
    CALL errorr
    BTFSC numero8,3
    CALL errorr
    BTFSC numero8,4
    CALL errorr
    BTFSC numero8,5
    CALL errorr
    BTFSC numero8,6
    CALL errorr
    BTFSC numero8,7
    CALL errorr
    
 
    
    MOVFW num7
    XORWf numero0,1
    BTFSC numero0,0
    CALL errorr
    BTFSC numero0,1
    CALL errorr
    BTFSC numero0,2
    CALL errorr
    BTFSC numero0,3
    CALL errorr
    BTFSC numero0,4
    CALL errorr
    BTFSC numero0,5
    CALL errorr
    BTFSC numero0,6
    CALL errorr
    BTFSC numero0,7
    CALL errorr
    
    MOVFW num8
    XORWf numero0,1
    BTFSC numero0,0
    CALL errorr
    BTFSC numero0,1
    CALL errorr
    BTFSC numero0,2
    CALL errorr
    BTFSC numero0,3
    CALL errorr
    BTFSC numero0,4
    CALL errorr
    BTFSC numero0,5
    CALL errorr
    BTFSC numero0,6
    CALL errorr
    BTFSC numero0,7
    CALL errorr
    
    MOVFW num4
    XORWf numero0,1
    BTFSC numero0,0
    CALL errorr
    BTFSC numero0,1
    CALL errorr
    BTFSC numero0,2
    CALL errorr
    BTFSC numero0,3
    CALL errorr
    BTFSC numero0,4
    CALL errorr
    BTFSC numero0,5
    CALL errorr
    BTFSC numero0,6
    CALL errorr
    BTFSC numero0,7
    CALL errorr
    
    MOVFW num1
    XORWf numero0,1
    BTFSC numero0,0
    CALL errorr
    BTFSC numero0,1
    CALL errorr
    BTFSC numero0,2
    CALL errorr
    BTFSC numero0,3
    CALL errorr
    BTFSC numero0,4
    CALL errorr
    BTFSC numero0,5
    CALL errorr
    BTFSC numero0,6
    CALL errorr
    BTFSC numero0,7
    CALL errorr
    
    
    acceso1
    
    BSF PORTE,0
    BCF PORTE,1
    
    BCF PORTC,0 ;reset
    MOVLW 0x01
    MOVWF PORTD
    BSF PORTC,1 ;exec
    CALL time
    BCF PORTC,1
    CALL time
    
    CALL timedos
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC1		;LCD position 
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTC,0		;data mode
    CALL time
    
    MOVLW 'A'		;message1
    MOVWF PORTD
    CALL exec
    MOVLW 'C'
    MOVWF PORTD
    CALL exec
    MOVLW 'C'
    MOVWF PORTD
    CALL exec
    MOVLW 'E'
    MOVWF PORTD
    CALL exec
    MOVLW 'S'
    MOVWF PORTD
    CALL exec
    MOVLW 'O'
    MOVWF PORTD
    CALL exec
    
    
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    
    BCF PORTC,0 ;reset
    MOVLW 0x01
    MOVWF PORTD
    BSF PORTC,1 ;exec
    CALL time
    BCF PORTC,1
    CALL time   
    GOTO INITLCD
    

    errorr    
    BCF PORTC,0 ;reset
    MOVLW 0x01
    MOVWF PORTD
    BSF PORTC,1 ;exec
    CALL time
    BCF PORTC,1
    CALL time
    
    CALL timedos
    
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC1		;LCD position 
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTC,0		;data mode
    CALL time
    
    BSF PORTC,0		;data mode
    CALL time

    MOVLW 'E'		;message1
    MOVWF PORTD
    CALL exec
    MOVLW 'R'
    MOVWF PORTD
    CALL exec
    MOVLW 'R'
    MOVWF PORTD
    CALL exec
    MOVLW 'O'
    MOVWF PORTD
    CALL exec
    MOVLW 'R'
    MOVWF PORTD
    CALL exec
    
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    CALL timedos
    
    BCF PORTC,0 ;reset
    MOVLW 0x01
    MOVWF PORTD
    BSF PORTC,1 ;exec
    CALL time
    BCF PORTC,1 
    CALL time
    goto INITLCD

    time
    CLRF i
    MOVLW d'10'
    MOVWF j
loop    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO loop
    RETURN
       
    timedos
    CLRF i
    MOVLW d'450'
    MOVWF j
loopi   
    MOVLW d'250'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO loopi
    RETURN
    
    timetres
    CLRF i
    MOVLW d'450'
    MOVWF j
loopj   
    MOVLW d'250'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO loopj
    RETURN
    END