#!/bin/bash

#/**
# * These materials contain confidential information and trade secrets of Compuware Corporation. You shall maintain the materials
# * as confidential and shall not disclose its contents to any third party except as may be required by law or regulation. Use,
# * disclosure, or reproduction is prohibited without the prior express written permission of Compuware Corporation.
# * 
# * All Compuware products listed within the materials are trademarks of Compuware Corporation. All other company or product
# * names are trademarks of their respective owners.
# * 
# * Copyright (c) 2020 Compuware Corporation. All rights reserved.
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

LOGBACK_SUFFIX=workspace/configuration/topaz_logback.xml
APPLICATION=com.compuware.zadviser.cli.ZAdviserCliApplication

# Call the master script
cd "$(dirname "$0")"
bash TopazWorkbenchCLI.sh ${LOGBACK_SUFFIX} ${APPLICATION} "$@"