pipeline {
  agent any
  stages {
    stage('INITIALIZING TERRAFORM') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan --var-file=UAT.tfvars'
      }   
    }
    stage('Apply terraform') {
      steps {
        sh 'terraform apply -auto-approve --var-file=UAT.tfvars'
      }   
    }  
}
}
