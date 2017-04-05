
stack	segment stack
	dw 512 dup(?)
stack	ends
data	segment
		;在数据段定义数据
data	ends
code	segment 
	assume cs:code,ds:data,ss:stack
start:	mov ax,data
	mov ds,ax
		;在代码段填入指令序列
	mov ah,4ch
	int 21h
		;子程序代码
code	ends
	end start
