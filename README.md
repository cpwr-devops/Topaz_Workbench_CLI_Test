# TTT-CLI-Local

The TTT-Scenario-Execute action allows your GitHub Actions workflow to trigger a workflow in your instance of BMC Compuware where you want to execute scenario based on you program. This action can be used in scenarios where your test scenario source is stored in Git, or when you want your GitHub Actions workflow to operate on source that is already stored in your local workspaces. <br>
          
# Table of Contents

  * TTT-CLI-Local
    * [Table of Contents](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#Table%20of%20Contents)
    * [Usage](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#Usage)
    * [Inputs](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#Inputs)
    * [Outputs](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#Outputs)
    * [Troubleshooting](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#Troubleshooting)
    * [License summary](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#License%20summary)
    * [Limitation](https://github.com/akasati02/Topaz_Workbench_CLI_Test/#Limitation)

# Usage

          #Triggers the workflow on push or pull request events but only for the "xxxxx" branch that may be main, master or your feature branch

          push:<br>
                    branches: ["xxxxxx"]
          pull_request:
                    branches: ["xxxxx"]
          workflow_dispatch:
          #A workflow run is made up of one or more jobs that can run sequentially or in parallel
          jobs:
          #This workflow contains a single job called "build"
          build:
          #The type of runner that the job will run on
          runs-on: self-hosted    
          #Steps represent a sequence of tasks that will be executed as part of the job
          steps:
          - run: git config --global core.longpaths true
          #Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
          - uses: actions/checkout@v2
          with:
          clean: false
          path: ${{ github.workspace }}
          name: ${{ env.VERSION_MAJOR }}.${{ env.VERSION_MINOR }}

          #Runs a single command using the runners shell
          - name: Calling the CLI function
          run: .\ExecuteCommand.bat
 
# Inputs


| Input name | Required | Description |
| --- | --- | --- |
| hciconnection | Required  | HCI connection required to connect the system |
| passticket  | Required  | passticket reuired to run the CLI |
| testLocationPath | Required  | testLocationPath is your local path where you tes cases being executed |
| configration  | Required  | configration is required for local testing |


# Outputs

Output will saved in testlocationpath in your local system.

# Troubleshooting

To enable debug logging in your GitHub actions workflow, see the guide [here](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging).

# License summary

This code is made available under the MIT license.

# Limitation


   
