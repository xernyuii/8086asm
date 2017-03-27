stack	segment stack
	dw 512 dup(?)
stack	ends
data	segment
X DW 1
Y DW 3
Z DW 8
V DW 9
SUM1 DW ?
SUM2 DW ?
		;在数据段定义数据
data	ends
code	segment 
	assume cs:code,ds:data,ss:stack
start:	mov ax,data
	mov ds,ax
	
	mov AX,X
	imul y
	mov cx,ax
	mov bx,dx
	mov ax,z
	cwd
	add cx,ax
	adc bx,dx
	sub cx,540
	sbb bx,0
	mov ax,v
	cwd
	sub ax,cx
	sbb dx,bx
	idiv x
	mov sum1,ax
	mov sum2,dx
		;在代码段填入指令序列
	mov ah,4ch
	int 21h

		;子程序代码
code	ends
	end start
