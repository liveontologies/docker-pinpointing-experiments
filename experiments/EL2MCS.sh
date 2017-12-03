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

for QUERY_DIR in $ENCODING_DIR/*
do
	LITERAL=`cat $QUERY_DIR/encoding.q`
	INPUT_FILE=$QUERY_DIR/encoding.$LITERAL.wcnf
	if [ ! -s $INPUT_FILE ]
	then
		$EL2MCS_DIR/scripts/create-wcnf encoding $QUERY_DIR $QUERY_DIR/encoding.q $QUERY_DIR $EL2MCS_DIR/tools/ no-opt
	fi
done

$SCRIPTS_DIR/run_EL2MUS_experiments.sh $EL2MCS_DIR/el2mcs/el2mcs $TIMEOUT $GLOBAL_TIMEOUT $QUERY_FILE $ENCODING_DIR $OUTPUT_DIR

