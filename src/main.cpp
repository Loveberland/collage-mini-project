#include <iostream>
#include <cstdlib>

extern "C" long add_numbers(long, long);
extern "C" long sub_numbers(long, long);
extern "C" long mul_numbers(long, long);
extern "C" long div_numbers(long, long);

int main(int argc, char* argv[]) {
        if (argc != 4) {
                std::cerr << "Usage: " << argv[0] << " <operand> <operator> <operand>" <<  std::endl;
                return 1;
        }

        long a = std::stol(argv[1]);
        std::string op = argv[2];
        long b = std::stol(argv[3]);
        long result;

        if (op == "+") result = add_numbers(a, b);
        else if (op == "-") result = sub_numbers(a, b);
        else if (op == "*") result = mul_numbers(a, b);
        else if (op == "/") result = div_numbers(a, b);
        else {
                std::cerr << "Unknown operator." << std::endl;
                return 1;
        }

        std::cout << result << std::endl;
        return 0;
}
