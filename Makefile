CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -pedantic -g

.PHONY: all test clean

all: test

test: build/test_warmup
	./build/test_warmup

build/test_warmup: src/warmup.cpp src/warmup.h tests/test_warmup.cpp
	@mkdir -p build
	$(CXX) $(CXXFLAGS) -Isrc src/warmup.cpp tests/test_warmup.cpp -o $@

clean:
	rm -rf build
