#!/bin/bash
#
# Usage:
# $ scripts/uncompress-raw.sh
#

rm -rf input/raw-uncompressed
mkdir input/raw-uncompressed

cp input/raw/*.tar.gz input/raw-uncompressed
cd input/raw-uncompressed

ls *.tar.gz \
  | awk '{print "tar -zxf "$0}' \
  | bash

rm *.tar.gz
