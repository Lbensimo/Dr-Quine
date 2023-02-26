BITS 64

global main
extern printf

section .data
s: db "BITS 64%2$c%2$cglobal main%2$cextern printf%2$c%2$csection .data%2$cs: db %3$c%1$s%3$c, 0%2$c%2$csection .text%2$c%2$c; c1%2$cmain:%2$c    ; c2%2$c    push rbp%2$c    lea rdi, [rel s]%2$c    mov rsi, s%2$c    mov rdx, 10%2$c    mov rcx, 34%2$c    call printf%2$c%2$c_exit:%2$c    mov rax, 60%2$c    mov rdi, 0%2$c    syscall%2$c", 0

section .text

; c1
main:
    ; c2
    enter 0, 0
    lea rdi, [rel s]
    mov rsi, s
    mov rdx, 10
    mov rcx, 34
    call printf
    call _u

_u:
    xor rax, rax
    leave
    ret
