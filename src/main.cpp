#include <print>

int main() {
    typename [:^^int:] const value = 42;
    std::println("The value is: {}", value);
}
