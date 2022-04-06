INCLUDE Irvine32.inc
key=23
bufmax=200
;-------------------------------------------------------------------------------------------------------------------
.data
msg byte "                                    ***********WE WARMLY WELCOME YOU *****************",0
msg1 byte "ENTER THE TEXT THAT YOU WANT TO encrypt ",0

msg2 byte "the cipher text of entered message is:   ",0

msg3 byte "decrypted: ",0

wrong BYTE,"yOU entered wrong key",0

keey BYTE "Enter key for decryption: ",0

buffer byte bufmax+1 DUP (0)

bufsize DWORD ?

;-------------------------------------------------------------------------------------------------------------------

.code

main proc
MOV EDX,OFFSET MSG
mov eax,yellow+(brown*16)
call settextcolor
call writestring

call crlf

call input
call translate
mov edx,offset msg2
mov eax,yellow+(cyan*16)
call settextcolor
call display
call translate
mov edx,offset keey
mov eax,yellow+(magenta*16)
call settextcolor
call writestring
call readdec
cmp eax,key
jne l1
mov edx,offset msg3
mov eax,yellow+(lightred*16)
call settextcolor
call writestring


call display


jmp l2
l1:
mov edx,OFFSET wrong
call writestring
l2:
call crlf


exit


main endp


;-------------------------------------------------------------------------------------------------------------------


input PROC
pushad         ;Pushes registers on stack

mov eax,(lightred*16) ;set the text color
call settextcolor


mov edx,offset msg1

call writestring
call crlf

mov ecx,bufmax
mov edx,offset buffer
call readstring
mov bufsize,eax
call crlf
popad
ret
input endp
;-------------------------------------------------------------------------------------------------------------------

display PROC
pushad
call writestring
mov edx,offset buffer
call writestring
call crlf
call crlf
popad
ret
display endp


;-------------------------------------------------------------------------------------------------------------------

translate PROC


pushad
mov ecx,bufsize
mov esi,0
l1:
xor buffer[esi],key
inc esi
loop l1
popad
ret
translate endp


end main