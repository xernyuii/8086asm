stack	segment stack
	dw 512 dup(?)
stack	ends
data	segment

table dw l1,l2,l3,l4,l5,l6,l7
S1 db 'MONDAY$'
S2 db 'TUESDAY$'
S3 db 'WEDNESDAY$'
S4 db 'THURSDAY$'
S5 db 'FRIDAY$'
S6 db 'SATURDAY$'
S7 db 'SUNDAY$'
		;在数据段定义数据
data	ends
code	segment 
	assume cs:code,ds:data,ss:stack
start:	mov ax,data
	mov ds,ax
start1:
	mov ah,08h
	int 21h
	sub al,30h
	dec al
	shl al,1
	xor ah,ah
	mov bx,ax
	jmp table[bx]
start2:
	mov ah,9
	int 21h
disp1:
	jmp start2
l1:
	lea dx,s1
	jmp over
l2:
	lea dx,s2
	jmp over
l3:
	lea dx,s3
	jmp over
l4:
	lea dx,s4
	jmp over
l5:
	lea dx,s5
	jmp over

l6:
	lea dx,s6
	jmp over
l7:
	lea dx,s7
	jmp over

over:
	mov ah,9
	int 21h
		;在代码段填入指令序列
	mov ah,4ch
	int 21h
		;子程序代码
code	ends
	end start
