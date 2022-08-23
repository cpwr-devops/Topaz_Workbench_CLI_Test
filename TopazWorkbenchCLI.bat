@echo off

rem /**
rem  * These materials contain confidential information and trade secrets of Compuware Corporation. You shall maintain the materials
rem  * as confidential and shall not disclose its contents to any third party except as may be required by law or regulation. Use,
rem  * disclosure, or reproduction is prohibited without the prior express written permission of Compuware Corporation.
rem  * 
rem  * All Compuware products listed within the materials are trademarks of Compuware Corporation. All other company or product
rem  * names are trademarks of their respective owners.
rem  * 
rem  * Copyright (c) 2017 Compuware Corporation. All rights reserved.
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

rem The JAVA_HOME placeholder on the next line gets replaced during install with the Java directory used to execute the installation program
set INSTALLATION_JAVA_HOME=C:\Program Files\AdoptOpenJDK\jdk-11.0.9.101-hotspot

rem CLI_LOC will have a '\' at the end, so don't add one when concatenating path suffixes to it
set CLI_LOC=%~dp0
set LOGBACK_SUFFIX=%1
set LOGBACK_LOC="%CLI_LOC%%LOGBACK_SUFFIX%"
set APPLICATION=%2
set ALL_ARGS=
set WS_LOC=
set DEBUG=
set DEFAULT_WORKSPACE=TopazBatchWkspc

rem Get the remaining arguments to pass to the CLI
rem Capture the -data value (workspace location) and whether the -debug option is present
shift
shift
:loop
if [%1]==[] goto afterloop
if [%1]==[-data] goto setWorkspace
if [%1]==[-debug] goto setDebug
if not defined ALL_ARGS (set ALL_ARGS=%1) else (set ALL_ARGS=%ALL_ARGS% %1)
shift
goto loop

:setWorkspace
shift
set WS_LOC=%~1
shift
goto loop

:setDebug
set DEBUG=ON
shift
goto loop

rem Obtain the Java path
:afterloop
rem In debug mode, we need a JDK (not a JRE)
if defined DEBUG goto needJDK
rem Otherwise, either JDK or JRE are fine
if defined JAVA_HOME goto gotJavaHome
if defined JRE_HOME goto gotJreHome
rem No JAVA_HOME or JRE_HOME found, so try the java set by the installation
goto tryInstallJava

:needJDK
if not defined JAVA_HOME goto invalidJDK
if not exist "%JAVA_HOME%\bin\jdb.exe" goto invalidJDK
if not exist "%JAVA_HOME%\bin\javac.exe" goto invalidJDK
if not exist "%JAVA_HOME%\bin\java.exe" goto invalidJDK
if not exist "%JAVA_HOME%\bin\javaw.exe" goto invalidJDK
echo Using JAVA_HOME: %JAVA_HOME%
set _RUNJAVA="%JAVA_HOME%\bin\java"
goto okJava

:invalidJDK
echo The JAVA_HOME environment variable is not set to a valid JDK directory.
echo JAVA_HOME must point to a JDK (not a JRE) in order to run this program in debug mode.
echo JAVA_HOME: %JAVA_HOME%
goto exitWithError

:gotJavaHome
if not exist "%JAVA_HOME%\bin\java.exe" goto invalidJavaHome
if not exist "%JAVA_HOME%\bin\javaw.exe" goto invalidJavaHome
echo Using JAVA_HOME: %JAVA_HOME%
set _RUNJAVA="%JAVA_HOME%\bin\java"
goto okJava

:invalidJavaHome
echo The JAVA_HOME environment variable is not set to a valid JDK or JRE directory.
echo JAVA_HOME: %JAVA_HOME%
goto exitWithError

:gotJreHome
if not exist "%JRE_HOME%\bin\java.exe" goto invalidJRE
if not exist "%JRE_HOME%\bin\javaw.exe" goto invalidJRE
echo Using JRE_HOME: %JRE_HOME%
set _RUNJAVA="%JRE_HOME%\bin\java"
goto okJava

:invalidJRE
echo The JRE_HOME environment variable is not set to a valid JRE directory.
echo JRE_HOME: %JRE_HOME%
goto exitWithError

:tryInstallJava
echo Neither the JAVA_HOME nor the JRE_HOME environment variables are defined.
echo At least one of these environment variables should be set to run this program.
echo Attempting to use the Java found by the installation program.
echo **NOTE** Use of the Java found by the installation program is deprecated.
if not defined INSTALLATION_JAVA_HOME goto invalidInstallJava
if not exist "%INSTALLATION_JAVA_HOME%\bin\java.exe" goto invalidInstallJava
if not exist "%INSTALLATION_JAVA_HOME%\bin\javaw.exe" goto invalidInstallJava
echo Using INSTALLATION_JAVA_HOME: %INSTALLATION_JAVA_HOME%
set _RUNJAVA="%INSTALLATION_JAVA_HOME%\bin\java"
goto okJava

:invalidInstallJava
echo The Java set by the installation program is not set to a valid JDK or JRE directory.
echo Please set the JAVA_HOME or JRE_HOME environment variables and try again.
echo INSTALLATION_JAVA_HOME: %INSTALLATION_JAVA_HOME%
goto exitWithError

rem Execute the CLI
:okJava
if not defined WS_LOC goto noWorkspace
echo Using customized WORKSPACE: %WS_LOC%
rmdir /s /q "%WS_LOC%"
mkdir "%WS_LOC%"
mkdir "%WS_LOC%\configuration"
copy %LOGBACK_LOC% "%WS_LOC%\configuration\logback.xml"
%_RUNJAVA% -jar "%CLI_LOC%plugins\org.eclipse.equinox.launcher_1.5.0.v20180512-1130.jar" ^
-configuration "%CLI_LOC%\configuration" ^
-data "%WS_LOC%" ^
-application %APPLICATION%
exit /b %errorlevel%

:noWorkspace
echo No WORKSPACE provided, using default WORKSPACE: %CLI_LOC%%DEFAULT_WORKSPACE%
rem rmdir /s /q "%CLI_LOC%%DEFAULT_WORKSPACE%
rem mkdir "%CLI_LOC%%DEFAULT_WORKSPACE%"
rem mkdir "%CLI_LOC%%DEFAULT_WORKSPACE%\configuration"
rem copy %LOGBACK_LOC% "%CLI_LOC%%DEFAULT_WORKSPACE%\configuration\logback.xml"
%_RUNJAVA% -jar "%CLI_LOC%plugins\org.eclipse.equinox.launcher_1.5.0.v20180512-1130.jar" ^
rem -configuration "%CLI_LOC%configuration" ^
rem -data "%CLI_LOC%%DEFAULT_WORKSPACE%" ^
-application %APPLICATION%
exit /b %errorlevel%

:exitWithError
exit /b 1
