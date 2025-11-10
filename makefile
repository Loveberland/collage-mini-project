CXX = g++
ASM = nasm
CXXFLAGS = -std=c++17 -Wall
ASMFLAGS = -f elf64

SRC_DIR = src
OBJ_DIR = obj
TARGET = calc

OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/cal.o

all: $(TARGET)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/cal.o: $(SRC_DIR)/cal.asm | $(OBJ_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

$(TARGET): $(OBJS)
	$(CXX) $^ -o $@

clean:
	rm -rf $(OBJ_DIR) $(TARGET)
