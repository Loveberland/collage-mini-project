OUT := bin
OBJ := obj
CC  := gcc

# 1. Find all .c and .s files in src/
SOURCES := $(wildcard src/*.c src/*.s)

# 2. create a list of object files (e.g. src/main.c becomes obj/main.o)
OBJECTS := $(patsubst src/%.c, $(OBJ)/%.o, $(wildcard src/*.c)) \
           $(patsubst src/%.s, $(OBJ)/%.o, $(wildcard src/*.s))

# 3. Default target
all: $(OUT)/program

# 4. Link: Create the binary from object files
$(OUT)/program: $(OBJECTS)
	mkdir -p $(OUT)
	$(CC) $(OBJECTS) -o $@

# 5. Compile: Rule for .c files
$(OBJ)/%.o: src/%.c
	mkdir -p $(OBJ)
	$(CC) -c $< -o $@

# 6. Compile: Rule for .s files
$(OBJ)/%.o: src/%.s
	mkdir -p $(OBJ)
	$(CC) -c $< -o $@

clean:
	rm -rf $(OUT) $(OBJ)

run: all
	./$(OUT)/program
