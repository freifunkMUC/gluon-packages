#!/bin/sh

export FFULM_PREFIX="ffulm_"

migration_log() {
    topic=$1
    shift
    level=$1
    shift

    logger -t "$topic" -p "$level" "${@}"
    echo "$(date -u | sed 's/UTC //') user.${level} ${topic}: " "${@}" >> /root/ffulm-migration.log
}
