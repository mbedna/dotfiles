#!/bin/sh
path_to_source=$1
path_to_dest=$2
rsync -a --progress --stats --human-readable $path_to_source $path_to_dest
