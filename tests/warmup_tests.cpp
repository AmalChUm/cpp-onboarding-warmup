#include <cassert>
#include <iostream>

#include "../src/warmup.hpp"

int main() {
    int nums[5] = {3, 4, 7, 10, 2};

    assert(sumEvenNumbers(nums, 5) == 16);
    assert(sumEvenNumbers(nums, 0) == 0);

    // Two uppercase C characters: the first character and the C in Cpp.
    assert(countCharOccurrences("CS-175-Cpp", 'C') == 2);
    assert(countCharOccurrences("CS-175-Cpp", 'z') == 0);

    int minVal = 0;
    int maxVal = 0;
    getArrayBounds(nums, 5, minVal, maxVal);
    assert(minVal == 2);
    assert(maxVal == 10);

    std::cout << "Warm-up build and tests passed!" << std::endl;
    return 0;
}
