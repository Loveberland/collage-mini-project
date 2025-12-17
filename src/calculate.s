.section .text
.global add
.global sub
.global mul
.global div
.global mod
.global findSerie
.global power
.global findAbs

/*
	In unix %rdi is first argument register,
	%rsi is second argument register,
	%rax is return register
*/

add:
        movq %rdi, %rax
        addq %rsi, %rax
        ret

sub:
        movq %rdi, %rax
        subq %rsi, %rax
        ret

mul:
        movq %rdi, %rax
        imulq %rsi, %rax
        ret

div:
        movq %rsi, %r8
        movq %rdi, %rax
        cqo
        idivq %r8
        ret

mod:
        movq %rsi, %r8
        movq %rdi, %rax
        cqo
        idivq %r8       /* rax = a / b */
        movq %rsi, %rax /* reminder will assign to %rdx after use idivq */
        ret

findSerie:
        movq %rdi, %rax
        movq %rdi, %r8
        addq $1, %r8    /* n + 1 */
        imulq %r8, %rax /* n(n + 1) */
        movq $2, %r9
        cqo
        idivq %r9       /* Divide rax by 2 */
        ret

power:
        movq $1, %rax

powerLoop:
        cmpq $0, %rsi   /* Check if EXP is 0 */
        jle powerEnd    /* If EXP <= 0, jump to end */

        imulq %rdi, %rax
        decq %rsi       /* %rdx-- */
        jmp powerLoop

powerEnd:
        ret

findAbs:
        movslq %edi, %rax
        cmpq $0, %rax   /* Compare %rax with 0 */
        jge findAbsEnd  /* If %rax greater than 0, end */
        negq %rax

findAbsEnd:
        ret
