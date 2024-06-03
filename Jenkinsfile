pipeline{
    agent{
        label "unix"
    }
    stages{
        stage("GitHub Checkout"){
            steps{
                echo "========executing Github checkout========"
                git 'https://github.com/kpassoubady/unix_shell_scripts.git'
            }
        }
        stage("Print Pyramid") {
          steps {
              script {
                  status = sh label: 'Pyramid', returnStatus: true, script: '''
                  chmod +x astrisk-pyramid.sh
                  ./astrisk-pyramid.sh
                  '''
                  echo "status: ${status}"
              }
          }
        }
    }
    post{
        always{
            echo "========pipeline always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
