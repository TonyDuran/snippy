# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++14 -Wall -Wextra -Werror -I/opt/homebrew/include

# Directories
SRCDIR = src
BUILDDIR = build
TESTDIR = tests
INCDIR = include

# Files
SRC = $(SRCDIR)/main.cpp
TESTSRC = $(TESTDIR)/*.cpp
OBJ = $(SRC:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TESTOBJ = $(TESTSRC:%.cpp=$(BUILDDIR)/%.o)

# Targets
TARGET = snippy
TESTTARGET = test_snippy

# Main application build
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -c $< -o $@

# Test build (exclude main.cpp)
test: $(TESTTARGET)

$(TESTTARGET): $(TESTOBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ -L/opt/homebrew/lib -lgtest -lgtest_main -lpthread

$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -c $< -o $@

clean:
	rm -rf $(BUILDDIR) $(TARGET) $(TESTTARGET)

.PHONY: all test clean
