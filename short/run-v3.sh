#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh
PTS_BIN=$SCRIPT_DIR/../pts-source/phoronix-test-suite

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

# get the download cache for the short test suite
if [ ! -f $SCRIPT_DIR/../short-dl-cache.tar.xz ]; then
    echo "Download cache not found. Downloading..."
    wget https://people.canonical.com/~mckeesh/short-dl-cache.tar.xz
fi

tar xvf $SCRIPT_DIR/../short-dl-cache.tar.xz
mv download-cache $HOME/.phoronix-test-suite

export TEST_RESULTS_IDENTIFIER=short-v3-id 
export TEST_RESULTS_NAME=short-v3-name 

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS

export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins. Builds are optimized for x86-64-v3'

PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark short

$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
