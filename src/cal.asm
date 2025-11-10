section .text
global add_numbers, sub_numbers, mul_numbers, div_numbers

add_numbers:
        mov rax, rdi
        add rax, rsi
        ret

sub_numbers:
        mov rax, rdi
        sub rax, rsi
        ret

mul_numbers:
        mov rax, rdi
        imul rax, rsi
        ret

div_numbers:
        mov rax, rdi
        cqo
        idiv rsi
        ret