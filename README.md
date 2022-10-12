# Topaz For Total Test Scenario Execute
The TTT-Scenario-Execute action allows your GitHub Actions workflow to trigger a workflow in your instance of BMC Compuware where you want to execute scenario based on you program. This action can be used in scenarios where your test scenario source is stored in Git, or when you want your GitHub Actions workflow to operate on source that is already stored in your local workspaces. <br>
#Topaz for Total Test for demo !! <br>

#Controls when the workflow will  <br>
run on: <br>
  #Triggers the workflow on push or pull request events but only for the "main" branch <br>
  push: <br>
    &nbsp;&nbsp; branches: [ "master" ] <br>
  pull_request: <br>
    &nbsp;&nbsp; branches: [ "master" ] <br>

  #Allows you to run this workflow manually from the Actions tab <br>
  workflow_dispatch: <br>

#A workflow run is made up of one or more jobs that can run sequentially or in parallel <br>
jobs: <br>
  	#This workflow contains a single job called "build" <br>
  	build: <br> 
    	#The type of runner that the job will run on <br>
    	runs-on: self-hosted <br>
   		#runs-on: [self-hosted, ubuntu-latest] <br>	 
   		#runs-on: windows-latest <br>
    
    #Steps represent a sequence of tasks that will be executed as part of the job <br>
    steps: <br>
      - run: git config --global core.longpaths true <br>
      
      #Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it <br>
      - uses: actions/checkout@v2 <br>
        with: <br>
          clean: false <br>
          path: ${{ github.workspace }} <br>
          name: ${{ env.VERSION_MAJOR }}.${{ env.VERSION_MINOR }} <br>

      #Runs a single command using the runners shell <br>
      - name: Calling the CLI function <br>
        run: .\ExecuteCommand.bat <br>
        
      #Runs a set of commands using the runners shell <br>
      - name: Run a multi-line script <br>
        run: | <br>
          echo Add other actions to build, <br>
          echo test, and deploy your project. <br>
          
          
