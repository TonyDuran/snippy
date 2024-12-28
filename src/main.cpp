#include <iostream>
#include <string>

// Snippy's REPL (Read-Eval-Print Loop)
void runRepl() {
    std::cout << "Welcome to Snippy! Type 'exit' to quit.\n";
    std::string line;
    while (true) {
        std::cout << ">> ";
        std::getline(std::cin, line);

        if (line == "exit") {
            std::cout << "Goodbye!\n";
            break;
        }

        // Echo back the input for now
        std::cout << "You said: " << line << "\n";
    }
}

int main() {
    runRepl();
    return 0;
}

