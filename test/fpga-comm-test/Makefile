PROJDIR := ../../
SRCDIR := $(PROJDIR)src/fpga-comm/

SRC := $(SRCDIR)gpio/cgpio.c $(SRCDIR)fpga-comm.cpp test.cpp
INC := $(SRCDIR)gpio/gpio.h $(SRCDIR)gpio/cgpio.h $(SRCDIR)fpga-comm.h $(SRCDIR)gpio-map.h

test: $(SRC) $(INC)
	g++ $(SRC) -o test -I $(SRCDIR) -I $(SRCDIR)gpio/
