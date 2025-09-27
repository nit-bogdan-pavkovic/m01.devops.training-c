#include <assert.h>
#include "calculator.h"

void test_add() {
    assert(add(2, 3) == 5);
}

void test_subtract() {
    assert(subtract(5, 3) == 2);
}

void test_multiply() {
    assert(multiply(3, 4) == 12);
}

void test_divide() {
    // Basic division test
    assert(divide(10, 2) == 5.0);
}

int main() {
    test_add();
    test_subtract();
    test_multiply();
    test_divide();
    return 0;
}

