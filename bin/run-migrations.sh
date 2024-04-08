#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LAB_ROOT=${SCRIPT_DIR}/../

function run_sql_file {
    echo "Executing $1"
    psql -h 127.0.0.1 -p 5432 -U ${POSTGRES_USER} ${POSTGRES_DB} < $1
}

for migration in ${LAB_ROOT}/migrations/*sql;
do
    run_sql_file ${migration}
done
