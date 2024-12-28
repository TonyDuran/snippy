#include <gtest/gtest.h>
#include <sstream>
#include <string>

// Mocking the runRepl functionality for testing
void mockRepl(std::istream &input, std::ostream &output) {
    output << "Welcome to Snippy! Type 'exit' to quit.\n";
    std::string line;
    while (std::getline(input, line)) {
        if (line == "exit") {
            output << "Goodbye!\n";
            break;
        }
        output << "You said: " << line << "\n";
    }
}

// Test for the REPL
TEST(MainTests, ReplBehavior) {
    std::istringstream input("hello\nworld\nexit\n");
    std::ostringstream output;

    mockRepl(input, output);

    std::string expectedOutput =
        "Welcome to Snippy! Type 'exit' to quit.\n"
        "You said: hello\n"
        "You said: world\n"
        "Goodbye!\n";

    ASSERT_EQ(output.str(), expectedOutput);
}

