#!/bin/bash
set -e
OUTPUT_DIR="./temp"
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR
NUM_FILES=$((RANDOM % 6 + 5))
for i in $(seq 1 $NUM_FILES); do
    FILE_NAME="$OUTPUT_DIR/file_$i.txt"
    head -c 100 </dev/urandom > "$FILE_NAME"
    echo "Created $FILE_NAME"
done
