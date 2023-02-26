BITS 64

global main
extern fopen, fprintf, fclose, strcat, system, sprintf, strcpy

section .data
y: db "Grognasse", 0
u: dd 1
t: db "%d", 0
p: db ".s", 0
n: times 100 db 0
w: times 100 db 0
x: times 100 db 0
q: db "rm *.o", 0
k: db "nasm -f elf64 ", 0
g: db "gcc -Wl,-z,noexecstack -no-pie *.o", 0
o: db "./a.out &", 0
m: db "w", 0
s: db "BITS 64%2$c%2$cglobal main%2$cextern fopen, fprintf, fclose, strcat, system, sprintf, strcpy%2$c%2$csection .data%2$cy: db %3$cGrognasse%3$c, 0%2$cu: dd %4$d%2$ct: db %3$c%%d%3$c, 0%2$cp: db %3$c.s%3$c, 0%2$cn: times 100 db 0%2$cw: times 100 db 0%2$cx: times 100 db 0%2$cq: db %3$crm *.o%3$c, 0%2$ck: db %3$cnasm -f elf64 %3$c, 0%2$cg: db %3$cgcc -Wl,-z,noexecstack -no-pie *.o%3$c, 0%2$co: db %3$c./a.out &%3$c, 0%2$cm: db %3$cw%3$c, 0%2$cs: db %3$c%1$s%3$c, 0%2$c%2$csection .text%2$c%2$c; c1%2$cmain:%2$c    ; c2%2$c    mov r10, [u]%2$c_loop:%2$c    push rbp%2$c    jmp _name%2$c_suite:%2$c    mov rdi, w%2$c    mov rsi, m%2$c    call fopen%2$c    mov r12, rax%2$c    mov rdi, r12%2$c    mov rsi, s%2$c    mov rdx, s%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    movzx r9, word [u]%2$c    inc r9%2$c    call fprintf%2$c    mov rdi, r12%2$c    call fclose%2$c    jmp _cmd%2$c%2$c_name:%2$c    mov rdi, n%2$c    mov rsi, t%2$c    movzx rdx, word [u]%2$c    sub rdx, 1%2$c    call sprintf%2$c    mov rdi, w%2$c    mov rsi, y%2$c    call strcpy%2$c    mov rdi, w%2$c    mov rsi, n%2$c    call strcat%2$c    mov rdi, w%2$c    mov rsi, p%2$c    call strcat%2$c    jmp _suite%2$c%2$c_cmd:%2$c    mov rdi, q%2$c    call system%2$c    mov rdi, x%2$c    mov rsi, k%2$c    call strcpy%2$c    mov rdi, x%2$c    mov rsi, w%2$c    call strcat%2$c    mov rdi, x%2$c    call system%2$c    mov rdi, g%2$c    call system%2$c    mov rdi, o%2$c    call system%2$c    sub r10, 1%2$c    cmp r10, 0%2$c    je _exit%2$c    jmp _loop%2$c%2$c_exit:%2$c    mov rax, 60%2$c    mov rdi, 0%2$c    syscall%2$c", 0

section .text

; c1
main:
    ; c2
    mov r10, [u]
_loop:
    push rbp
    jmp _name
_suite:
    mov rdi, w
    mov rsi, m
    call fopen
    mov r12, rax
    mov rdi, r12
    mov rsi, s
    mov rdx, s
    mov rcx, 10
    mov r8, 34
    movzx r9, word [u]
    inc r9
    call fprintf
    mov rdi, r12
    call fclose
    jmp _cmd

_name:
    mov rdi, n
    mov rsi, t
    movzx rdx, word [u]
    sub rdx, 1
    call sprintf
    mov rdi, w
    mov rsi, y
    call strcpy
    mov rdi, w
    mov rsi, n
    call strcat
    mov rdi, w
    mov rsi, p
    call strcat
    jmp _suite

_cmd:
    mov rdi, q
    call system
    mov rdi, x
    mov rsi, k
    call strcpy
    mov rdi, x
    mov rsi, w
    call strcat
    mov rdi, x
    call system
    mov rdi, g
    call system
    mov rdi, o
    call system
    sub r10, 1
    cmp r10, 0
    je _exit
    jmp _loop
    
_exit:
    mov rax, 60
    mov rdi, 0
    syscall