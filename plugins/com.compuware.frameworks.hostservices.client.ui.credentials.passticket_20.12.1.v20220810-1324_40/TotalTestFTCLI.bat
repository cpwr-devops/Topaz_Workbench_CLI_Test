@echo off

rem /**
rem  * These materials contain confidential information and trade secrets of Compuware Corporation. You shall maintain the materials
rem  * as confidential and shall not disclose its contents to any third party except as may be required by law or regulation. Use,
rem  * disclosure, or reproduction is prohibited without the prior express written permission of Compuware Corporation.
rem  * 
rem  * All Compuware products listed within the materials are trademarks of Compuware Corporation. All other company or product
rem  * names are trademarks of their respective owners.
rem  * 
rem  * Copyright (c) 2017-2019 Compuware Corporation. All rights reserved.
rem  */
rem 
rem  Licensed to the Apache Software Foundation (ASF) under one or more
rem  contributor license agreements.  See the NOTICE file distributed with
rem  this work for additional information regarding copyright ownership.
rem  The ASF licenses this file to You under the Apache License, Version 2.0
rem  (the "License"); you may not use this file except in compliance with
rem  the License.  You may obtain a copy of the License at
rem 
rem      http://www.apache.org/licenses/LICENSE-2.0
rem 
rem  Unless required by applicable law or agreed to in writing, software
rem  distributed under the License is distributed on an "AS IS" BASIS,
rem  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem  See the License for the specific language governing permissions and
rem  limitations under the License.

Setlocal EnableDelayedExpansion

if defined TTT_DB_DRIVERS_PATH goto setWorkspace
set TTT_DB_DRIVERS_PATH="%~dp0dbDrivers"

:setWorkspace
set LOGBACK_SUFFIX=workspace\TTTlogback.xml
set APPLICATION=com.compuware.xatester.cli.FunctionalTestCLI

rem Call the master script
call "%~dp0\TopazWorkbenchCLI.bat" %LOGBACK_SUFFIX% %APPLICATION% %*
exit /b %errorlevel%