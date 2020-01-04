#include "cfi.S"

.text
.code64
.global trampoline
trampoline:
    push %rbp
    mov %rsp, %rbp
    push %rbx
    push %rcx
    push %r10
    push %r11
    push %r12
    push %r13
    push %r14
    push %r15
    xor %rax, %rax
    vmfunc
    mov $0xffff800002000000, %r15
    mov %r15, %rsp
    mov %rcx, %rax
    shl $0x20, %rax
    mov %fs:0x28, %rax
    mov %rax, -0x40(%rbp)
    mov $0x100000406a6e, %rcx
    call *%rcx
    mov %rax, %rbx
    mov -0x48(%rbp), %rax
    xor %fs:0x28, %rax
    xor %rax, %rax
    mov $0, %rcx
    vmfunc
    mov %rbx, %rax
    sub $0x40, %rbp
    mov %rbp, %rsp
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %r10
    pop %rcx
    pop %rbx
    pop %rbp
    ret


