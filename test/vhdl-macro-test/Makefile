PROJDIR = ../../
SRCDIR = $(PROJDIR)src/
 
SRC = test.cpp

HDR =  $(SRCDIR)causal-fir-filter-vhdl.h 

INC = -I $(SRCDIR)

TARGET = test

$(TARGET): $(SRC) $(HDR)
	g++ $(SRC) -o test $(INC)
