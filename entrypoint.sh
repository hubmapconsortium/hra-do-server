#!/bin/bash

/usr/sbin/nginx -g "daemon off;" &

sleep 4 && echo "Go to http://localhost:8000/ to get to the digital object server" &

/blazegraph/entrypoint.sh
