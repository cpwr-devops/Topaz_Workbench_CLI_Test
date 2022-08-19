echo "Inside ExecuteCommand"

TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "C:\Users\aasati\Compuware\Workbench\workspace\CLI_CWKTCOBX\Tests\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "C:\Users\aasati\Compuware\Workbench\workspace\TotalTestConfiguration"

#TotalTestFTCLI.bat -e "10.100.4.82:16196" ^ -passticket ^ -f "CLI_CWKTCOBX\Tests\" ^ -R -g TTTReport -G -v 6 -l CLI ^ -log DEBUG ^ -cfgdir "\TotalTestConfiguration"
