# Compiler and flags
CC = gcc
CFLAGS = -Iinclude -Wall -Wextra -std=c99

# Library source files
LIB_SRC = src/calculator.c
LIB_OBJ = $(LIB_SRC:.c=.o)

# Application source file (optional)
APP_SRC = src/main.c
# If src/main.c exists, compile it; otherwise, APP_OBJ remains empty.
ifneq ($(wildcard $(APP_SRC)),)
APP_OBJ = $(APP_SRC:.c=.o)
else
APP_OBJ =
endif

# Test source files
TEST_SRC = tests/test_calculator.c
TEST_OBJ = $(TEST_SRC:.c=.o)

# Output targets
APP_TARGET = app
TEST_TARGET = runTests

.PHONY: all app test clean lint

# Default target builds both app (if main exists) and tests.
all: app test

# Build the application only if a main file exists.
app: $(LIB_OBJ) $(APP_OBJ)
	@if [ -f $(APP_SRC) ]; then \
		$(CC) $(CFLAGS) -o $(APP_TARGET) $(LIB_OBJ) $(APP_OBJ); \
		echo "Application built: $(APP_TARGET)"; \
	else \
		echo "No main file found at $(APP_SRC). Skipping app build."; \
	fi

# Build and run tests.
test: $(LIB_OBJ) $(TEST_OBJ)
	$(CC) $(CFLAGS) -o $(TEST_TARGET) $(LIB_OBJ) $(TEST_OBJ)
	@echo "Test executable built: $(TEST_TARGET)"
	@echo "Running tests..."
	./$(TEST_TARGET)

# Generic rule for compiling C files.
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Remove all build artifacts.
clean:
	rm -f $(LIB_OBJ) $(APP_OBJ) $(TEST_OBJ) $(APP_TARGET) $(TEST_TARGET)

# Run static analysis using cppcheck.
lint:
	cppcheck --enable=all --inconclusive --std=c99 -I include .

