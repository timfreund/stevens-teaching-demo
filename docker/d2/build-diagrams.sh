#!/usr/bin/env bash

INPUT_DIR=`pwd`/input
OUTPUT_DIR=`pwd`/output
DAEMON=0

function usage {
    echo "$0 -i input_dir -o output_dir -d [1|0]"
    echo "   defaults:"
    echo "     input_dir: ${INPUT_DIR}"
    echo "     output_dir: ${OUTPUT_DIR}"
    echo "     daemon: ${DAEMON}"
    exit 1
}

while getopts d:i:o: opt
do
    case "${opt}" in
        d) DAEMON=${OPTARG};;
        i) INPUT_DIR=${OPTARG};;
        o) OUTPUT_DIR=${OPTARG};;
        *) usage;;
    esac
done

if [ ! -d ${INPUT_DIR} ];
then
    echo "The input directory does not exist"
    usage
fi

mkdir -p ${OUTPUT_DIR}
if [ ! -d ${OUTPUT_DIR} ];
then
    echo "The output directory does not exist"
    usage
fi

for srcpath in `find ${INPUT_DIR} -name \*d2`;
do
    diagram=`basename ${srcpath} .d2`
    destpath="${OUTPUT_DIR}/${diagram}.svg"
    echo "Building ${diagram}"
    d2 -l elk $srcpath $destpath
done;

if [ ${DAEMON} -eq 1 ]
then
    echo "Watching for changes in ${INPUT_DIR}"
    inotifywait --monitor -e close_write,moved_to \
                --format '%w %f %e' --include .*.d2 ./input/ \
        | while read dir filename event; do
        srcpath="${dir}/${filename}"
        diagram=`basename ${srcpath} .d2`
        destpath="${OUTPUT_DIR}/${diagram}.svg"
        echo "Building ${diagram}"
        d2 -l elk $srcpath $destpath
    done;
fi
