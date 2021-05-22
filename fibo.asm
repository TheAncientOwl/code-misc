.model small
.stack 100h

.data
     task     db '>> Sa se genereze primii n termeni ai sirului lui Fibonacci.',13,10,'>> n < 26 pt. ca al 26-lea termen este 75025 care nu incape pe 16 biti',13,10,'$'
     nAd      db 13,10,'>> Caracterul introdus nu este o cifra!',13,10,'$'
     reqN     db '>> n = ','$'
     invalidN db 13,10,'[Error] Numarul introdus > 25!',13,10,'$'
     newLine  db '',13,10,'$'
     power    dw 10d
     n        dw 0d
     x        dw 0d
     y        dw 0d
     z        dw 0d
     temp     dw 0d
     
.code
new_line:
     mov dx, offset newLine
     mov ah, 09h
     int 21h
     ret

read_n:
     request_n:
          mov dx, offset reqN
          mov ah, 09h
          int 21h
     mov n, 0
     mov cx, 2
     input_loop:
          read_digit:
               mov ah, 01h
               int 21h

          is_enter:
               cmp al, 0Dh
               je  valid_n

          greater_or_equals_than_0:
               cmp al, 30h
               jge less_or_equals_than_9
               jmp not_a_digit

          less_or_equals_than_9:
               cmp al, 39h
               jle is_a_digit
               jmp not_a_digit

          not_a_digit:
               mov dx, offset nAd
               mov ah, 09h
               int 21h
               jmp return

          is_a_digit:
               sub al, 30h
               xor bx, bx
               mov bl, al

               mov ax, n
               mul power
               add ax, bx
               mov n, ax
          loop input_loop
     call new_line
     ret

print_number:
     xor cx, cx
     xor dx, dx
     mov bx, 10
     push_last_digit:
          div  bx
          add  cx, 1d
          push dx
          xor  dx, dx
          cmp  ax, 0d
          jne  push_last_digit

     print_digits:
          pop dx
          add dx, 30h
          mov ah, 02h
          int 21h
          loop print_digits
     ret


; -=-=-=-=-=-= MAIN =-=-=-=-=-=- ;
main:
     init:
          mov ax, @data
          mov ds, ax

     print_task:
          mov dx, offset task
          mov ah, 09h
          int 21h

     call read_n

     valid_n:
          mov ax, n
          cmp ax, 26
          jge invalid_n
          jmp fibonacci

     invalid_n:
          mov dx, offset invalidN
          mov ah, 09h
          int 21h
          jmp return
     
     fibonacci:
          mov ax, n

          cmp n, 0d
          je  return

          print_first:
               mov dx, 30h
               mov ah, 02h
               int 21h
               call new_line
               cmp n, 1d
               je  return

          print_second:
               mov dx, 31h
               mov ah, 02h
               int 21h
               call new_line
               cmp n, 2d
               je  return

          print_third:
               mov dx, 31h
               mov ah, 02h
               int 21h
               call new_line
               cmp n, 3d
               je  return

          mov x, 0
          mov y, 1
          mov z, 1
          mov ax, n
          sub ax, 3
          mov cx, ax
          
          fibo_loop:
               mov ax, y
               mov x, ax

               mov ax, z
               mov y, ax

               add ax, x
               mov z, ax

               mov temp, cx
               call print_number
               mov cx, temp
               call new_line

               loop fibo_loop

     return:
          mov ah,4Ch
          int 21h
end main