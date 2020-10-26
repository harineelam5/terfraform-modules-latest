pipeline {
    agent any
    parameters {
        string(name: 'Project', defaultValue: 'Demo Project', description: 'Project to Deploy')
        choice(name: 'Environment', choices: ['UAT', 'STAGE'], description: 'Select Workspace Environment')
        string(name: 'Branch', defaultValue: 'master', description: 'Enter Branch Name to Run')
    }
    stages {
        stage('CleanWorkspace'){
           steps {
              cleanWs()
              sh 'whoami'
           }
        }
        stage('Terraform Code Pull'){
           steps {
              git branch: '${Branch}', url: 'https://github.com/phani-rudra9/terfraform-modules-latest.git'
           }
        }
        stage('Terraform Initialize'){
           steps {
              sh 'terraform init -var-file="${Environment}.tfvars"'
           }
        }
        stage('Select Workspace'){ 
           steps {
              sh 'terraform workspace new ${Environment} || terraform workspace select ${Environment}'
            }   
                
        }    
        stage('Terraform Plan'){ 
           steps {
              sh 'terraform plan -var-file="./${Environment}.tfvars" -out=${Environment}tfplanout'
              script {
              timeout(time: 10, unit: 'MINUTES') {
                input(id: "Terraform Apply Gate", message: "Terraform Plan ${params.Environment}tfplanout?", ok: 'Apply')
              }
            }
		   }
        }
        stage('Terraform Apply') { 
            steps {
             sh 'terraform apply -auto-approve "${Environment}"tfplanout'
            }    
        }
    }    
}
