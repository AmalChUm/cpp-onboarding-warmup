#include "../src/warmup.h"

#include <iostream>
#include <string>

namespace {
int failures = 0;

void check(const std::string& name, int actual, int expected) {
    if (actual == expected) {
        std::cout << "PASS: " << name << " -> " << actual << '\n';
    } else {
        std::cout << "FAIL: " << name << " -> expected " << expected
                  << ", got " << actual << '\n';
        ++failures;
    }
}
}  // namespace

int main() {
    const int sample1[] = {1, 2, 1};
    const int sample2[] = {1, 1, 1, 1};
    const int sample3[] = {5, 1, 5};
    const int sample4[] = {1, 5, 2, 6, 1};
    const int sample5[] = {10, 11};

    check("one spike", countSpikes(sample1, 3), 1);
    check("no spikes", countSpikes(sample2, 4), 0);
    check("low middle is not a spike", countSpikes(sample3, 3), 0);
    check("multiple spikes", countSpikes(sample4, 5), 2);
    check("fewer than three readings", countSpikes(sample5, 2), 0);
    check("empty input", countSpikes(nullptr, 0), 0);

    if (failures != 0) {
        std::cout << failures << " test(s) failed.\n";
        return 1;
    }

    std::cout << "All tests passed.\n";
    return 0;
}
