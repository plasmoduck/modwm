#!/bin/sh
# Place this script somewhere in $PATH and make a binding to update statusbar

pidfile=/tmp/statbar-$(id -u)-$DISPLAY
pid=$(cat "$pidfile")
kill -SIGTRAP "$pid"

