CXX = g++
CXXFLAGS = -std=c++14 -Wall -Wextra -Werror -I/opt/homebrew/include
LDFLAGS = -L/opt/homebrew/lib -lgtest -lgtest_main -lpthread
SRCDIR = src
BUILDDIR = build
TESTDIR = tests

SRC = $(wildcard $(SRCDIR)/**/*.cpp $(SRCDIR)/*.cpp)
OBJ = $(SRC:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

TESTSRC = $(wildcard $(TESTDIR)/*.cpp)
TESTOBJ = $(TESTSRC:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)

TARGET = snippy
TEST_TARGET = test_snippy

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(TEST_TARGET)

$(TEST_TARGET): $(OBJ) $(TESTOBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

clean:
	rm -rf $(BUILDDIR) $(TARGET) $(TEST_TARGET)

.PHONY: all clean test

