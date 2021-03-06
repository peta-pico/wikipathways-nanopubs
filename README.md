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

And then we can build the incremental release files (replace `20161110` with the
previous version number and `20161210` with the new version number):

    $ scripts/build-incremental-release.sh 20161110 20161210

The combined output files for the release can then be found in the following
files:

    output/combined/20161210_full.trig.gz      # all content nanopubs
    output/combined/20161210_index.trig.gz     # all index nanopubs
    output/combined/20161210-xx_new.trig.gz    # all new content nanopubs
    output/combined/20161210-xx_index.trig.gz  # all new index nanopubs

And more info can be found in the directories `output`, `stats`, and `reports`.
