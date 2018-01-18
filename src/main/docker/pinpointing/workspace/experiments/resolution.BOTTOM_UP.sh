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

SELECTION=BOTTOM_UP

java -Xmx7G -Xms2G -cp "$CLASSPATH" org.liveontologies.pinpointing.RunJustificationExperiments -t "$TIMEOUT"000 -g "$GLOBAL_TIMEOUT"000 $OUTPUT_DIR/record.csv $QUERY_FILE org.liveontologies.pinpointing.experiments.SatResolutionJustificationExperiment -- $ENCODING_DIR $SELECTION 2>&1 > $OUTPUT_DIR/out.log | tee $OUTPUT_DIR/err.log 1>&2

