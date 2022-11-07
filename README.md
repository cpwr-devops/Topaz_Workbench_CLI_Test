# TTT-CLI-Local

The TTT-Scenario-Execute action allows your GitHub Actions workflow to trigger a workflow in your instance of BMC Compuware where you want to execute scenario based on you program. This action can be used in scenarios where your test scenario source is stored in Git, or when you want your GitHub Actions workflow to operate on source that is already stored in your local workspaces. <br>
          
# Table of Contents

  * TTT-CLI-Local
    * Table of Contents
    * Usage
    * Inputs
    * Outputs
    * Troubleshooting
    * License summary
    * Limitation

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

| --- | --- | ---  |

| Host | Required  | Host |

| port  | Required  | port |


# Output

# Troubleshooting

# License summary

# Limitation


   
