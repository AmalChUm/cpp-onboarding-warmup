#pragma once

#include <string>

// Return the sum of all even numbers in arr[0..size-1].
int sumEvenNumbers(const int arr[], int size);

// Return the number of times target appears in text.
int countCharOccurrences(const std::string& text, char target);

// Set minVal and maxVal to the smallest and largest values in arr.
// The caller provides an array with size > 0.
void getArrayBounds(const int arr[], int size, int& minVal, int& maxVal);
