OUT := bin
GCC := gcc

all:
	mkdir -p $(OUT)
	$(GCC) src/*.c src/*.s -o $(OUT)/program.exe

clean:
	rm -rf $(OUT)

run:
	./$(OUT)/program.exe
