#!/bin/bash

#/**
# * These materials contain confidential information and trade secrets of Compuware Corporation. You shall maintain the materials
# * as confidential and shall not disclose its contents to any third party except as may be required by law or regulation. Use,
# * disclosure, or reproduction is prohibited without the prior express written permission of Compuware Corporation.
# * 
# * All Compuware products listed within the materials are trademarks of Compuware Corporation. All other company or product
# * names are trademarks of their respective owners.
# * 
# * Copyright (c) 2017 Compuware Corporation. All rights reserved.
# */

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The JAVA_HOME placeholder on the next line gets replaced during install with the Java directory used to execute the installation program
INSTALLATION_JAVA_HOME=##JAVA_HOME##

# CLI_LOC will not have a '/' at the end, so add one when concatenating path suffixes to it
CLI_LOC=$(dirname "$0")
LOGBACK_SUFFIX="$1"
LOGBACK_LOC="${CLI_LOC}/${LOGBACK_SUFFIX}"
APPLICATION="$2"
ALL_ARGS=
WS_LOC=
DEBUG=
DEFAULT_WORKSPACE=TopazBatchWkspc

# Get the remaining arguments to pass to the CLI
# Capture the -data value (workspace location) and whether the -debug option is present
shift
shift
for var in "$@"
do
  if [ "${var}" == "-debug" ]; then
    DEBUG="ON"
  elif [ "${var}" == "-data" ]; then
    next_is_ws="true"
  else
    if [ "${next_is_ws}" == "true" ]; then
      WS_LOC=${var}
      next_is_ws="false"
    elif [ -z "$ALL_ARGS" ]; then
      ALL_ARGS="${var}"
    else
      ALL_ARGS="${ALL_ARGS} ${var}"
    fi
  fi
done

# Make the ALL_ARGS variable available to the CLI
export ALL_ARGS

# Obtain the Java path
# In debug mode, we need a JDK (not a JRE)
if [ -n "$DEBUG" ]; then
  if [ -z "$JAVA_HOME" -o ! -f "$JAVA_HOME"/bin/java -o ! -f "$JAVA_HOME"/bin/jdb -o ! -f "$JAVA_HOME"/bin/javac ]; then
    echo "The JAVA_HOME environment variable is not set to a valid JDK directory."
    echo "JAVA_HOME must point to a JDK (not a JRE) in order to run this program in debug mode."
    echo "JAVA_HOME: ${JAVA_HOME}"
    exit 1
  else
    echo "Using JAVA_HOME: ${JAVA_HOME}"
    _RUNJAVA="$JAVA_HOME"/bin/java
  fi
# Otherwise, either JDK or JRE are fine
elif [ -n "$JAVA_HOME" ]; then
  if [ -f "$JAVA_HOME"/bin/java ]; then
    echo "Using JAVA_HOME: ${JAVA_HOME}"
    _RUNJAVA="$JAVA_HOME"/bin/java
  else
    echo "The JAVA_HOME environment variable is not set to a valid JDK or JRE directory."
    echo "JAVA_HOME: ${JAVA_HOME}"
    exit 1
  fi
elif [ -n "$JRE_HOME" ]; then
  if [ -f "$JRE_HOME"/bin/java ]; then
    echo "Using JRE_HOME: ${JRE_HOME}"
    _RUNJAVA="$JRE_HOME"/bin/java
  else
    echo "The JRE_HOME environment variable is not set to a valid JRE directory."
    echo "JRE_HOME: ${JRE_HOME}"
    exit 1
  fi
# No JAVA_HOME or JRE_HOME found, so try the java set by the installation
else
  echo "Neither the JAVA_HOME nor the JRE_HOME environment variables are defined."
  echo "At least one of these environment variables should be set to run this program."
  echo "Attempting to use the Java found by the installation program."
  echo "**NOTE** Use of the Java found by the installation program is deprecated."
  if [ -n "$INSTALLATION_JAVA_HOME" -a -f "$INSTALLATION_JAVA_HOME"/bin/java ]; then
    echo "Using INSTALLATION_JAVA_HOME: ${INSTALLATION_JAVA_HOME}"
    _RUNJAVA="$INSTALLATION_JAVA_HOME"/bin/java
  else
    echo "The Java set by the installation program is not set to a valid JDK or JRE directory."
    echo "Please set the JAVA_HOME or JRE_HOME environment variables and try again."
    echo "INSTALLATION_JAVA_HOME: ${INSTALLATION_JAVA_HOME}"
    exit 1
  fi
fi

# Execute the CLI
if [ -z "$WS_LOC" ]; then
  echo "No WORKSPACE provided, using default WORKSPACE: ${CLI_LOC}/${DEFAULT_WORKSPACE}"
  rm -f -r "${CLI_LOC}/${DEFAULT_WORKSPACE}"
  mkdir -p "${CLI_LOC}/${DEFAULT_WORKSPACE}/configuration"
  cp ${LOGBACK_LOC} "${CLI_LOC}/${DEFAULT_WORKSPACE}/configuration/logback.xml"
  ${_RUNJAVA} -jar "${CLI_LOC}/plugins/org.eclipse.equinox.launcher_1.5.0.v20180512-1130.jar" \
  -configuration "${CLI_LOC}/configuration" \
  -data "${CLI_LOC}/${DEFAULT_WORKSPACE}" \
  -application ${APPLICATION}
else
  echo "Using customized WORKSPACE: ${WS_LOC}"
 # rm -f -r "${WS_LOC}"
 # mkdir -p "${WS_LOC}/configuration"
  cp ${LOGBACK_LOC} "${WS_LOC}/configuration/logback.xml"
  ${_RUNJAVA} -jar "${CLI_LOC}/plugins/org.eclipse.equinox.launcher_1.5.0.v20180512-1130.jar" \
  -configuration "${CLI_LOC}/configuration" \
  -data "${WS_LOC}" \
  -application ${APPLICATION}
fi
