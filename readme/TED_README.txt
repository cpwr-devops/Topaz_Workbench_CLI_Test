The following shows simple examples of Topaz Enterprise Data CLI commands.  For
complete command arguments type the following at a command prompt.

TedCLI -cmd=<command> -help

where <command> is:
    execute - Executes the specification from the repository specified.

---------------------------------------------------------------
Executing an EX specification from the repository
---------------------------------------------------------------

TedCLI.bat ^
-cmd=execute ^
-repository=TestRepo ^
-specification=TestExExtractSpec ^  
-specificationtype=EXTRACT ^
-comm-mgr=remote-comm-manager-machine ^
-comm-mgr-port=4901 ^
-execution-server=server-machine ^
-execution-server-port=4900 ^
-ces-uri=http://test-ces-host:2020/compuware ^
-use-cloud=false

Executes the TestSpec EX Extract from TestRepo repository configured on the given remote communication manager
on the provided execution server while checking for license on the provided ces.

---------------------------------------------------------------
Executing an RDX specification from the repository
---------------------------------------------------------------

TedCLI.bat ^
-cmd=execute ^
-repository=TestRepo ^
-specification=TestRDXExtractSpec ^  
-specificationtype=EXTRACT ^
-comm-mgr=remote-comm-manager-machine ^ 
-comm-mgr-port=4901 ^
-execution-host=mfhost ^
-execution-host-port=16196 ^
-hci-userid=hciuid ^
-hci-password=hcipwd ^
-execution-context=TestExecutionContext.properties ^
-dataset-hlq=FAEX

Executes the TestRDXExtractSpec RDX Extract from TestRepo repository configured on the specified remote comm manager.
The job is submitted to the mfhost:16196 defined via the execution host and port params. Some of the values are 
specified in the execution context file "TestExecutionContext.properties" defined, while some of the arguments like 
dataset-hlq defined in the context has been overridden with the value passed as the argument. 

For the HCI connection, user can either provide userid and password as an argument for password based authentication, 
or provide base64 encoded certificate content for certificate based authentication or keystore absolute path, keystore 
password and certificate alias for keystore based authentication. The last two options can also be supplied via the 
context file. If all are specified, the user/id password takes the most precedence, then followed by the certicate and 
finally the keystore based authentication.   

---------------------------------------------------------------
Executing an ComparePro specification from the repository
---------------------------------------------------------------

TedCLI.bat ^
-cmd execute ^
-repository TestRepo ^
-specification TestCompareProSpec ^
-specificationtype Compare ^
-results-repository ResultsRepo ^
-execution-context TestExecutionContext.properties

Executes the TestSpec Compare from TestRepo repository, and saves the Compare results in the results repository ResultsRepo, 
instead of using the TestRepo. Also this execution utilizes the values specified in the execution context. The ces-uri, 
use-cloud, execution-server, execution-server-port, comm-mgr, comm-mgr-port and execution-timeout are specified in context.

-------------------------------------------------------------------------------------------
Executing multiple specifications in a single command from the repository
-------------------------------------------------------------------------------------------

TedCLI.bat ^
-cmd execute ^
-repository TestRepo ^
-comm-mgr remote-comm-manager-machine ^ 
-comm-mgr-port 4901 ^
-execution-server server-machine ^ 
-execution-server-port=4900 ^
-ces-uri=http://test-ces-host:2020/compuware ^
-use-cloud=true ^
-ces-cust-no=1111 ^  
-ces-site-id=2222 ^
-specification-list="ExExtractSpec extract convspec convert loadspec load" ^  
-exit-on-failure=false ^
-execution-timeout=30

Executes three specifications an extract, converterPro and a loader specification in sequence from the repo TestRepo. 
Since the optional exit-on-failure flag is set to false, if the execution of a specification fails it will continue executing 
the rest of the specifications listed, if set to true, it will exit on first failure. The execution time out has been set to 
30 seconds in this example instead of the default 20 seconds. 


================
Arguments
================

       -r=<repository name> | -repository=<repository name>
                The repository name where the specification is present.
                [required]

        -rr=<results repository> | -results-repository=<results repository>
                The results repository where comparepro execution results will be stored. Applicable
                only to comparePro specification. Defaults to main repository if not specified.
                [optional]

        -s=<specification name> | -specification=<specification name>
                The name of the specification that is to be executed.
                [required if specification-list not provided]

        -st=<specification type> | -specification-type=<specification type>
                The type of the specification that is to be executed.
                Possible values: compare, convert, extract, load, exsuite.
                [required if specification-list not provided]

        -sl=<specification list> | -specification-list=<specification list>
                Specification Name and Type list each separated by space within quotes, if multiple
                specifications have to be executed in series. If this argument is specified, the
                specification and specification-type arguments will not be used.
                [optional]

        -ec=<execution context> | -execution-context=<execution context>
                The name or absolute path to the execution context file. The execution context file
                can supply some of the arguments that can also be passed with the execute command. If
                a value of a certain parameter is present in the context file and is also passed as an
                argument, the value passed with the command will take precedence. To know which all
                parameters can be specified via the context file, view the template provided at
                <InstallPath>/WorkbenchCLI/EnterpriseData namely executioncontext_template.properties.
                Multiple execution contexts can be created as required by copying the template.
                [optional]

        -cm=<communication manager> | -comm-manager=<communication manager>
                The standalone communication manager to be used, where the repository is configured.
                [required|context-able]

        -cmp=<communication manager port> | -comm-manager-port=<communication manager port>
                The standalone communication manager's port.
                [required|context-able]

        -ces=<ces uri> | -ces-uri=<ces uri>
                The CES URI to be used for license validation.
                [required|context-able]

        -ucd=<use cloud> | -use-cloud=<use cloud>
                Flag to denote which type of CES is to be used, a local CES or the Compuware cloud CES.
                [required|context-able]

        -cno=<ces cloud customer number> | -ces-cust-no=<ces cloud customer number>
                The customer number in case cloud CES is being used.
                [required if cloud CES|context-able]

        -sid=<ces cloud site id> | -ces-site-id=<ces cloud site id>
                The site ID in case cloud CES is being used.
                [required if cloud CES|context-able]

        -eof=<exit on Failure> | -exit-on-failure=<exit on Failure>
                Directive to initiate exit on encountering specification execution failure in case of
                executing multiple specifications. This optional field is defaulted to true. If set
                to false will continue executing other specifications in the provided list.
                [optional]

        -t=<execution timeout> | -execution-timeout=<execution timeout>
                The execution timeout in seconds, if needs to be set to a value other than 20 seconds.
                [optional|context-able]

        -es=<execution server> | -execution-server=<execution server>
                The execution server where the EX specifications should be executed.
                [required for executing EX specifications|context-able]

        -esp=<execution server port> | -execution-server-port=<execution server port>
                The execution server's port to be used for communication.
                [required for executing EX specifications|context-able]

        -eh=<execution host> | -execution-host=<execution host>
                The execution host where RDX specifications should be executed.
                [required for executing RDX specifications|context-able]

        -ehp=<execution host port> | -execution-host-port=<execution host port>
                The execution host's port to be used for communication.
                [required for executing RDX specifications|context-able]

        -ccs=<ccsid> | -ccsid=<ccsid>
                The CCSID to be used in the execution host connection, the default is 1047.
                [optional|context-able]

        -hid=<hci connection user id> | -hci-userid=<hci connection user id>
                The user ID required to establish HCI connection under password based authentication.
                (For RDX execution only)
                [required for password based authentication]

        -hpw=<hci connection password> | -hci-password=<hci connection password>
                The password required to establish HCI connection under password based authentication.
                (For RDX execution only)
                [required for password based authentication]

        -certificate=<hci connection certificate> | -certificate=<hci connection certificate>
                Base64 encoded string content of the certificate required to establish HCI connection
                under certificate based authentication. (For RDX execution only)
                [required for certificate based authentication|context-able]

        -keystore=<hci connection keystore> | -keystore=<hci connection keystore>
                Absolute path to keystore file required for establishing HCI connection under keystore
                based authentication. (For RDX execution only)
                [required for certificate based authentication|context-able]

        -certificateAlias=<hci connection certificate alias> | -certificateAlias =<hci connection certificate alias>
                Alias of the certificate to be used in supplied keystore for keystore
                based authentication. (For RDX execution only)
                [required for keystore based authentication|context-able]

        -keystorePassword=<hci connection keystore password> | -keystorePassword=<hci connection keystore password>
                The password for the provided keystore if applicable, for establishing HCI
                connection under keystore based authentication. (For RDX execution only)
                [optional for keystore based authentication|context-able]

        -j1=<jcl jobcard line 1> | -jcl-jobcard1=<jcl jobcard line 1>
                The JCL Jobcard's line 1. (For RDX execution only)
                [optional|context-able]

        -j2=<jcl jobcard line 2> | -jcl-jobcard2=<jcl jobcard line 2>
                The JCL Jobcard's line 2. (For RDX execution only)
                [optional|context-able]

        -j3=<jcl jobcard line 3> | -jcl-jobcard3=<jcl jobcard line 3>
                The JCL Jobcard's line 3. (For RDX execution only)
                [optional|context-able]

        -j4=<jcl jobcard line 4> | -jcl-jobcard4=<jcl jobcard line 4>
                The JCL Jobcard's line 4. (For RDX execution only)
                [optional|context-able]

        -j5=<jcl jobcard line 5> | -jcl-jobcard5=<jcl jobcard line 5>
                The JCL Jobcard's line 5. (For RDX execution only)
                [optional|context-able]

        -hlq=<dataset high level qualifier> | -dataset-hlq=<dataset high level qualifier>
                The dataset high level qualifier to be used. (For RDX execution only)
                [optional|context-able]

        -px=<temporary dataset prefix> | -temp-dataset-prefix=<temporary dataset prefix>
                The prefix to be used for temporary datasets. (For RDX execution only)
                [optional|context-able]

        -sx=<temporary dataset suffix> | -temp-dataset-suffix=<temporary dataset suffix>
                The suffix to be used for temporary datasets. (For RDX execution only)
                [optional|context-able]

        -fdb=<dp override fadebug> | -fadebug=<dp override fadebug>
                The dataprivacy override FADEBUG, that defines the logging information for the
                File-AID Rules Engine. (For RDX Extract execution only)
                [optional|context-able]

        -fxp=<dp override faexpath> | -faexpath=<dp override faexpath>
                The dataprivacy override FAEXPATH, that defines the path for File-AID Rules
                Engine location. (For RDX Extract execution only)
                [optional|context-able]

        -fip=<dp override faipaddr> | -faipaddr=<dp override faipaddr>
                The dataprivacy override FAIPADDR, that provides the File-AID Services IP address
                and execution port. (For RDX Extract execution only)
                [optional|context-able]

        -fjo=<dp override fajopts> | -fajopts=<dp override fajopts>
                The dataprivacy override FAJOPTS, that defines the Java options for the File-AID
                Rules Engine. (For RDX Extract execution only)
                [optional|context-able]

        -fjp=<dp override fajpath> | -fajpath=<dp override fajpath>
                The dataprivacy override FAJAPTH, that defines the z/OS UNIX path for the Java
                Virtual Machine. (RDX Extract execution only)
                [optional|context-able]