PROJDIR = ../../
SRCDIR = $(PROJDIR)src/

SRC =  $(SRCDIR)fpga-loader/fpga-loader.cpp 
SRC += test.cpp

HDR =  $(SRCDIR)fpga-loader/fpga-loader.h 

INC = -I $(SRCDIR)fpga-loader/

TARGET = test

$(TARGET): $(SRC) $(HDR)
	g++ $(SRC) -o test $(LIB) $(INC)
