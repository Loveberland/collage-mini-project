.section .text
.global add
.global sub
.global mul
.global div
.global mod
.global findSerie
.global power
.global findAbs

// %rcx is first argument, %rdx is second argument, %rax is return registor

add:
        movq %rcx, %rax      
        addq %rdx, %rax      
        ret

sub:
        movq %rcx, %rax      
        subq %rdx, %rax      
        ret

mul:
        movq %rcx, %rax      
        imulq %rdx, %rax     
        ret

div:
        movq %rdx, %r8       
        movq %rcx, %rax      
        cqo                  
        idivq %r8            
        ret

mod:
        movq %rdx, %r8
        movq %rcx, %rax
        cqo
        idivq %r8       # rax = a / b
        movq %rdx, %rax # reminder will assign to %rdx after use idivq
        ret

findSerie:
        movq %rcx, %rax
        movq %rcx, %r8
        addq $1, %r8    # n + 1
        imulq %r8, %rax # n(n + 1)
        movq $2, %r9
        cqo
        idivq %r9       # Divide rax by 2
        ret

power:
        movq $1, %rax

powerLoop:
        cmpq $0, %rdx   # Check if EXP is 0
        jle powerEnd    # If EXP <= 0, jump to end

        imulq %rcx, %rax
        decq %rdx       # %rdx--
        jmp powerLoop

powerEnd:
        ret

findAbs:
        movslq %ecx, %rax
        cmpq $0, %rax   # Compare %rax with 0
        jge findAbsEnd  # If %rax greater than 0, end
        negq %rax

findAbsEnd:
        ret
