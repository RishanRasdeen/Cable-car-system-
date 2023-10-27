 list	p=16F877A
#include	"p16f877a.inc"
	


LCD	equ	0X22	
		
		
	org	0x00

	
	
START
	
	
	
	bsf	STATUS,5
	
	clrf	TRISC			
	movlw	b'11111111'
	movwf	TRISB
	clrf	TRISD
	
	
	movlw	b'00000111'
	movwf	OPTION_REG
	
	bcf	STATUS,5
	
	clrf	PORTC
	call	DELAY_100ms
	
DISPLAY_MAIN
	
	movlw	0X38
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	0X0C
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
		
STOP1
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'S'
	movwf	LCD
	call	WRITE
	movlw	'T'
	movwf	LCD
	call	WRITE
	movlw	'A'
	movwf	LCD
	call	WRITE
	movlw	'T'
	movwf	LCD
	call	WRITE
	movlw	'I'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	'N'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00110001'
	movwf	LCD
	call	WRITE

K1	
	btfsc	PORTB,1
	goto	N1
	call	FULL_STEP_MOTOR_CONTROL_CW_2
N1
	btfsc	PORTB,2
	goto	K1
	call	FULL_STEP_MOTOR_CONTROL_CW_3
	
	
STOP2
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'S'
	movwf	LCD
	call	WRITE
	movlw	'T'
	movwf	LCD
	call	WRITE
	movlw	'A'
	movwf	LCD
	call	WRITE
	movlw	'T'
	movwf	LCD
	call	WRITE
	movlw	'I'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	'N'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00110010'
	movwf	LCD
	call	WRITE

K2	
	btfsc	PORTB,0
	goto	N2
	call	FULL_STEP_MOTOR_CONTROL_CCW_1
N2
	btfsc	PORTB,2
	goto	K2
	call	FULL_STEP_MOTOR_CONTROL_CW_3
	
	

STOP3
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'S'
	movwf	LCD
	call	WRITE
	movlw	'T'
	movwf	LCD
	call	WRITE
	movlw	'A'
	movwf	LCD
	call	WRITE
	movlw	'T'
	movwf	LCD
	call	WRITE
	movlw	'I'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	'N'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00110011'
	movwf	LCD
	call	WRITE

K3	
	btfsc	PORTB,0
	goto	N3
	call	FULL_STEP_MOTOR_CONTROL_CCW_1
N3
	btfsc	PORTB,1
	goto	K3
	call	FULL_STEP_MOTOR_CONTROL_CCW_2
	
	
	
COMMAND
	bcf	PORTD,7
	movf	LCD,0
	movwf	PORTC
	call	DELAY_1.5ms
	bsf	PORTD,6
	call	DELAY_1.5ms
	bcf	PORTD,6
	return
WRITE
	bsf	PORTD,7
	movf	LCD,0
	movwf	PORTC
	call	DELAY_1.5ms
	bsf	PORTD,6
	bcf	PORTD,6
	return

;	
DELAY_1.5ms
   
	movlw	d'1'
	movwf	0x21
L2	movlw	d'150'
	movwf	TMR0
	bcf	INTCON,2
L1	btfss	INTCON,2
	goto	L1
	decfsz	0x21,1
	goto	L2
	return 
;   
   
DELAY_100ms
   
	movlw	d'8'
	movwf	0x20
L3	movlw	d'11'
	movwf	TMR0
	bcf	INTCON,2
L4	btfss	INTCON,2
	goto	L4
	decfsz	0x20,1
	goto	L3
	return 
   
FULL_STEP_MOTOR_CONTROL_CW_2
 
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'G'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	b'00110010'
	movwf	LCD
	call	WRITE
	
	
A1	
	btfsc	PORTB,5
	goto	STOP2
	movlw	b'00001100'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00000110'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00000011'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00001001'
	movwf	PORTD
	call	DELAY_100ms
	goto	A1
	return
 
FULL_STEP_MOTOR_CONTROL_CCW_1

	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'G'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	b'00110001'
	movwf	LCD
	call	WRITE

A2	
	btfsc	PORTB,4
	goto	STOP1
	movlw	b'00000011'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00000110'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00001100'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00001001'
	movwf	PORTD
	call	DELAY_100ms
	goto	A2
	return
 
FULL_STEP_MOTOR_CONTROL_CW_3
 
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'G'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	b'00110011'
	movwf	LCD
	call	WRITE
A3	
	btfsc	PORTB,6
	goto	STOP3
	movlw	b'00001100'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00000110'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00000011'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00001001'
	movwf	PORTD
	call	DELAY_100ms
	goto	A3
	return
 
FULL_STEP_MOTOR_CONTROL_CCW_2
 
	movlw	0X01
	movwf	LCD
	call	DELAY_1.5ms
	call	COMMAND
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	b'00100000'
	movwf	LCD
	call	WRITE
	movlw	'G'
	movwf	LCD
	call	WRITE
	movlw	'O'
	movwf	LCD
	call	WRITE
	movlw	b'00110010'
	movwf	LCD
	call	WRITE
A4	
	btfsc	PORTB,5
	goto	STOP2
	movlw	b'00000011'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00000110'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00001100'
	movwf	PORTD
	call	DELAY_100ms
	movlw	b'00001001'
	movwf	PORTD
	call	DELAY_100ms
	goto	A4
	return
 
   end