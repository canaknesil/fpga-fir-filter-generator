

CC := g++
CC_FLAGS = -w

SRCDIR := src/
BUILDDIR := build/
BINDIR := bin/

SRC := $(shell find ./$(SRCDIR) -name [^.]*.cpp) 
EXEC := run
LIB := -lwiringPi
INC := $(shell find ./(SRCDIR) -name [^.]*.h)


run: $(SRC) $(INC)
	$(CC) -o $(BINDIR)run $(SRC) $(LIB)
