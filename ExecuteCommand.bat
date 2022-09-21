echo "inside ExecuteCommand.Bat for demo"

set hciConnection="10.100.4.82:16196"
set passticket=-passticket
set testLocationPath="C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\CLI_CWKTCOBX\Tests\"
set configration="C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\TotalTestConfiguration"

call "%~dp0TotalTestFTCLI.bat" -e %hciConnection% ^ %passticket% ^ -f %testLocationPath% ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir %configration%

rem call "%~dp0TotalTestFTCLI.bat" -e "10.100.4.82:16196" ^ -passticket ^ -f "C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\CLI_CWKTCOBX\Tests\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\TotalTestConfiguration"
