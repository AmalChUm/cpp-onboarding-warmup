CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -pedantic -g
TARGET := build/warmup_test

.PHONY: all test clean

all: test

test: $(TARGET)
	./$(TARGET)

$(TARGET): src/warmup.cpp src/warmup.hpp tests/warmup_tests.cpp
	@mkdir -p build
	$(CXX) $(CXXFLAGS) src/warmup.cpp tests/warmup_tests.cpp -o $(TARGET)

clean:
	rm -rf build
