Nanopublications for WikiPathways
=================================

This repository contains the data and code for the incremental releases of the
nanopublications dataset for WikiPathways.

This code requires [npop](https://github.com/tkuhn/npop) and `npop/bin` needs to
be in the PATH variable for the scripts to work.

To create a new release, the compressed file with the raw data (with a name like
`wp_nanopubs_20161210.tar.gz` and containing files like
`20161210/complexes.wp1.trig`) should be placed in the directory `input/raw`.
Then run the following command to preprocess the input data (replace `20161210`
with the version number of the new release):

    $ scripts/preprocess-input.sh 20161210

_(to be continued...)_
