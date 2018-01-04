#!/bin/bash

TIMEOUT=$1
shift
GLOBAL_TIMEOUT=$1
shift
QUERY_FILE=$1
shift
ENCODING_DIR=$1
shift
SCRIPTS_DIR=$1
shift
OUTPUT_DIR=$1
shift

$SCRIPTS_DIR/run_EL2MUS_experiments.sh $EL2MCS_DIR/el2mcs/el2mcs $TIMEOUT $GLOBAL_TIMEOUT $QUERY_FILE $ENCODING_DIR $EL2MCS_DIR/scripts/ $EL2MCS_DIR/tools/ $OUTPUT_DIR

