#!/bin/bash
#
# Usage:
# $ scripts/make-all-stats.sh HEADER
# $ scripts/make-all-stats.sh 20161210
#

scripts/make-stats.sh complexes $1
scripts/make-stats.sh interactions $1
scripts/make-stats.sh pathwayParticipation $1
scripts/make-stats.sh combined $1

