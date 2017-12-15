Nanopublications for WikiPathways
=================================

This repository contains the data and code for the incremental releases of the
nanopublications dataset for WikiPathways.

To create a new release, the compressed file with the raw data (with a name like
`wp_nanopubs_20171210.tar.gz` and containing files like `20171210/complexes.wp1.trig`)
should be placed in the directory `input/raw`. Then run the following command to
uncompress the data for further processing (replace `20171210` with the version
number of the new release):

    $ scripts/uncompress-raw.sh 20171210

_(to be continued...)_
