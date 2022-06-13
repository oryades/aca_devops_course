#!/bin/bash

log_message() {
	echo $(date +"%F %R - ") $1
}

log_message 'well hi there'
log_message 'alright, bye'
