BITS 64

global main
extern fopen, fprintf, fclose

section .data
n: db "Grace_kid.s", 0
m: db "w", 0
s: db "BITS 64%2$c%2$cglobal main%2$cextern fopen, fprintf, fclose%2$c%2$csection .data%2$cn: db %3$cGrace_kid.s%3$c, 0%2$cm: db %3$cw%3$c, 0%2$cs: db %3$c%1$s%3$c, 0%2$c%2$csection .text%2$c%2$c; c1%2$cmain:%2$c    ; c2%2$c    push rbp%2$c    mov rdi, n%2$c    mov rsi, m%2$c    call fopen%2$c    mov r12, rax%2$c    mov rdi, r12%2$c    mov rsi, s%2$c    mov rdx, s%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    call fprintf%2$c    mov rdi, r12%2$c    call fclose%2$c%2$c_exit:%2$c    mov rax, 60%2$c    mov rdi, 0%2$c    syscall%2$c", 0

section .text

; c1
main:
    ; c2
    push rbp
    mov rdi, n
    mov rsi, m
    call fopen
    mov r12, rax
    mov rdi, r12
    mov rsi, s
    mov rdx, s
    mov rcx, 10
    mov r8, 34
    call fprintf
    mov rdi, r12
    call fclose

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
