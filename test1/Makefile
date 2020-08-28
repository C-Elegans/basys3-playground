PROJECT_NAME=test1

.PHONY: all
all: $(PROJECT_NAME).bit

$(PROJECT_NAME).json: test1.v
	yosys -p "synth_xilinx -flatten -abc9 -nobram -arch xc7 -top $(PROJECT_NAME); write_json $@" $^

$(PROJECT_NAME).fasm: $(PROJECT_NAME).json
	nextpnr-xilinx --chipdb ../xc7a35tcpg236-1.bin --xdc ../basys3.xdc --json $< --write $(PROJECT_NAME)_routed.json --fasm $@

$(PROJECT_NAME).bit: $(PROJECT_NAME).fasm
	../fasm2bit.sh $< $@


.PHONY: prog
prog: $(PROJECT_NAME).bit
	openocd -f ../digilent-usb.cfg -f /usr/share/openocd/scripts/cpld/xilinx-xc7.cfg -f ../openocd.cfg -c 'pld load 0 $<; exit'

