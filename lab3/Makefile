PROJECT_NAME=lab3

.PHONY: all
all: $(PROJECT_NAME).bit

$(PROJECT_NAME).json: $(PROJECT_NAME).vhd popcnt.vhd decoder_7seg.vhd baud_generator.vhd bin_to_bcd.vhd segment_controller.vhd
	yosys -m ghdl -p "ghdl $^ -e $(PROJECT_NAME); synth_xilinx -flatten -abc9 -nobram -arch xc7 -top $(PROJECT_NAME); write_json $@" | tee yosys.log

$(PROJECT_NAME).fasm: $(PROJECT_NAME).json
	nextpnr-xilinx --chipdb ../xc7a35tcpg236-1.bin --xdc ../basys3.xdc --json $< --write $(PROJECT_NAME)_routed.json --fasm $@ 2>&1 | tee pnr.log

$(PROJECT_NAME).bit: $(PROJECT_NAME).fasm
	../fasm2bit.sh $< $@


.PHONY: prog
prog: $(PROJECT_NAME).bit
	openocd -f ../digilent-usb.cfg -f /usr/share/openocd/scripts/cpld/xilinx-xc7.cfg -f ../openocd.cfg -c 'pld load 0 $<; exit'


%_tb.o: %.o
%.o: %.vhd
	ghdl -a --std=08 $<
lab3_tb: lab3_tb.o lab3.o popcnt.o decoder_7seg.o baud_generator.o segment_controller.o
lab3_tb.o: lab3.o
lab3.o: popcnt.o decoder_7seg.o baud_generator.o segment_controller.o


%_tb: %_tb.o %.o
	ghdl -e --std=08 $*_tb
%_tb.vcd: %_tb
	./$*_tb --vcd=$@  --stop-time=5us
