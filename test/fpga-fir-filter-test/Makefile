PROJDIR = ../../
SRCDIR = $(PROJDIR)src/

SRC =  $(SRCDIR)fpga-causal-fir-filter.cpp 
SRC += $(SRCDIR)fpga-program.cpp 
SRC += $(SRCDIR)fpga-loader/fpga-loader.cpp
#SRC += $(SRCDIR)fpga-comm/fpga-comm.cpp
SRC += test.cpp

HDR =  $(SRCDIR)causal-fir-filter-vhdl.h
HDR += $(SRCDIR)fpga-causal-fir-filter.h
HDR += $(SRCDIR)fpga-program.h
HDR += $(SRCDIR)fpga-loader/fpga-loader.h
#HDR += $(SRCDIR)fpga-comm/fpga-comm.h

#LIB = -lwiringPi 

INC =  -I $(SRCDIR)
INC += -I $(SRCDIR)fpga-loader/
#INC += -I $(SRCDIR)fpga-comm/

TARGET = test

$(TARGET): $(SRC) $(HDR)
	g++ $(SRC) -o test $(INC)
