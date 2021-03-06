###############################################################################
#                               Backup Tools                                  #
#                                                                             #
# https://github.com/vistoyn/backup-tools                                     #
# Copyright (c) 2016 Ildar Bikmamatov <vistoyn@gmail.com>                     #
# Licensed under the MIT License                                              #
# (https://github.com/vistoyn/backup-tools/blob/master/LICENSE)               #
#                                                                             #
###############################################################################


CURRENT_SRC_FOLDER=""
CURRENT_DEST_FOLDER=""
CURRENT_SCHEME=""


sync_sheme_set () {
	CURRENT_SCHEME=""
    if [ -z "$1" ]; then
		return 0
    fi
	CURRENT_SCHEME=$1
	return 1
}

sync_folder () {
	echo "" > ${EXCLUDE_LIST}
	CURRENT_FOLDER=""
	if [ -z "$1" ]; then
		return 0
	fi
	
	if [ -z "$2" ]; then
		return 0
	fi
	
	CURRENT_SRC_FOLDER=$1
	CURRENT_DEST_FOLDER=$2
	
	return 1
}

sync_folder_exclude () {
	if [ -z "$CURRENT_SCHEME" ]; then
		return 0
	fi
	sync_folder_exclude_${CURRENT_SCHEME} $@
	ch=$?
	return $ch
}

sync_folder_start () {
	if [ -z "$CURRENT_SCHEME" ]; then
		return 0
	fi
	sync_folder_start_${CURRENT_SCHEME} $@
	ch=$?
	return $ch
}

push_folder_start () {
	if [ -z "$CURRENT_SCHEME" ]; then
		return 0
	fi
	push_folder_start_${CURRENT_SCHEME} $@
	ch=$?
	return $ch
}
