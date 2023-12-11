INCLUDE Irvine32.inc
INCLUDE MACROS.INC
includelib kernel32.lib
includelib user32.lib
includelib Winmm.lib
PlaySoundA PROTO,pszSound:PTR BYTE, hmod:DWORD, fdwSound:DWORD

.data

music1 BYTE "menu.wav",0
music2 byte "pacman.wav",0
music3 byte "gameover.wav",0
music4 byte "level3.wav",0
tempByte db ?
tempWord dw ?
 
;filehandling
buffersize = 117
arrLen = buffersize/13
filebuffer db buffersize dup(?)
filewritebuffer db buffersize dup(?) 
filename db "hiscore.txt",0
scores dw arrlen dup(?)


FileisEmpty db "AAAAA",' ', "0000", 0ah, "BBBBB", ' ',"0000", 0ah,"CCCCC",' ', "0000", 0ah, "DDDDD", ' ',"0000", 0ah,"EEEEE",' ', "0000", 0
stringLen db 55

filehandle handle ?
maze1     BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0
		  BYTE "|-|. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . |-|", 0
	      BYTE "|-|.|||||||||||||.|||||||||||||.||||||||||||||||.|||||||||||||.|||||||||||||.|-|", 0
	      BYTE "|-|.|-----------|.|-----------|.|--------------|.|-----------|.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|.|||||||||||||.|--------------|.|-----------|.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|. . . . . . . .||||||||||||||||.|-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|||||||||||||. . . . . . . . . |-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|||||||||||||.||||||||||||||||.|-----------|.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|. . . . . . . .|--------------|.|-----------|.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|.|||||||||||||.|--------------|.|||||||||||||.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|.|-----------|.|--------------|. . . . . . . .|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|||||||||||||.|--------------|.|||||||||||||.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|. . . . . . . .||||||||||||||||.|-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|||||||||||||. . . . . . . . . |-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|||||||||||||.|-|          |-|.|-----------|.|-----------|.|-|", 0
		  BYTE "|-|.|-----------|. . . . . . . .|-|          |-|.|-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|||||||||||||.|-|          |-|.|-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|-----------|.|-----------|.|-|  ______  |-|.|-----------|.|-----------|.|-|", 0
	      BYTE "|-|.|||||||||||||.|||||||||||||.|-|  |----|  |-|.|||||||||||||.|||||||||||||.|-|", 0
	      BYTE "|-|. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . |-|", 0
		  BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0

		tempMaze Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
				 Byte 81 dup(?)
Playername byte 8 dup(?)
scoreString byte 5 dup(?)
mazeRoof BYTE 80 dup('_'), 0

	;maze2
	
	maze2  BYTE  "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0
			BYTE "|-|8 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  8|-|", 0
			BYTE "|-|.|||||||||||||.|||||||||||||.||||||||||||||||.|||||||||||||.|||||||||||||.|-|", 0
			BYTE "|-|.|-----------|.|-----------|.|--------------|.|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||.|--------------|.|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|. . . . . . . .||||||||||||||||.|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||. . . . . . . . . |-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||.||||||||||||||||.|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|. . . . . . . . . . . . . . . ..|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||.|--------------|.|||||||||||||.|-----------|.|-|", 0
			BYTE "[  . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . .  ]", 0
			BYTE "|-|.||||||||||||| |||||||||||||.|--------------|. ||||||||||||.|||||||||||||.|-|", 0
			BYTE "|-|. . . . . . . . . . . . . . .||||||||||||||||. . . . . . . . . . . . . . .|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||. . . . . . . . . |-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||. . . . . . .  . .|-----------|.|-----------|.|-|", 0
			BYTE "|-|. . . . . . . . . . . . . . .|-|  ------  |-|. . . . . . . .  . . . . .  .|-|", 0
			BYTE "|-|.|-----------|.|||||||||||||.|-|          |-|.|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|-----------|.|-----------|.|-|  ______  |-|.|-----------|.|-----------|.|-|", 0
			BYTE "|-|.|||||||||||||.|||||||||||||.|-|. . . . . |-|.|||||||||||||.|||||||||||||.|-|", 0
			BYTE "|-|8 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  8|-|", 0
			BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0 
	;maze3
		maze3	BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0
			    BYTE "|-|8 . . . . . . . . . . . . . . . . . .8. . . . . . . . . . . . . . . . .  8|-|", 0
				BYTE "|-|.||||||.||||||.||||||.||||||.|||||||| |||||||.||||||.||||||.||||||.||||||.|-|", 0
				BYTE "|-|.|----|.|----|.|-----.-----|.|------| |-----|.|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|.||||||.||||||.|------| |-----|.|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|. . . . . . . .|||||||| |||||||.|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|.||||||.||||||. . . . . . . . . |-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|.||||||.||||||.|||||||| |||||||.|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|. . . . . . . . . . . . . . . ..|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|.||||||.||||||.|------- ------|.||||||.||||||.|----|.|----|.|-|", 0
				BYTE "[  . . . . . . . . . . . . . . . . . . .8. . .  . . . . . . . . . . . . . . .  ]", 0
				BYTE "|-|.||||||.|||||| ||||||.||||||.|------- ------|.||||||.||||||.||||||.||||||.|-|", 0
				BYTE "|-|. . . . . . . . . . . . . . .|||||||| |||||||. . . . . . . . . . . . . . .|-|", 0
				BYTE "|-|.|----|.|----|.||||||.||||||. . . . . . . . . |-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|.||||||.||||||. . . . . . .  . .|-----.-----|.|----|.|----|.|-|", 0
				BYTE "[  . . . . . . . . . . . . . . .|-|  ------  |-|. . . . . . . .  . . . . .  .  ]", 0
				BYTE "|-|.|----|.|----|.||||||.||||||.|-|          |-|.|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.|----|.|----|.|-----.-----|.|-|  ______  |-|.|-----.-----|.|----|.|----|.|-|", 0
				BYTE "|-|.||||||.||||||.||||||.||||||.|-|. . . . . |-|.||||||.||||||.||||||.||||||.|-|", 0
				BYTE "|-|8 . . . . . . . . . . . . . . . . . .8. . . . . . . . . . . . . . . . .  8|-|", 0
				BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 0 
gridLen BYTE 81
moveBool BYTE 0

titleText db'____   ___    ___ ___  ___  ___  __  __',0
		byte '|| \\ // \\  //   ||\\//|| // \\ ||\ ||',0
		byte ' |_// ||=|| ((    || \/ || ||=|| ||\\||',0
		byte '||    || ||  \\__ ||    || || || || \||',0


titleDecorater db '=================================================',0
			byte  '     .-.   .-.     .--.                          ',0
			byte  "    | OO| | OO|   / _.-' .-.   .-.  .-.   .''.   ",0
			byte  "    |   | |   |   \  '-. '-'   '-'  '-'   '..'   ",0
			byte  "    '^^^' '^^^'    '--'                          ",0
			byte  "=================================================",0

startText byte "PRESS ANY KEY TO START",0ah,0

continueText byte "PRESS ANY KEY TO CONTINUE",0

strScore BYTE "SCORE: ",0
score WORD 0

strLevel byte "LEVEL: ",0
level byte 2

strLives byte "LIVES: ",0
lives byte 1

direction byte 'n'

xPos BYTE 29
yPos BYTE 3

hitwall byte ?
;ghost1:
	g1X byte 64
	g1Y byte 19
	dir1 db ?
	rand1 byte ?
	tempchar1 db ? ;retain pellet if ghoist on pellet
;ghost2:
	g2X byte 65
	g2Y byte 19
	dir2 db ?
	rand2 byte ?
	tempchar2 db ? ;retain pellet if ghoist on pellet
;ghost3:
	g3X byte 66
	g3Y byte 19
	dir3 db ?
	rand3 byte 1
	tempchar3 db ? ;retain pellet if ghoist on pellet
;ghost4:
	g4X byte 67
	g4Y byte 19
	rand4 byte 1
	dir4 db ?
	tempchar4 db ? ;retain pellet if ghoist on pellet

xCoinPos BYTE ?
yCoinPos BYTE ?

pellets word ?
fruits db ?

inputChar BYTE ?

.code

DrawPlayer PROC
	; draw player at (xPos,yPos):
	mov eax,yellow+(black * 16)
	call SetTextColor
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"C"
	call WriteChar
	ret
DrawPlayer ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	mov eax, 0
	movzx ax, dh
	sub ax,3
	mul gridLen
	movzx bx, dl
	sub bx, 28
	add ax, bx
	cmp level, 1
	jg mazeVal2
	mov esi, offset maze1
	jmp changeVal
	mazeVal2:
		cmp level,2 
		jg thirdLevel
		mov esi, offset maze2
		jmp changeVal
	thirdlevel:
		mov esi, offset maze3
	changeVal:
		mov byte ptr [esi + eax],' '
		call Gotoxy
		mov al," "
		call WriteChar
	ret
UpdatePlayer ENDP

getName proc
	call clrscr
	mov eax, red + (Yellow*16)
	call setTExtcolor
	                                                                                     

	                                                                                     
	mov dl, 15
	mov dh,5
	call gotoxy
	mWrite <" _____ _____ _____ _____ _____    __ __ _____ _____ _____    _____ _____ _____ _____ ">
	mov dh,6
	call gotoxy
	mWrite <"|   __|   | |_   _|   __| __  |  |  |  |     |  |  | __  |  |   | |  _  |     |   __|">
	mov dh,7
	call gotoxy
	mWrite <"|   __| | | | | | |   __|    -|  |_   _|  |  |  |  |    -|  | | | |     | | | |   __|">
	mov dh,8
	call gotoxy
	mWrite <"|_____|_|___| |_| |_____|__|__|    |_| |_____|_____|__|__|  |_|___|__|__|_|_|_|_____|">
	mov dl, 50
	mov dh, 10
	call gotoxy
	mov eax, blue + (Black*16)
	call setTExtcolor
	mov edx, offset Playername
	mov ecx, 8
	call readstring
	sub ecx, eax
	cmp ecx, 1
	jle skipFIlling
	fillerLoop:
		mov byte ptr playername[eax], '_'
		inc eax
	loop fillerLoop
	mov byte ptr playername[7], 0

	skipFilling:
	ret
getName endp

drawghost proc
	push ebp
	mov ebp,esp
	cmp byte ptr [ebp + 20],1
	je greenColor
	mov eax,Red+(black * 16)
	jmp continueFuntion
	greenColor: 
			mov eax,Green+(black * 16)
	continueFuntion:
	call SetTextColor
	mov eax, 0
	mov eax, [ebp + 12]
	sub ax,3
	mul gridLen
	mov edx, [ebp + 16]
	sub dx, 28
	add ax, dx
	cmp level,1
	mov dl, byte ptr [ebp + 16]
	mov dh, byte ptr [ebp + 12]
	call valueat
	mov edi, [ebp + 8]
	mov byte ptr [edi], al
	mov dl, byte ptr [ebp + 16]
	mov dh, byte ptr [ebp + 12]
	call gotoXY
	mov al, 'X'
	call writechar	
	mov eax,White+(black * 16)
	call SetTextColor
	pop ebp
	ret 16
drawghost endp

changecolor proc
	cmp eax, '.'
	je whiteColor
	cmp eax, '8'
	je whiteColor
	cmp eax, '['
	je pURPLEColor
	cmp eax, ']'
	je pURPLEColor
	cmp eax, ' '
	je whitespace
	cmp eax, '-'
	je yellowcolor
	cmp level, 2
	je color3
	cmp level, 3
	je color4
	mov eax,Blue +(Blue*16)
	jmp writeElement
	color3:
		mov eax,Brown +(Brown *16)
		jmp writeElement
	color4:
		mov eax,LightREd +(LightRed *16)
		jmp writeElement
	whitespace:
		mov eax,Blue +(Black*16)
		jmp writeElement
	yellowColor:
		cmp level, 2
		je color2
		cmp level, 3
		je color5
		mov eax,Gray +(Gray*16)
		jmp writeElement
		color2:
			mov eax,Green +(Green*16)
			jmp writeElement
		color5:
			mov eax,White +(White*16)
			jmp writeElement
	pURPLEColor:
		mov eax,Black +(Black*16)
		jmp writeElement
	whiteColor:
		mov eax,LightCYan +(Black*16)
	writeElement:
		call SetTextColor
		movzx eax, byte ptr [esi + ebx]
		call writechar
	ret
changecolor endp


DrawMaze PROC 
	push ebp
	mov ebp, esp
	sub esp, 2
	mov byte ptr [ebp - 2], 0 ;local variable
	mov ebx, 0
	mov al, 0
	mov tempByte, 3
	cmp level, 1
	jg mazeVal2
	mov esi, offset maze1
	mov pellets, 219
	mov fruits, 0
	mov ecx, 21
	jmp printGrid
	mazeVal2:
		cmp level,2 
		jg thirdLevel
		mov esi, offset maze2
		mov ecx, 21
		mov fruits, 4
		mov pellets, 294
		jmp printGrid
	thirdlevel:
		mov fruits, 7
		mov pellets, 348 
		mov esi, offset maze3
		mov ecx, 21
	printGrid:
		mov byte ptr [ebp - 2], 28
		mov tempWord, cx
		mov ecx, 81
		secondLoop:
			mov dl,byte ptr [ebp - 2]
			mov dh,tempByte		
			call gotoxy
			movzx eax, byte ptr [esi + ebx]
			call changecolor
			inc ebx
			inc byte ptr [ebp - 2]
		loop secondLoop
		movzx ecx, tempWord
		inc tempByte
	loop printGrid
	mov eax,White +(Black*16)
	call SetTextColor
	add esp ,2
	pop ebp
	ret
DrawMaze endp

teleport proc
	cmp level, 1
	jle endCheck
	cmp level, 2
	je portal3
Portal1:
	cmp dl, 28
	jg Portal2
	cmp dh, 18
	jne Portal2
	cmp direction, 'l'
	jne endCheck
	mov xPos, 29
	mov yPos, 18
	call updatePlayer
	mov xPos, 106
	mov yPos, 18
	jmp endCheck
Portal2:
	cmp dl, 106
	jl Portal3
	cmp dh, 18
	jne Portal3
	cmp direction, 'r'
	jne endCheck
	mov xPos, 105
	mov yPos, 18
	call updatePlayer
	mov xPos, 29
	mov yPos, 18
	jmp endCheck
Portal3:
	cmp dl, 28
	jg Portal4
	cmp dh, 13
	jne Portal4
	cmp direction, 'l'
	jne endCheck
	mov xPos, 29
	mov yPos, 13
	call updatePlayer
	mov xPos, 106
	mov yPos, 13
Portal4:
	cmp dl, 106
	jl endCheck
	cmp dh, 13
	jne endCheck
	cmp direction, 'r'
	jne endCheck
	mov xPos, 105
	mov yPos, 13
	call updatePlayer
	mov xPos, 29
	mov yPos, 13

		 
endCheck:
;18


ret
teleport endp

mazeVal PROC 
	cmp dh,2
	jle setZero
	mov eax, 0
	movzx ax, dh ; dh = y cords and dl = x cords
	sub ax,3
	mul gridLen ; 81
	movzx bx, dl
	sub bx, 28
	add ax, bx
	cmp ax,0 
	jl setZero
	cmp level, 1
	jg mazeVal2
	mov esi, offset maze1
	jmp comparisions
	mazeVal2:
		cmp level,2 
		jg thirdLevel
		mov esi, offset maze2
		jmp comparisions
	thirdlevel:
		mov esi, offset maze3
		comparisions:
			cmp byte ptr [esi + eax],'|'
			je setZero
			cmp byte ptr [esi + eax],'_'
			je setZero
			cmp byte ptr [esi + eax],'-'
			je setZero
			cmp byte ptr [esi + eax],'|'
			je setZero
			cmp byte ptr [esi + eax],']'
			je setZero
			cmp byte ptr [esi + eax],'['
			je setZero
			mov al, 1
			jmp skip
		setZero:
			mov al, 0
	skip:
	ret
mazeVal endp

updateghost proc
	push ebp
	mov ebp, esp
	mov esi, [ebp + 12]
	mov dh, [esi]
	mov esi, [ebp + 8]
	mov dl, [esi]
	call gotoxy
	mov edi, [ebp + 16]
	mov eax, lightCYan + (Black * 16)
	call settextcolor
	mov al, [edi]
	call writechar	
	mov eax, white + (Black * 16)
	call settextcolor
	pop ebp
	ret 12
updateghost endp
 
ghostmove proc ;bl and bh xy cords of ghost and 
	push ebp
	mov ebp,esp
	mov esi, [ebp + 8]
	mov bl,[esi]
	mov esi, [ebp + 12]
	mov bh,[esi]
	mov eax, [ebp + 16]
	mov dl, al
	mov eax, [ebp + 20]
	mov dh,al
	sub bl, dl ;diff wrt x axis bw ghost and pacman
	sub bh, dh ;diff wrt y axis bw ghost and pacman
	check1:
		mov ah,bh
		cmp bh, 0
		jge check2
		neg ah
	check2:
		mov al,bl
		cmp bl, 0
		jge skipNeg  ;taking abs value
		neg al
	skipNeg:
	cmp al, 4
	jg enableRandom
	cmp ah, 4  
	jg enableRandom 
	cmp al,ah ;cmp abs value and minimize the one thats smaller first
	jl else1
	iff1:
		cmp bl, 0
		je else2
		iff2:
			cmp al, 0
			jne continueLoop
			cmp ah, 0
			jne continueLoop
			continueLoop:
			mov esi, [ebp + 8]
			mov dl,[esi]
			mov esi, [ebp + 12]
			mov dh,[esi]
			cmp bl, 0
			jg ifelse2
			ifelse1:
				inc dl
				call mazeVal
				cmp al,0
				je else2
				call cmpghostcords
				cmp al, 0
				je enableRandom
				noWall1:
					push [ebp + 28]
					push [ebp + 12]
					push [ebp + 8]
					call updateghost
					mov esi,[ebp + 8]
					inc byte ptr[esi]
					jmp endCheck
			ifelse2:
				dec dl
				call mazeVal
				cmp al,0
				je else2
				call cmpghostcords
				cmp al, 0
				je enableRandom
				noWall2:
					push [ebp + 28]
					push [ebp + 12]
					push [ebp + 8]
					call updateghost
					mov esi,[ebp + 8]
					dec byte ptr[esi]	
					jmp endCheck
	else1:
			cmp bh,0
			je iff2 
			else2:
				mov esi, [ebp + 8]
				mov dl,[esi]
				mov esi, [ebp + 12]
				mov dh,[esi]
				cmp bh,0
				jg elseiff2
				elseiff1:  
					inc dh
					call mazeVal
					cmp al, 0
					je iff2
					call cmpghostcords
					cmp al, 0
					je enableRandom
					noWall3:
					push [ebp + 28]
					push [ebp + 12]
					push [ebp + 8]
					call updateghost
					mov esi,[ebp + 12]
					inc byte ptr[esi]
					jmp endCheck
				elseiff2:
					dec dh
					call mazeVal
					cmp al, 0
					je iff2
					call cmpghostcords
					cmp al, 0
					je enableRandom
					noWall4:
					push [ebp + 28]
					push [ebp + 12]
					push [ebp + 8]
					call updateghost
					mov esi,[ebp + 12]
					dec byte ptr[esi]
					jmp endCheck
		endCheck:
			mov edi, [ebp + 24]
			mov byte ptr [edi],0
			jmp skipCheck
		enableRandom:
			mov edi, [ebp + 24]
			mov byte ptr [edi],1
			jmp skipCheck
		skipCheck:
		pop ebp
		ret 24
ghostmove endp 
 

gameOver proc
	call clrscr
	mov eax, Red + (Yellow * 16)
	call settextcolor
	mov dl, 30
	mov dh, 4
	call gotoxy                                                     
	mWrite<"  _____ _____ _____ _____    _____ _____ _____ _____  ">
	mov dh, 5
	call gotoxy
	mWrite<" |   __|  _  |     |   __|  |     |  |  |   __| __  | ">
	mov dh, 6
	call gotoxy
	mWrite<" |  |  |     | | | |   __|  |  |  |  |  |   __|    -| ">
	mov dh, 7
	call gotoxy
	mWrite<" |_____|__|__|_|_|_|_____|  |_____|\___/|_____|__|__| ">
	mov eax, Blue + (black * 16)
	call settextcolor
	mov dl, 55
	mov dh, 11
	call gotoxy
	mWrite<"YOUR SCORE: ">
	mov eax, Red + (black * 16)
	call settextcolor
	movzx eax, score
	call writeint
	mov dl, 55
	mov dh, 12
	call gotoxy
	mov eax, Blue + (black * 16)
	call settextcolor
	mWrite<"YOUR LEVEL: ">
	mov eax, Red + (black * 16)
	call settextcolor
	movzx eax, level
	call writeint
	mov dl, 55
	mov dh, 13
	call gotoxy
	mov eax, Blue + (black * 16)
	call settextcolor
	mWrite<"YOUR LIVES: ">
	mov eax, Red + (black * 16)
	call settextcolor
	movzx eax, lives
	call writeint
	mov dl, 55
	mov dh, 14
	call gotoxy
	mov eax, Blue + (black * 16)
	call settextcolor
	mWrite<"NAME: ">
	mov eax, Red + (black * 16)
	call settextcolor
	mov edx, offset playerName
	call writestring
	mov eax, White + (black * 16)
	call settextcolor
	movzx eax, score
	call intTostring
	ret
gameOver endp


randomdirection proc

	call randomize
	mov eax, 4 
	call randomrange
	inc eax
	ret
randomdirection endp

checkLeftMovement proc
	mov cl, dl
	dec dl
	call mazeVal
	cmp al, 0
	je cantMove
	cmp level, 3
	je canMove
	call cmpghostcords
	cmp al, 0
	je cantMove
	jmp canMove
	cantMove:
		mov al, 0
		jmp skipMove
	canMove:
		mov al, 1
	skipMove:
		mov dl, cl
	ret
checkLeftMovement endp

checkUpmovement proc
	mov ch, dh
	dec dh
	call mazeVal
	cmp al, 0
	je cantMove
	cmp level, 3
	je canMove
	call cmpghostcords
	cmp al, 0
	je cantMove
	jmp canMove
	cantMove:
		mov al, 0
		jmp skipMove
	canMove:
		mov al, 1
	skipMove:
		mov dh, ch
	ret
checkupmovement endp

checkdownmovement proc
	mov ch, dh
	inc dh
	call mazeVal
	cmp al, 0
	je cantMove
	cmp level, 3
	je canMove
	call cmpghostcords
	cmp al, 0
	je cantMove
	jmp canMove
	cantMove:
		mov al, 0
		jmp skipMove
	canMove:
		mov al, 1
	skipMove:
		mov dh, ch
	ret
checkdownmovement endp

checkRightMovement proc
	mov cl, dl
	inc dl
	call mazeVal
	cmp al, 0
	je cantMove
	cmp level, 3
	je canMove
	call cmpghostcords
	cmp al, 0
	je cantMove
	jmp canMove
	cantMove:
		mov al, 0
		jmp skipMove
	canMove:
		mov al, 1
	skipMove:
		mov dl, cl
	ret
checkRightMovement endp


moveghostUp proc
	push ebp
	mov ebp, esp
	push [ebp + 20]
	push [ebp + 12]
	push [ebp + 8]
	call updateghost
	bothLeftRight1:
	call checkRightMovement
	cmp al, 0
	je LeftMoveOnly1
	call checkLeftMovement 
	cmp al, 0
	je RightMoveOnly1
	mov eax, 3						
	call randomrange
	cmp al,0
	je continueUp
	cmp al, 2
	je continueLeft
	cmp al,1 
	je continueRight
	LeftMoveOnly1:
		call checkLeftMovement
		cmp al, 0
		je continueUp
		mov eax, 2						
		call randomrange
		cmp al,0
		je continueUp
		cmp al, 1
		je continueLeft
	RightMoveOnly1:
		call checkRightMovement
		cmp al, 0
		je continueUp
		mov eax, 2						
		call randomrange
		cmp al,0
		je continueUp
		cmp al, 1
		je continueRight
	continueUp:
		mov esi, [ebp + 12]
		dec byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 1
		jmp endCheck
	continueLeft:
		mov esi, [ebp + 8]
		dec byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 3
		jmp endCheck
	continueRight:
		mov esi, [ebp + 8]
		inc byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 4
	endCheck:
	pop ebp
 	ret 16
moveghostup endp

moveghostRight proc
	push ebp
	mov ebp, esp
	push [ebp + 20]
	push [ebp + 12]
	push [ebp + 8]
	call updateghost
	bothUpDown1:
	call checkupMovement
	cmp al, 0
	je downMoveOnly1
	call checkdownMovement 
	cmp al, 0
	je upMoveOnly1
	mov eax, 3						
	call randomrange
	cmp al,0
	je continueUp
	cmp al, 2
	je continuedown
	cmp al,1 
	je continueright
	upMoveOnly1:
		call checkupMovement
		cmp al, 0
		je continueRight
		mov eax, 2						
		call randomrange
		cmp al,0
		je continueRight
		cmp al, 1
		je continueUp
	DownMoveOnly1:
		call checkDownMovement
		cmp al, 0
		je continueRight
		mov eax, 2						
		call randomrange
		cmp al,0
		je continueDown
		cmp al, 1
		je continueRight
	continueUp:
		mov esi, [ebp + 12]
		dec byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 1
		jmp endCheck
	continueDown:
		mov esi, [ebp + 12]
		inc byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 2
		jmp endCheck
	continueRight:
		mov esi, [ebp + 8]
		inc byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 4
	endCheck:
	pop ebp
 	ret 16
moveghostRight endp

moveghostleft proc
	push ebp
	mov ebp, esp
	push [ebp + 20]
	push [ebp + 12]
	push [ebp + 8]
	call updateghost
	bothUpDown1:
	call checkupMovement
	cmp al, 0
	je downMoveOnly1
	call checkdownMovement 
	cmp al, 0
	je upMoveOnly1
	mov eax, 3						
	call randomrange
	cmp al,0
	je continueUp
	cmp al, 2
	je continuedown
	cmp al,1 
	je continueLeft
	upMoveOnly1:
		call checkupMovement
		cmp al, 0
		je continueLEft
		mov eax, 2						
		call randomrange
		cmp al,0
		je continueLeft
		cmp al, 1
		je continueUp
	DownMoveOnly1:
		call checkDownMovement
		cmp al, 0
		je continueLeft
		mov eax, 2						
		call randomrange
		cmp al,0
		je continueDown
		cmp al, 1
		je continueLeft
	continueUp:
		mov esi, [ebp + 12]
		dec byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 1
		jmp endCheck
	continueDown:
		mov esi, [ebp + 12]
		inc byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 2
		jmp endCheck
	continueLeft:
		mov esi, [ebp + 8]
		dec byte ptr [esi]
		mov edi, [ebp + 16]
		mov byte ptr [edi], 3
	endCheck:
	pop ebp
 	ret 16
moveghostLeft endp 

ghostrandom proc
	push ebp
	mov ebp, esp
	mov edi, [ebp + 16]
    cmp byte ptr [edi], 0
 	jg checkCollision
	call randomdirection;
	mov byte ptr [edi], al
	checkCollision:
		mov cx, 0
		mov bx, 0
		mov esi, [ebp + 8]
		mov dl, [esi]
		mov esi, [ebp + 12]
		mov dh, [esi]
		cmp byte ptr [edi], 1
		je up
		cmp byte ptr [edi], 2
		je down
		cmp byte ptr [edi], 3
		je left
		cmp byte ptr [edi], 4
		je right
		up:
			dec dh
			call mazeVal
			cmp al, 0 
			je checkOtherdirections1
			;call cmpghostcords
			;cmp al, 0
			;je checkOtherdirections1
			jmp move1
			checkOtherdirections1:
				inc dh
				mov eax, 3
				call randomrange
				cmp al, 0
				je right
				cmp al, 1
				je left
				cmp al, 2
				je down
				mov cl, 1
			move1:
				push [ebp + 20]
				push [ebp + 16]
				push [ebp + 12]
				push [ebp + 8]
				call moveghostup
				jmp endCheck
		down:
			inc dh
			call mazeVal
			cmp al, 0 
			je checkOtherdirections2
			;call cmpghostcords
			;cmp al, 0
			;je checkOtherdirections2
			jmp move2
			checkOtherdirections2:
			    dec dh
				;call randomize
				mov eax, 3
				call randomrange
				cmp al, 0
				je right
				cmp al, 1
				je left
				cmp al, 2
				je up
				mov cl, 1
			move2:
				push [ebp + 20]
				push [ebp + 12]
				push [ebp + 8]
				call updateghost
				mov esi, [ebp + 12]
				inc byte ptr[esi]
				mov edi, [ebp + 16]
				mov byte ptr [edi], 2
				jmp endCheck
		left:
			dec dl
			call mazeVal
			cmp al, 0 
			je checkOtherdirections3
			;call cmpghostcords
			;cmp al, 0
			;je checkOtherdirections3
			jmp move3
			checkOtherdirections3:
				inc dl
				;call randomize
				mov eax, 3
				call randomrange
				cmp al, 0
				je up
				cmp al, 1
				je down
				cmp al, 2
				je right
			move3:
				push [ebp + 20]
				push [ebp + 12]
				push [ebp + 8]
				call updateghost
				push [ebp + 20]
				push [ebp + 16]
				push [ebp + 12]
				push [ebp + 8]
				call moveghostleft
				jmp endCheck
		right:
			inc dl
			call mazeVal
			cmp al, 0 
			je checkOtherdirections4
			;call cmpghostcords
			;cmp al, 0
			;je checkOtherdirections4
			jmp move4
			checkOtherdirections4:
				dec dl
				;call randomize
				mov eax, 3
				call randomrange
				cmp al, 0
				je up
				cmp al, 1
				je left
				cmp al, 2
				je down
			move4:
				push [ebp + 20]
				push [ebp + 12]
				push [ebp + 8]
				call updateghost
				push [ebp + 20]
				push [ebp + 16]
				push [ebp + 12]
				push [ebp + 8]
				call moveghostright
	endCheck:
	pop ebp
	ret 16
ghostrandom endp

getRandomXY proc ;rand value in bl and bh
	mov eax, 49
	call randomrange
	add eax, 29
	mov bl, al
	mov eax, 17
	call randomrange
	add eax, 4
	mov bh, al
	ret
getRandomXY endp

titleScreen proc uses edx eax ebx
	mov eax, RED + (Yellow  * 16)
	call settextcolor
	mov ecx,4
	mov ebx, 0
	mov tempByte, 4 
	printLoop:
		mov eax, 250
		call delay
		mov dl, 40
		mov dh, tempByte
		call gotoxy
		mov tempByte,dh
		inc tempByte
		mov edx, offset titleText
		add edx, ebx
		add ebx, 40
		call writestring
		call crlf
	loop printLoop
	mov ecx, 4
	mov dl, 35
	mov dh, 15
	call gotoxy
	mov eax, Lightcyan + (BLACK  * 16)
	call settextcolor
	mov edx, offset titledecorater
	call writestring
	mov edi, 50
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mov bh ,16
	printdecor:
		mov dl, 35
		mov dh, bh
		call gotoxy
		mov edx, offset titledecorater
		add edx, edi
		call writestring
		add edi, 50
		inc bh
	loop printdecor
	mov eax, Lightcyan + (BLACK  * 16)
	call settextcolor
	mov dl, 35
	mov dh, bh
	call gotoxy
	mov edx, offset titledecorater
	add edx, edi
	call writestring
	mov eax, BLUE + (BLACK  * 16)
	call settextcolor
	mov dl, 48
	mov dh, 12
	call gotoxy
	mov edx, offset startText
	call writestring
	titleScreenLoop:
		call readkey
		jnz exitTitleScreenLoop
		jmp titleScreenLoop
	exitTitleScreenLoop:
	ret
titleScreen endp

populatePellets proc uses eax ebx edx ecx
	call randomize
	cmp level, 1
	jg greaterlevel
	drawMaze1:
		mov ecx, 2
		mov fruits,0
		mov pellets,cx
		mov esi, offset maze1
		jmp populateLoop
	greaterLevel:
	cmp level, 2
	jg drawMaze3
	drawMaze2:
		mov ecx, 75
		mov fruits,3
		mov pellets,cx
		mov esi, offset maze2
		jmp populateLoop
	drawMaze3:
		mov ecx, 100
		mov fruits,5
		mov pellets,cx
		mov esi, offset maze3
		jmp populateLoop
	populateLoop:
 		call getRandomXy
		mov eax, 0
		movzx ax, bh
		sub ax,3
		mul gridLen
		movzx dx, bl
		sub dx, 28
		add ax, dx
		cmp byte ptr [esi + eax],'|'
		je populateLoop
		cmp byte ptr [esi + eax],'-'
		je populateLoop
		cmp byte ptr [esi + eax],'_'
		je populateLoop
		cmp byte ptr [esi + eax],'.'
		je populateLoop
		mov byte ptr [esi + eax],'.'
		loop populateLoop
	cmp level,1 
	je endPopulation
	movzx ecx, fruits
	fruitLoop:
		call getRandomXy
		mov eax, 0
		movzx ax, bh
		sub ax,3
		mul gridLen
		movzx dx, bl
		sub dx, 28
		add ax, dx
		cmp level,1
		cmp byte ptr [esi + eax],'|'
		je fruitLoop
		cmp byte ptr [esi + eax],'-'
		je fruitLoop
		cmp byte ptr [esi + eax],'_'
		je fruitLoop
		cmp byte ptr [esi + eax],'.'
		je fruitLoop
		cmp byte ptr [esi + eax],'~'
		je fruitLoop
		mov byte ptr [esi + eax],'8'
	loop fruitLoop
	endPopulation: 
	mov eax,White +(Black*16)
	call SetTextColor
	ret
populatePellets endp

valueAt proc;returns value at x,y in al
	mov eax, 0
	movzx ax, dh
	sub ax,3
	mul gridLen
	movzx bx, dl
	sub bx, 28
	add ax, bx
	cmp level, 1
	jg mazeVal2
	mov esi, offset maze1
	jmp comparisions
	mazeVal2:
		cmp level,2 
		jg thirdLevel
		mov esi, offset maze2
		jmp comparisions
	thirdlevel:
		mov esi, offset maze3
	comparisions:
		mov al,byte ptr [esi + eax]
		jmp endValueCheck
	endValueCheck:
	ret
valueAt endp

cmpghostcords proc
	mov al,1
	firstGhost:
		cmp dl, g1x
		jne secondGhost
		cmp dh, g1y
 		jne secondGHost
		mov al, 0
		jmp skipComp
	secondGhost:
		cmp dl, g2x
		jne thirdGhost
		cmp dh, g2y
		jne thirdGhost
		mov al, 0
		jmp skipComp
	thirdGhost:
		cmp level, 1
		je skipComp
		cmp dl, g3x
		jne fourthghost
		cmp dh, g3y
		jne fourthGhost
		mov al, 0
		jmp skipComp
	fourthGhost:
		cmp dl, g4x
		jne skipComp
		cmp dh, g4y
		jne skipComp
		mov al, 0
		skipComp:
	ret
cmpghostcords endp


levelScreen proc uses edx eax 
	call delay
	mov eax,Red +(Black*16)
	call SetTextColor
	mov dl, 55
	mov dh,5
	call gotoxy
	mov edx, offset strlevel
	call writestring
	mov al, level
	call writeint
	mov dl, 46
	mov dh,7
	call gotoxy
	mov edx, offset continuetext
	mov eax,Blue +(Black*16)
	call SetTextColor
	call writestring
	call readchar
	call clrscr
	ret
levelScreen endp


respawn proc
	mov dl, xPos
	mov dh, yPos 
	call cmpghostcords
	cmp al, 1
	je endCheck
	mov xPos, 65
	mov yPos, 4
	call DrawPlayer
	mov direction, 'n'
	cmp lives, 0
	je gameEnd
	dec lives
	mov al,1
	jmp endCheck
	gameENd:
		mov al, 2
	endCheck:
	ret
respawn endp

menu proc
    call clrscr
	mov eax, REd + (BLACK  * 16)
	call settextcolor
	mov dl, 46
	mov dh, 4
	call gotoxy

	mWrite<"   __  ________  ____  __">
	mov dh, 5
	call gotoxy
	mWrite<"  /  |/  / __/ |/ / / / /">
	mov dh, 6
	call gotoxy
	mWrite<" / /|_/ / _//    / /_/ / ">
	mov dh, 7
	call gotoxy
	mWrite<"/_/  /_/___/_/|_/\____/">

	
	mov eax, LightCyan + (BLACK  * 16)
	call settextcolor
	mov dl, 51
	mov dh, 12
	call gotoxy
	mWrite<"WELCOME '">
	mov edx, offset playername
	call writestring
	mWrite<"'">
	mov eax, Blue + (BLACK  * 16)
	call settextcolor
	mov dl, 28
	mov dh, 14
	call gotoxy
	mWrite<"================================================================">
	mov dh,15
	call gotoxy
	mov eax, LightMagenta + (BLACK  * 16)
	call settextcolor
	mWrite <"|                       1. START GAME                          |" >
	mov dh, 16
	call gotoxy
	mWrite <"|                       2. INSTRUCTIONS                        |" >
	mov dh, 17
	call gotoxy
	mWrite< "|                       3. SELECT LEVEL                        |">
	mov dh, 18
	call gotoxy
	mWrite< "|                       4. QUIT GAME                           |">
	mov eax, Blue + (BLACK  * 16)
	call settextcolor
	mov dh, 19
	call gotoxy
	mWrite<"================================================================">
	call readChar
ret
menu endp

instructions proc
   call clrscr
	mov eax, Red + (BLACK  * 16)
	call settextcolor
	mov dl, 30
	mov dh, 4
	call gotoxy

	mWrite<" ___ _  _ ___ ___ _____ ___ _   _  ___ _____ ___ ___  _  _ ___">
	mov dh, 5
	call gotoxy
	mWrite<"|_ _| \| / __/ __|_   _| _ \ | | |/ __|_   _|_ _/ _ \| \| / __|">
	mov dh, 6
	call gotoxy
	mWrite<" | || .` \__ \__ \ | | |   / |_| | (__  | |  | | (_) | .` \__ \">
	mov dh, 7
	call gotoxy
	mWrite<"|___|_|\_|___/___/ |_| |_|_\\___/ \___| |_| |___\___/|_|\_|___/">

	mov dl, 15
	mov dh,10
	call gotoxy
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mWrite<"=================================================================================================">
        
	mov dh,11
	call gotoxy
	mov eax, LightMagenta + (BLACK  * 16)
	call settextcolor
	mWrite<"| 1. COLLECT PELLETS AND FRUITS. PELLETS GIVE YOU +1 POINTS AND FRUITS GIVE YOU +10 POINTS      |">
	mov dh, 12
	call gotoxy
	mWrite<"| 2. AVOID THE GHOSTS. GHOSTS SEARCG FOR YOU AND BECOME RED WHEN THEY SEE YOU AND WILL HUNT YOU |">
	mov dh, 13
	call gotoxy
	mWrite<"| 3. EAT ALL PELLETS AND FRUITS TO ADVANCE TO THE NEXT ROUND                                    |">
	mov dh, 14
	call gotoxy
	mWrite<"| 4. USE PORTALS TO ESCAPE GHOSTS AND JUMP TO DIFFERENT PARTS OF THE MAZE                       |">
	mov dh,15
	call gotoxy
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mWrite<"=================================================================================================">
	mov dl, 50
	mov dh, 17
	call gotoxy
	mov eax, red + (BLACK  * 16)
	call settextcolor
	mWrite<"PRESS ANY KEY TO GO BACK..">
	call readChar
	ret 
instructions endp

pauseGame proc
	local temp : byte
	push ebp
	mov ebp,esp
	call clrscr
	mov eax, Red + (Yellow  * 16)
	call settextcolor
	mov dl, 50
	mov dh, 4
	call gotoxy
	mWrite<"    ___  ___  __  _____________ ">
	mov dh, 5
	call gotoxy
	mWrite<"  / _ \/ _ |/ / / / __/ __/ _ \ ">
	mov dh, 6
	call gotoxy
	mWrite<" / ___/ __ / /_/ /\ \/ _// // / ">
	mov dh, 7
	call gotoxy
	mWrite<"/_/  /_/ |_\____/___/___/____/  "> 
	
	mov eax, Yellow + (Blue  * 16)
	call settextcolor
	mov dl, 55
	mov dh, 14
	call gotoxy
	mWrite<'    ,-~"       "~-.    '>
	mov dh, 15
	call gotoxy
	mWrite<"   ,^ ___     ___ ^.   ">
	mov dh, 16
	call gotoxy
	mWrite<"  / .^   ^. .^   ^. \  ">
	mov dh, 17
	call gotoxy
	mWrite< " Y  l  O ! l   O  !  Y ">
	mov dh, 18
	call gotoxy
	mWrite<" l_ `.___.' `.___.' _[ ">
	mov dh, 19
	call gotoxy
	mWrite<' l^~"-------------"~^I '>
	mov dh, 20
	call gotoxy
	mWrite<" !\,               ,/! ">
	mov dh, 21
	call gotoxy
	mWrite<"   \~-.,_______,.-~/   ">
	mov dh, 22
	call gotoxy
	mWrite<"    ^.           .^    ">
	mov dh, 23
	call gotoxy
	mWrite<"    ''-.._____.,-''    ">
       
	mov eax, Red + (BLACK  * 16)
	call settextcolor
	mov dl, 46
	mov dh,9
	call gotoxy
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mWrite<"========================================">
	mov dh,10
	call gotoxy
	mov eax, LightMagenta + (BLACK  * 16)
	call settextcolor
	mWrite<"|         PRESS M FOR MAIN MENU        |">
	mov dh, 11
	call gotoxy
	mWrite<"|     PRESS ANY OTHER KEY TO RESUME    |">
	mov dh, 12
	call gotoxy
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mWrite<"========================================">
	call readchar
	pop ebp
	ret
pauseGame endp

intToString proc 
	mov edx, eax
	mov esi, 3
	mov ecx, 4
	mov bl, 10
	convertingLoop:
		mov eax, edx
		div bl
        add ah, '0'
		mov byte ptr scorestring[esi], ah
		movzx edx, al
		dec esi
	loop convertingLoop
	mov scorestring[4], 0
	ret
		
intToString endp 

stringtoint proc
	mov ecx, 5
	mov esi, 8
	mov edi, 0
	mov eax, 0
	mov bx, 10
	iterator:
		mov eax, 0
		mov tempbyte, cl
		mov ecx, 4
		convertor:		
			mul bx
			movzx edx, filebuffer[esi]
			sub edx, 30h
			add eax, edx
			inc esi
		loop convertor
			movzx ecx, tempbyte
			mov word ptr scores[edi], ax
			add edi, 2
			add esi, 9
	loop iterator
	ret
stringtoint endp

sortAry proc
	call stringtoint
	mov eax, 0
	mov esi, 0
	mov ecx, arrLen
	cmpLoop:
		movzx ebx, scores[eax]    ;eax pointer to score arr ;edi for buffer
		cmp score,bx
		jg found
		add eax, 2
		add esi, 14
	loop cmploop
	jmp noSwap
	found:
	mov bl, 14
	mul bl 
	mov ecx, 7
	mov edi, esi
	mov ebx, 0
	changeName:
		mov dl, playername[ebx]
		mov filewritebuffer[edi], dl
		inc edi
		inc ebx
	loop changeName
	mov ecx, 4
	mov fileWritebuffer[edi], ' '
	inc edi
	mov ebx, 0
	changeScore:
		mov dl, scorestring[ebx]
		mov filewritebuffer[edi], dl
		inc edi
		inc ebx
	loop changeScore
	cmp edi, buffersize-1
	je appendzero1
	mov filewritebuffer[edi], 0ah
    jmp skip1
	appendzero1:
		mov filewritebuffer[edi], 0
	skip1:
	mov edi, 0
	mov eax, 0
	rewriteBuffer:
		cmp eax, esi
		je jumpToRightPlace
		mov bl, filebuffer[edi]
		cmp eax, buffersize-1
		je appendzero
		mov filewritebuffer[eax],bl
		jmp continueRewriting
		appendzero:
		mov filewritebuffer[eax], 0
		jmp continueRewriting
	jumpToRightPlace:
		add eax, 13
		jmp comparison
	continueRewriting:
	inc edi	
	inc eax
	comparison:
	cmp eax, buffersize
	jl rewriteBuffer
	jmp skip
	noSwap:
		mov ecx, buffersize
		mov edi, 0
		copyBuffer:
			mov bl, filebuffer[edi]
			mov filewritebuffer[edi], bl
			inc edi
		loop copyBuffer
	skip:
	ret 
sortAry ENDP

rewriteFile proc
	mov edx, offset filename
	call createoutputfile
	mov filehandle, eax
	mov edx, offset filewritebuffer
	mov ecx, buffersize
    call writetofile
	mov eax, filehandle
	call closefile
	ret
rewritefile endp

emptyfile proc
	mov esi,0
	mov ecx, arrlen
	iterator:
		mov filebuffer[esi], "_"
		mov filebuffer[esi+1], "_"
        mov filebuffer[esi+2], "_"
		mov filebuffer[esi+3], "_"
		mov filebuffer[esi+4], "_"
		mov filebuffer[esi+5], "_"
		mov filebuffer[esi+6], "_"
		mov filebuffer[esi+7], " "
		mov filebuffer[esi+8], "0"
        mov filebuffer[esi+9], "0"
		mov filebuffer[esi+10], "0"
		mov filebuffer[esi+11], "0"
		mov filebuffer[esi+12], 0ah
		add esi, 13
	loop iterator
	mov filebuffer[buffersize-1], 0
	ret
emptyfile endp


readhiscore proc
		readfiledata:
		mov edx,OFFSET filename
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.
        cmp eax,INVALID_HANDLE_VALUE ; error opening file?
        jne file_ok
        ; no: skip
        mWrite <"Cannot open file",0dh,0ah>
        jmp quit
        ; and quit
        file_ok:
        ; Read the file into a buffer.
        mov edx,OFFSET filebuffer
        mov ecx,buffersize
        call ReadFromFile
		cmp eax, 0
        jg continueFile
		call emptyfile		
		continueFile:
        buf_size_ok:
        mov filebuffer[eax],0
        ; insert null terminator
        ; Display the buffer.
        mov eax,fileHandle
        call CloseFile
        quit:
        ret
readhiscore endp

levelSelect proc
	call clrscr
	mov eax, Red + (Brown * 16)
	call settextcolor
	mov dl, 42
	mov dh, 4
	call gotoxy

	mWrite<"__     ____ __ __  ____ __     __ ">
	mov dh, 5
	call gotoxy
	mWrite<"||    ||    || || ||    ||    (( \">
	mov dh, 6
	call gotoxy
	mWrite<"||    ||==  \\ // ||==  ||     \\ ">
	mov dh, 7
	call gotoxy
	mWrite<"||__| ||___  \V/  ||___ ||__| \_))">
	mov dl, 40
	mov dh,10
	call gotoxy
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mWrite<"========================================">
        
	mov dh,11
	call gotoxy
	mov eax, LightMagenta + (BLACK  * 16)
	call settextcolor
	mWrite<"| 1. LEVEL 1 (POLICE HEADQUARTERS)     |">
	mov dh, 12
	call gotoxy
	mWrite<"| 2. LEVEL 2 (JUNGLE DESERT TEMPLE)    |">
	mov dh, 13
	call gotoxy
	mWrite<"| 3. LEVEL 3 (CANDYCANE KINGDOM)       |">
	mov dh, 14
	call gotoxy
	mWrite<"|    PRESS ANY OTHER KEY TO GO BACK    |">
	mov dh, 15
	call gotoxy
	mov eax, Yellow + (BLACK  * 16)
	call settextcolor
	mWrite<"========================================">
	call readchar
	ret
levelSelect endp

copyMAze proc
	push ebp
	mov ebp, esp
	mov edx, [ebp + 8]
	mov ecx, 10
	mov esi,0
	copyLoop:
		mov tempword, cx
		mov ecx, 81
		innerCopyLoop:
			mov bl, byte ptr[edx + esi]
			mov tempmaze[esi], bl
			inc esi
		loop innerCopyLoop
		movzx ecx, tempword
	loop copyLoop
	pop ebp
	ret 4
copymaze endp

pastemaze proc
	cmp level, 1
	jg secondLEvel
	mov edx, offset maze1
	jmp paste
	secondLevel:
		cmp level, 2
		jg thirdLevel
		mov edx, offset maze2
		jmp paste
	thirdLevel:
		mov edx, offset maze3
	paste:
	mov ecx, 10
	mov esi,0
	copyLoop:
		mov tempword, cx
		mov ecx, 81
		innerCopyLoop:
			mov bl, tempmaze[esi]
			mov [edx + esi], bl
			inc esi
		loop innerCopyLoop
		movzx ecx, tempword
	loop copyLoop
	ret 
pastemaze endp

main PROC
	call readhiscore
	INVOKE PlaySoundA, OFFSET music3, NULL, 2001h
	call titleScreen
	call getName
	menuLoop:
		INVOKE PlaySoundA, OFFSET music1, NULL, 2001h
		call menu
		mov score, 0
		mov lives, 4
	cmp al, '1'
	je choosestart
	cmp al, '2'
	je callInstruction
	cmp al, '3'
	je chooseLevel
	jmp exitGame
	chooseLevel:
		call levelselect
		cmp al, "1"
		jne level2
		push offset maze1
		call copymaze
		mov level, 0
		jmp startGame
		level2:
			cmp al, "2"
			jne level3	
			push offset maze2
			call copymaze
			mov level, 1
			jmp startGame
		level3:
			cmp al, "3"
			jne goBack
			mov level, 2
			push offset maze3
			call copymaze	
			jmp startGame 	
		goBack:
		jmp menuLoop
	callinstruction:
		call instructions
		jmp menuLoop
	exitCheck:
	jg menuLoop
	choosestart:
		mov level, 0
		push offset maze1
		call copymaze
	startGame:
	cmp level, 2
	je othersound
	INVOKE PlaySoundA, OFFSET music2, NULL, 2001h
	jmp skipsound
	othersound:
		INVOKE PlaySoundA, OFFSET music4, NULL, 2001h
	skipsound:
	mov eax,Yellow +(Black*16)
	call SetTextColor
	call clrscr

	mov eax,Yellow +(Black*16)
	call SetTextColor
	call clrscr
	mov xPos, 65
	mov yPos, 4

	;ghost1
	mov g1X,64
	mov g1Y,19
	;ghost2
	mov g2X, 65
	mov g2Y,19
	inc lives
	inc level
	cmp level,3
	je moreghosts
	jg endGame
	jmp continueStart
	moreghosts:
		;ghost1
		mov g3X,66
		mov g3Y,19
		;ghost2 
		mov g4X, 67
		mov g4Y,19
	continueStart:
	mov direction, 'n'
	call levelScreen
	mov eax, Blue + (Black* 16)
	call setTextColor

	call DrawMaze
	mov eax, white + (Black* 16)
	call DrawPlayer 
	call setTextColor
	call Randomize
	gameLoop:
		cmp lives, 0
		jle endGame
		mov eax,yellow+(black * 16)
		call SetTextColor

		; draw score:
		mov dl,2
		mov dh,8
		call Gotoxy
		mov edx,OFFSET strScore
		call WriteString
		mov ax,score
		call WriteInt
		mov dl,2
		mov dh,10
		call Gotoxy
		mov edx,OFFSET strLevel
		call WriteString
		movzx eax,level
		call WriteInt

		mov dl,2
		mov dh,12
		call Gotoxy
		mov edx,OFFSET strLives
		call WriteString
		movzx eax,lives
		call WriteInt
		mov edx, 0
		; get user key input:
		mov dl,28
		mov dh,26
		call gotoxy
		mWrite<"PLAYER NAME: ">
		mov edx, offset PlayerName
		call writeString
		call Gotoxy
		mov eax, 90
		call delay
		ghost1:
			;jmp randomMove1
			push offset tempchar1
			push offset rand1
			movzx eax, yPos
			push eax
			movzx eax, xPos
			push eax
			push offset g1Y
			push offset g1X  
			call ghostmove
			cmp rand1, 1
			jne continueGameLoop1
			randomMove1:
			push offset tempchar1
			push offset dir1
			push offset g1Y
			push offset g1X
			call ghostrandom
			cmp hitwall, 1
			jne continueGameLoop1
			mov hitwall, 0
			continueGameLoop1:
			movzx eax, rand1
			push eax
			movzx eax, g1X
			push eax
			movzx eax, g1Y
			push eax
			push offset tempchar1
			call drawghost
		ghost2: 
			push offset tempchar2
			push offset rand2
			movzx eax, yPos
			push eax
			movzx eax, xPos
			push eax
			push offset g2Y
			push offset g2X  
			call ghostmove
			cmp rand2, 1
			jne continueGameLoop2
			randomMove2:
			push offset tempchar2
			push offset dir2
			push offset g2Y
			push offset g2X
			call ghostrandom
			cmp hitwall, 1
			jne continueGameLoop2
			mov hitwall, 0
			continueGameLoop2:
			movzx eax, rand2
			push eax
			movzx eax, g2X
			push eax
			movzx eax, g2Y
			push eax
			push offset tempchar2
			call drawghost
		cmp level,3 
		jl continueGame
		ghost3:
			push offset tempchar3
			push offset dir3
			push offset g3Y
			push offset g3X
			call ghostrandom
			cmp hitwall, 1
			jne continueGameLoop3
			mov hitwall, 0
			continueGameLoop3:
			movzx eax, rand3
			push eax
			movzx eax, g3X
			push eax
			movzx eax, g3Y
			push eax
			push offset tempchar3
			call drawghost
		ghost4:
			push offset tempchar4
			push offset dir4
			push offset g4Y
			push offset g4X
			call ghostrandom
			cmp hitwall, 1
			jne continueGameLoop4
			mov hitwall, 0
			continueGameLoop4:
			movzx eax, rand4
			push eax
			movzx eax, g4X
			push eax
			movzx eax, g4Y
			push eax
			push offset tempchar4
			call drawghost
	continueGame:
		cmp word ptr pellets, 0
		jg continueLevel
		cmp fruits,0
		jg startGame
		mov pellets, 0
		mov fruits, 0
		jmp startGame
		continueLevel:
		call respawn
		cmp al,2
		jne continueRead
		je endGame
		continueRead:
		call readkey
		jz noKey
		mov inputChar,al

		; exit game if user types 'x':
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight
		
		cmp inputChar,"p"
		je pauseLoop
		jmp noKey
		pauseLoop:
			call pausegame
			cmp al, "m"
			je jumpToMenu
			call drawmaze
			call drawplayer
			jmp noKey
			jumpToMenu:
				call pastemaze
				jmp menuLoop
		noKey:

			
		cmp direction, 'r'
		je moveRight

		cmp direction, 'l'
		je moveLeft

		cmp direction, 'u'
		je moveUp

		cmp direction, 'd'
		je moveDown

		mov eax, 0
		
		jmp checkDeath

		moveUp:
		; allow player to jump:
		dec yPos
		mov dl, xPos
		mov dh, yPos
		call mazeVal
		cmp al,1
		je ContinueMoveUp
		inc yPos
		jmp checkDeath
		ContinueMoveUp:
			inc yPos		
			call UpdatePlayer
			dec yPos
			mov dl, xPos
			mov dh, yPos
			call valueAt
			cmp al,'.'
			je pellet1
		    cmp al,'8'
			je fruit1
			jmp noScore1
			pellet1:
				inc word ptr score
				dec word ptr pellets
				jmp noScore1
			fruit1:
				add word ptr score, 10
				dec byte ptr fruits
			noScore1:
				call DrawPlayer
				mov direction, 'u'
				jmp checkDeath

		moveDown:
		inc yPos
		mov dl, xPos
		mov dh, yPos
		call mazeVal
		cmp al,1
		je ContinueMoveDown
		dec yPos
		jmp checkDeath
		ContinueMoveDown:
		    dec yPos
			call UpdatePlayer
			inc yPos
			mov dl, xPos
			mov dh, yPos
			call valueAt
			cmp al,'.'
			je pellet2
		    cmp al,'8'
			je fruit2
			jmp noScore2
			pellet2:
				inc word ptr score
				dec word ptr pellets
				jmp noScore2
			fruit2:
				add word ptr score, 10
				dec byte ptr fruits
			noScore2:
				call DrawPlayer
				mov direction, 'd'
				jmp checkDeath

		moveLeft:
		dec xPos
		mov dl, xPos
		mov dh, yPos
		call mazeVal
		cmp al,1
		je ContinueMoveLeft 
		call valueAt
		cmp al,'['
		je noScore3
		inc xPos
		jmp checkDeath
		ContinueMoveLeft:
			inc xPos
			call UpdatePlayer
			dec xPos
			mov dl, xPos
			mov dh, yPos
			call valueAt
			cmp al,'.'
			je pellet3
		    cmp al,'8'
			je fruit3
			jmp noScore3
			pellet3:
				inc word ptr score
				dec word ptr pellets
				jmp noScore3
			fruit3:
				add word ptr score, 10
				dec byte ptr fruits
			noScore3:
				mov direction, 'l'
			    call teleport
				call DrawPlayer
				jmp checkDeath
		moveRight:
		inc xPos
		mov dl, xPos
		mov dh, yPos
		call mazeVal
		cmp al,1
		je ContinueMoveRight
		call valueAt
		cmp al,']'
		je noScore4
		dec xPos
		jmp checkDeath
		ContinueMoveRight:
			dec xPos
			call UpdatePlayer
			inc xPos
			mov dl, xPos
			mov dh, yPos
			call valueAt
			cmp al,'.'
			je pellet4
		    cmp al,'8'
			je fruit4
			jmp noScore4
			pellet4:
				inc word ptr score
				dec word ptr pellets
				jmp noScore4
			fruit4:
				add word ptr score, 10
				dec byte ptr fruits
			noScore4:
				mov direction, 'r'
				call teleport
				call DrawPlayer
				jmp checkDeath

			checkDeath:
				call respawn
				cmp al,2
				jne gameLoop
				je endGame
	jmp gameLoop
	endGame:
			
		call gameOver
		call sortAry
        call rewritefile
		exit
	exitGame:
		call clrscr
		mov eax, LightCyan +  (Black * 16)
		call settextcolor
		mov dl, 40
		mov dh, 5
		call gotoxy

		mWrite <"THANK YOU FOR PLAYING > : )">
		mov eax, White +  (Black * 16)
		call settextcolor
	exit
main ENDP
end main

main ENDP
END main