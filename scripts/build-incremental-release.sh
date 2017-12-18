#!/bin/bash
#
# Usage:
#
# $ scripts/build-incremental-release.sh 20161110 20161210
#


echo "building diffs..."

scripts/build-diff.sh complexes $1 $2
scripts/build-diff.sh interactions $1 $2
scripts/build-diff.sh pathwayParticipation $1 $2


echo "building top index..."

scripts/build-top-index.sh $1 $2


echo "combining output..."

scripts/combine-output.sh $2
