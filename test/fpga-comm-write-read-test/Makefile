PROJDIR = ../../
SRCDIR = $(PROJDIR)src/

SRC =  $(SRCDIR)fpga-comm/fpga-comm.cpp 
SRC += test.cpp

HDR =  $(SRCDIR)fpga-comm/fpga-comm.h 
HDR += $(SRCDIR)fpga-comm/gpio-map.h

LIB = -lwiringPi 

INC = -I $(SRCDIR)fpga-comm/

TARGET = test

$(TARGET): $(SRC) $(HDR)
	g++ $(SRC) -o test $(LIB) $(INC)
