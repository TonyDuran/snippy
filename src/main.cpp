#include <iostream>
#include <string>
#include <cstdlib> // For std::exit

// Function to check if a file has the ".wtf" extension
bool isSnippyFile(const std::string &filename) {
    const std::string extension = ".wtf";
    if (filename.size() >= extension.size() &&
        filename.compare(filename.size() - extension.size(), extension.size(), extension) == 0) {
        return true;
    }
    return false;
}

int main(int argc, char *argv[]) {
    if (argc == 1) {
        std::cout << "REPL was executed.\n";
        return 0;
    }

    if (argc >= 3 && std::string(argv[1]) == "-c") {
        std::string command = argv[2];
        std::cout << "Executing command: " << command << "\n";
        return 0;
    }

    if (argc == 2) {
        std::string filename = argv[1];
        if (isSnippyFile(filename)) {
            std::cout << "Processing Snippy file: " << filename << "\n";
        } else {
            std::cerr << "Error: Unsupported file format. Expected a '.wtf' file.\n";
            std::exit(64); // EX_USAGE
        }
        return 0;
    }

    std::cerr << "Usage:\n"
              << "  snippy            # REPL mode\n"
              << "  snippy -c <cmd>   # Execute command\n"
              << "  snippy <file>     # Process Snippy file\n";
    std::exit(64); // EX_USAGE
}
