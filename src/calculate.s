.section .text
.global add
.global sub
.global mul
.global div
.global mod
.global findSerie
.global power
.global findAbs
.global findSumArray
.global findSumArrayTwo

/*
	In unix %rdi is first argument register,
	%rsi is second argument register,
	%rax is return register
*/

/* Addiction */

add:
        movq %rdi, %rax
        addq %rsi, %rax
        ret

/* Subtraction */

sub:
        movq %rdi, %rax
        subq %rsi, %rax
        ret

/* Multiplication */

mul:
        movq %rdi, %rax
        imulq %rsi, %rax
        ret

/* Divide */

div:
        movq %rsi, %r8
        movq %rdi, %rax
        cqo
        idivq %r8
        ret

/* Modulus */

mod:
        movq %rsi, %r8
        movq %rdi, %rax
        cqo
        idivq %r8       /* rax = a / b */
        movq %rsi, %rax /* reminder will assign to %rdx after use idivq */
        ret

/* Find series */

findSerie:
        movq %rdi, %rax
        movq %rdi, %r8
        addq $1, %r8    /* n + 1 */
        imulq %r8, %rax /* n(n + 1) */
        movq $2, %r9
        cqo
        idivq %r9       /* Divide rax by 2 */
        ret

/* Find power */

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

/* Find absolute*/

findAbs:
        movslq %edi, %rax
        cmpq $0, %rax   /* Compare %rax with 0 */
        jge findAbsEnd  /* If %rax greater than 0, end */
        negq %rax

findAbsEnd:
        ret

/* Find array summary */

findSumArray:
	xorq %rax, %rax	/* make value of %rax = 0 */
	cmpq $0, %rsi
	jle findSumArrayEnd

findSumArrayCal:
	addq (%rdi), %rax	/* (%rdi) is mean dereference to value %rdi point */
	addq $8, %rdi
	decq %rsi
	jnz findSumArrayCal

findSumArrayEnd:
	ret

/* Find array 2D summary */

findSumArrayTwo:
	movq %rsi, %rcx;
	imulq %rdx, %rcx;	/* rows * cols */
	xorq %rax, %rax
	cmpq $0, %rcx
	jle findSumArrayTwoEnd

findSumArrayTwoCal:
	addq (%rdi), %rax
	addq $8, %rdi	/* move to next elements */
	decq %rcx
	jnz findSumArrayTwoCal

findSumArrayTwoEnd:
	ret
