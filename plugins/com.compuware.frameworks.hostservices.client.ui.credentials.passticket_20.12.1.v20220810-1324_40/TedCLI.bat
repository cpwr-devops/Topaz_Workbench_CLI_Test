@echo off

rem  /**
rem   * THESE MATERIALS CONTAIN CONFIDENTIAL INFORMATION AND TRADE SECRETS 
rem   * OF BMC SOFTWARE, INC. YOU SHALL MAINTAIN THE MATERIALS AS
rem   * CONFIDENTIAL AND SHALL NOT DISCLOSE ITS CONTENTS TO ANY THIRD
rem   * PARTY EXCEPT AS MAY BE REQUIRED BY LAW OR REGULATION. USE, 
rem   * DISCLOSURE, OR REPRODUCTION IS PROHIBITED WITHOUT THE PRIOR 
rem   * EXPRESS WRITTEN PERMISSION OF BMC SOFTWARE, INC. 
rem   * 
rem   * ALL BMC SOFTWARE PRODUCTS LISTED WITHIN THE MATERIALS ARE TRADEMARKS
rem   * OF BMC SOFTWARE, INC. ALL OTHER COMPANY PRODUCT NAMES ARE
rem   * TRADEMARKS OF THEIR RESPECTIVE OWNERS. 
rem   *
rem   * © Copyright 2021 BMC Software, Inc. 
rem   */
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

set LOGBACK_SUFFIX=workspace\configuration\ted_logback.xml
set APPLICATION=com.compuware.ted.cli.TedCLI

rem Call the master script
call "%~dp0\TopazWorkbenchCLI.bat" %LOGBACK_SUFFIX% %APPLICATION% %*
exit /b %errorlevel%