#include <stdio.h>

extern long add(long a, long b);
extern long sub(long a, long b);
extern long mul(long a, long b);
extern long div(long a, long b);
extern long mod(long a, long b);
extern long findSerie(long a);
extern long power(long a, long b);
extern long findAbs(long a);

void printfLine() { printf("\n------------------------------\n\n"); }

int main(void) {
        printf("First number: 4, Second number: 2\n");
        printf("Addition: %ld\nSubtraction: %ld\nMultiplication: %ld\nDivide: %ld\nModulus: %ld\n", add(4, 2), sub(4,2), mul(4, 2), div(4, 2), mod(4, 2));
        
        printfLine();
        
        printf("Find serie of: 25\nAnswer: %ld\n", findSerie(25));
        
        printfLine();

        printf("Find power of [(Base): 2, (EXP): 8]: %ld\n", power(2, 8));

        printfLine();

        printf("Find absolute of -123: %ld\n", findAbs(-123));

        return 0;
}
