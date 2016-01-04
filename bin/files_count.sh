#!/bin/sh

TC_DIR='/mnt/timecapsule'
BACKUP_DIR='/media/mbedna/Untitled'

for DIR in `ls -d $TC_DIR/*/`
do
    BASE_DIR=`basename $DIR`
    TC_FILES_COUNT=`find $DIR -type f | wc -l`
    BACKUP_FILES_COUNT=`find $BACKUP_DIR/$BASE_DIR -type f | wc -l`
    echo $BASE_DIR ' Timecapluse count: ' $TC_FILES_COUNT ', Backup count: ' $BACKUP_FILES_COUNT
done
