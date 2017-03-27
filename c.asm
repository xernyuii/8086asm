stack	segment stack
	dw 512 dup(?)
stack	ends
data	segment
	db 7,8,48 dup(6)
	max db ?
	min db ?
	result db 0
		;在数据段定义数据
data	ends
code	segment 
	assume cs:code,ds:data,ss:stack
start:	mov ax,data
	mov ds,ax

	mov ax,0
	mov cx,50
	mov di,0
	again:
		mov bx,0
		mov bl,[di]
		add di,1
		add ax,bx
		loop again
		
		mov bl,50
		div bl
		mov result,al

		mov di,50
	max2:
		sub di,1
		mov cx,50
		mov si,0
		mov al,[di]
	max1:
		cmp al,[si]
		jb max2
		add si,1
		loop max1
		mov max,al

		mov di,50
	min2:
		sub di,1
		mov cx,50
		mov si,0
		mov al,[di]
	min1:
		cmp al,[si]
		jnb min2
		add si,1
		loop min1
		mov min,al
	

	over:
		
		mov ax,30h
		mov cx,min
		add cx,ax
		lea dx,cx
		mov ah,9
		int 21h
		

		lea dx,max
		mov ax,30h
		add dx,ax
		mov ah,9
		int 21h
				

		lea dx,result
		mov ax,30h
		add dx,ax
		mov ah,9
		int 21h


		;在代码段填入指令序列
	mov ah,4ch
	int 21h
		;子程序代码
code	ends
	end start
