PROJECT_NAME=lab2

.PHONY: all
all: $(PROJECT_NAME).bit

$(PROJECT_NAME).json: $(PROJECT_NAME).vhd popcnt.vhd decoder_7seg.vhd
	yosys -m ghdl -p "ghdl $^ -e $(PROJECT_NAME); synth_xilinx -flatten -abc9 -nobram -arch xc7 -top $(PROJECT_NAME); write_json $@" | tee yosys.log

$(PROJECT_NAME).fasm: $(PROJECT_NAME).json
	nextpnr-xilinx --chipdb ../xc7a35tcpg236-1.bin --xdc ../basys3.xdc --json $< --write $(PROJECT_NAME)_routed.json --fasm $@ 2>&1 | tee pnr.log

$(PROJECT_NAME).bit: $(PROJECT_NAME).fasm
	../fasm2bit.sh $< $@


.PHONY: prog
prog: $(PROJECT_NAME).bit
	openocd -f ../digilent-usb.cfg -f /usr/share/openocd/scripts/cpld/xilinx-xc7.cfg -f ../openocd.cfg -c 'pld load 0 $<; exit'


%.o: %.vhd
	ghdl -a --std=08 $<
lab2_tb: lab2_tb.o lab2.o popcnt.o decoder_7seg.o
lab2_tb.o: lab2.o
lab2.o: popcnt.o decoder_7seg.o


%_tb: %_tb.o %.o
	ghdl -e --std=08 $*_tb
%_tb.vcd: %_tb
	./$*_tb --vcd=$@  --stop-time=5us
