echo "inside ExecuteCommand.Bat for demo 11"

rem set hciConnection=${{github.event.inputs.hciconnection}}
set hciConnection=${{github.event.inputs.hciconnection}}
set passticket=-passticket
set testLocationPath="C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\CLI_CWKTCOBX\Tests\Scenarios"
set configration="C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\TotalTestConfiguration"

rem call "%~dp0TotalTestFTCLI.bat" -e %hciConnection% ^ %passticket% ^ -f %testLocationPath% ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir %configration%

rem call "%~dp0TotalTestFTCLI.bat" -data "C:\Users\aasati\git\compuware-topaz-for-total-test-plugin\work\workspace\Security_Vulnerability\TopazCliWkspc" -host cw13.bmc.com -port 16196 -u pinaka0 -p Fresp0rt -s "http://vw-dtw-xat-01.adprod.bmc.com:48231/totaltestapi/" -cesu pinaka0 -cesp Fresp0rt -f "C:\Users\aasati\Compuware\Workbench\workspace\CLI_CWKTCOBX\Tests\Scenarios" -R -G -v 6 -l jenkins -loglevel INFO

TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "%~dp1CLI_CWKTCOBX\Tests\Scenarios" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "%~dp1TotalTestConfiguration"
