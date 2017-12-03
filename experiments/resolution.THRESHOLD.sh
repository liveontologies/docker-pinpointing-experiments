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

PROPS='-Delk.reasoner.tracing.evictor=NQEvictor(25600,0.75,3500000,0.75)'
SELECTION=THRESHOLD

java -Xmx7G -Xms2G $PROPS -jar $PINPOINTING_JAR -t "$TIMEOUT"000 -g "$GLOBAL_TIMEOUT"000 $OUTPUT_DIR/record.csv $QUERY_FILE org.liveontologies.pinpointing.experiments.SatResolutionJustificationExperiment -- $ENCODING_DIR $SELECTION 2>&1 > $OUTPUT_DIR/out.log | tee $OUTPUT_DIR/err.log 1>&2

