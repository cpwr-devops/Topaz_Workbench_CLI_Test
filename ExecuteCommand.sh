echo "Inside ExecuteCommand"

#echo TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "C:\\Users\\aasati\\git\\Topaz_Workbench_CLI_Test\\CLI_CWKTCOBX\\Tests\\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "./TotalTestConfiguration"

TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "CLI_CWKTCOBX\Tests\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "\TotalTestConfiguration"
