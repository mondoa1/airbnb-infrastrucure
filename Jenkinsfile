def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    ]






pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo 'cloning project codebase'
                git branch: 'main', url: 'https://github.com/mondoa1/airbnb-infrastrucure.git'
                sh 'ls'
            }
        }
        
         stage('Verify Terfaform version') {
            steps {
                echo 'Verifying the terraform version...'
                sh 'terraform --version'
            
            }
        }
    
    stage('Terraform init') {
            steps {
                echo 'initializing terraform project...'
                sh 'terraform init'
                
            }
        }
    
    
    stage('Terraform validate') {
            steps {
                echo 'code syntax checking...'
                sh 'terraform validate'
                
            }
        }
        
        
    stage('terraform plan') {
            steps {
                echo 'Terraform plan for the dry run...'
                sh 'terraform plan'
                
            }
        }
        
        
        stage('checkov scan') {
            steps {
                sh """
                sudo pip3 install checkov
                
                checkov -d . --skip-check CKV_AWS_79
                """
                
            }
        }
        
        
        stage('manual approval') {
            steps {
                
                input 'Approval required for deployment'
                
            }
        }
        
        
        stage('terraform apply') {
            steps {
                echo 'Terraform apply..'
                sh 'sudo terraform apply --auto-approve'
                
            }
        }
        
        
    }
    
    post {
        always {
            echo 'i will always say hello again'
            slackSend channel: '#jenkins-projects', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}
