#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

SCRIPT_DIR=$(dirname "$0")
$SCRIPT_DIR/../set_test_env.sh

export TEST_RESULTS_IDENTIFIER=kobuk-short-id
export TEST_RESULTS_NAME=kobuk-short-name 

PTS_SILENT_MODE=1 phoronix-test-suite benchmark kobuk-bench-short

phoronix-test-suite result-file-to-csv kobuk-bench-short
