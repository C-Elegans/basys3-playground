PROJECT_NAME=test2

.PHONY: all
all: $(PROJECT_NAME).bit

$(PROJECT_NAME).json: test2.vhd
	yosys -m ghdl -p "ghdl $^ -e $(PROJECT_NAME); synth_xilinx -flatten -abc9 -nobram -arch xc7 -top $(PROJECT_NAME); write_json $@" | tee yosys.log

$(PROJECT_NAME).fasm: $(PROJECT_NAME).json
	nextpnr-xilinx --chipdb ../xc7a35tcpg236-1.bin --xdc ../basys3.xdc --json $< --write $(PROJECT_NAME)_routed.json --fasm $@ 2>&1 | tee pnr.log

$(PROJECT_NAME).bit: $(PROJECT_NAME).fasm
	../fasm2bit.sh $< $@


.PHONY: prog
prog: $(PROJECT_NAME).bit
	openocd -f ../digilent-usb.cfg -f /usr/share/openocd/scripts/cpld/xilinx-xc7.cfg -f ../openocd.cfg -c 'pld load 0 $<; exit'


%.o: %.vhd
	ghdl -a $<
test2_tb: test2_tb.o test2.o
	ghdl -e test2_tb
test2_tb.vcd: test2_tb
	./test2_tb --vcd=$@  --stop-time=10us
