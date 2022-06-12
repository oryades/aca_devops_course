#!/bin/bash

log_message()  {
       echo $(date '+%Y-%m-%d %H:%M') " - " $@
}       

log_message "Hello Message"

log_message "Goodby Message"
