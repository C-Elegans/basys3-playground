#!/usr/bin/env bash
set -ex
yosys -p "synth_xilinx -flatten -abc9 -nobram -arch xc7 -top top; write_json top.json" top.v
../../../build/nextpnr-xilinx --chipdb ../../xc7a35tcpg236-1.bin --xdc basys3.xdc --json top.json --write top_routed.json --fasm top.fasm

source "${XRAY_DIR}/utils/environment.sh"

${XRAY_UTILS_DIR}/fasm2frames.py --part xc7a35tcsg324-1 --db-root ${XRAY_UTILS_DIR}/../database/artix7 top.fasm > top.frames
${XRAY_TOOLS_DIR}/xc7frames2bit --part_file ${XRAY_UTILS_DIR}/../database/artix7/xc7a35tcpg236-1/part.yaml --part_name xc7a35tcpg236-1  --frm_file top.frames --output_file top.bit
