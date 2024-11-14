#!/bin/bash

# Initialise data & firmware folders
mkdir -p /data/crRFD

# Run HMIPServer
java -Xmx64m -Dlog4j.configuration=file:///etc/config/log4j.xml -jar /opt/HMServer/HMIPServer.jar /etc/config/crRFD.conf &
CCU_PID=$!

# Keep container running while CCU services are alive
wait ${CCU_PID}
