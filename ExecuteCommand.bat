echo "inside ExecuteCommand.Bat"

set hciConnection="10.100.4.82:16196"
set passticket=-passticket
set testLocationPath="C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\CLI_CWKTCOBX\Tests\"
set configration="C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\TotalTestConfiguration"

rem call .\TotalTestFTCLI.bat -e %hciConnection% ^ %-passticket% ^ -f %testLocationPath% ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir %configration%

call TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\CLI_CWKTCOBX\Tests\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "C:\actions-runner\_work\Topaz_Workbench_CLI_Test\Topaz_Workbench_CLI_Test\TotalTestConfiguration"

rem TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "CLI_CWKTCOBX\Tests\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "\TotalTestConfiguration"
