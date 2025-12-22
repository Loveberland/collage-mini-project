#include <stdio.h>

#define ROWS 3
#define COLS 3

extern long add(long a, long b);
extern long sub(long a, long b);
extern long mul(long a, long b);
extern long div(long a, long b);
extern long mod(long a, long b);
extern long findSerie(long a);
extern long power(long a, long b);
extern long findAbs(long a);
extern long findSumArray(long* a, long b);
extern long findSumArrayTwo(long* a, long rows, long cols);
extern long findFac(long a);
extern long findStrLen(char* a);
extern long isUpper(char a);
extern double findAreaCircle(double a);
extern void brightness(long* a, long increase, long rows, long cols);
extern void caesar(char* arr, long shifter);
extern void bubbleSort(long* arr, long length);

void printArr(long* arr) {
	for (int i = 0; i < sizeof(arr) / sizeof(int); i++) printf(arr[i]);
}

void printfLine() { printf("\n------------------------------\n\n"); }

int main(void) {
        printfLine();

	printf("First number: 4, Second number: 2\n");
        printf("Addition: %ld\nSubtraction: %ld\nMultiplication: %ld\nDivide: %ld\nModulus: %ld\n", add(4, 2), sub(4,2), mul(4, 2), div(4, 2), mod(4, 2));

        printfLine();

        printf("Find serie of: 25\nAnswer: %ld\n", findSerie(25));

        printfLine();

        printf("Find power of [(Base): 2, (EXP): 8]: %ld\n", power(2, 8));

        printfLine();

        printf("Find absolute of -123: %ld\n", findAbs(-123));

	printfLine();

	long arr[7] = {5, 2, 3, 5, 1, 2, -1};
	printf("Find summary of this array {5, 2, 3, 5, 1, 2, -1}: %ld\n", findSumArray(arr, sizeof(arr) / sizeof(long)));

	printfLine();

	long arrTwo[ROWS][COLS] = {
		{1, 2, 3},
		{4, 5, 6},
		{7, 8, 9}
	};
	printf("Find Summary of array 2D [1-9]: %ld\n", findSumArrayTwo((long*)arrTwo, ROWS, COLS));

	printfLine();

	printf("Find factorial of 23: %ld\n", findFac(23));

	printfLine();

	printf("Find length of this string [\"Loveberland\"]: %ld\n", findStrLen("Loveberland"));

	printfLine();

	printf("\'L\' it's upper? [if 1 = upper, 0 = lower]: %ld\n", isUpper('L'));

	printfLine();

	printf("Radius is 32 area of circle is: %.2lf\n", findAreaCircle(32.0));

	printfLine();

	long image[ROWS][COLS] = {
		{21, 22, 23},
		{24, 25, 26},
		{27, 28, 29}
	};
	printf("Increase brightness 10%% of this array[21 - 29]: \n");
	brightness(&image[0][0], 10, ROWS, COLS);
	printf("Debug\n");
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) printf("%d ", image[i][j]);
		printf("\n");
	}

	printfLine();

	char word[] = "hello, world";
	caesar(&word[0], 5);
	printf("Encode caesar cipher 5 \"hello, world\": %s\n", word);

	printfLine();

	int bubble[] = {63, 234, 565, 1, 13, 454, 676, 9};
	printf("Bubble sort fromt this: ");
	printArr(&bubble[0]));
	printf("\nTo this: ");
	printArr(&bubble[0], 8));

	printfLine();

	return 0;
}
