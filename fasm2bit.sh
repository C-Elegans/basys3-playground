#!/bin/bash
set -x

if [ "$@" -ne 2 ]; then
	echo "Usage $0 file.fasm file.bit"
	exit 1
fi

FASM_FILE=$1
FRAMES_FILE=$(mktemp).frames
trap 'rm -f "$FRAMES_FILE"' EXIT
BIT_FILE=$2

XRAY_DIR="/home/mnolan/git/fpga/prjxray"
source "${XRAY_DIR}/utils/environment.sh"

${XRAY_UTILS_DIR}/fasm2frames.py --part xc7a35tcsg324-1 --db-root ${XRAY_UTILS_DIR}/../database/artix7 "$FASM_FILE" > "$FRAMES_FILE"
${XRAY_TOOLS_DIR}/xc7frames2bit --part_file ${XRAY_UTILS_DIR}/../database/artix7/xc7a35tcpg236-1/part.yaml --part_name xc7a35tcpg236-1  --frm_file "$FRAMES_FILE" --output_file "$BIT_FILE"

