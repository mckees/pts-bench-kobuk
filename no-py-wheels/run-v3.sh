#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
$SCRIPT_DIR/../set_test_env.sh

export TEST_RESULTS_IDENTIFIER=no-py-wheels-id 
export TEST_RESULTS_NAME=no-py-wheels-name 

# PTS grabs these flags in pts_test_installer.php
export CFLAGS=$CFLAGS:'-march=x86-64-v3'
export CXXFLAGS=$CXXFLAGS:'-march=x86-64-v3'
export FFLAGS=$FFLAGS:'-march=x86-64-v3'

PTS_SILENT_MODE=1 phoronix-test-suite benchmark no-py-wheels

phoronix-test-suite result-file-to-csv no-py-wheels-name
