PROJDIR := ../../
SRCDIR := $(PROJDIR)src/fpga-comm

————TODO————

SRC := $(SRCDIR)cgpio.c test.cpp
INC := $(SRCDIR)gpio.h $(SRCDIR)cgpio.h

test: $(SRC) $(INC)
	g++ $(SRC) -o test -I $(SRCDIR)
