#!/bin/bash



log_msg() {
	echo "$(date "+%Y-%m-%d %H:%M") - $1"
}



log_msg "Hello message"
log_msg "Goodbye message"
