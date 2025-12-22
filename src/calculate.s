.section .rodata
PI: .double 3.14

.text
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
.global findFac
.global findStrLen
.global isUpper
.global findAreaCircle
.global brightness
.global caesar
.global bubbleSort

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

/* Find factorial */

findFac:
	xorq %rax, %rax
	addq $1, %rax
	cmpq $1, %rdi
	jle findFacEnd

findFacCal:
	imulq %rdi, %rax
	decq %rdi
	cmpq $1, %rdi
	jg findFacCal

findFacEnd:
	ret

/* Find string length */

findStrLen:
	xorq %rax, %rax

findStrLenCal:
	cmpb $0, (%rdi)
	je findStrLenEnd
	incq %rax
	incq %rdi
	jmp findStrLenCal

findStrLenEnd:
	ret

/* Is upper */

isUpper:
	movb %dil, %al
	cmpb $65, %al
	jl isNotUpper
	cmpb $90, %al
	jg isNotUpper
	movq $1, %rax
	ret

isNotUpper:
	movq $0, %rax
	ret

/* Find area of circle */

findAreaCircle:
	mulsd %xmm0, %xmm0
	mulsd PI(%rip), %xmm0
	ret

/* config brightness */

brightness:
	imulq %rdx, %rcx
	testq %rcx, %rcx
	jz brightnessEnd
	movq %rsi, %r9

brightnessCal:
	movq (%rdi), %r8
	movq %r8, %rax
	cqto
	idivq %r9
	addq %rax, (%rdi)
	addq $8, %rdi
	decq %rcx
	jnz brightnessCal

brightnessEnd:
	ret

/* Caesar */
caesar:
	movq $26, %r9

caesarCal:
	cmpb $0, (%rdi)
	je caesarEnd
	movzbq (%rdi), %rax
	cmpq $'a', %rax
	jl caesarNext
	cmpq $'z', %rax
	jg caesarNext
	subq $'a', %rax
	addq %rsi, %rax
	cqto
	idivq %r9
	addq $'a', %rdx
	movb %dl, (%rdi)

caesarNext:
	incq %rdi
	jmp caesarCal

caesarEnd:
	ret

bubbleSort:
	cmpq $1, %rsi	/* If elements less than 1 return */
	jle .done
	decq %rsi

.outerLoop:
	xorq %rcx, %rcx

.innerLoop:
	cmpq %rsi, %rcx
	jge .nextPass
	movq (%rdi, %rcx, 8), %rax	/* %rax = arr[i] */
	movq 8(%rdi, %rcx, 8), %rdx	/* %rdx = arr[i + 1] */
	cmpq %rdx, %rax	/* %rax <= %rdx ? */
	jle .noSwap
	movq %rdx, (%rdi, %rcx, 8)	/* This is swap between %rdx, %rax */
	movq %rax, 8(%rdi, %rcx, 8)

.noSwap:
	incq %rcx
	jmp .innerLoop

.nextPass:
	decq %rsi
	jnz .outerLoop

.done:
	ret
