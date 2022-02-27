pipeline {
    agent any
    options {
        timestamps()
        timeout(time: 1, unit: 'HOURS')
    }
    environment { 
        image_name = "myproj/nzajos-org/murakoze:1.0"
        PATH="$PATH:/usr/lib/go-1.9/bin"
        GOPATH="$WORKSPACE"
    }
    stages {
        stage('Checkout') {
            steps { 
                sh "mkdir -p $GOPATH/src/github.com/nzajos-org/murakoze"
                dir("$GOPATH/src/github.com/nzajos-org/murakoze") {
                    git url: 'github.com/nzajos-org/murakoze.git', credentialsId: 'none', branch: 'main'
                }
            }
        }
        stage('Build') {
            steps {
                dir("$GOPATH/src/github.com/nzajos-org/murakoze") {
                    sh "go get ./..."
                    sh "go build"
                }
            }
        }
        stage('Test') {
            steps {
                dir("$GOPATH/src/github.com/nzajos-org/murakoze") {
                    sh "go test"
                }
            }
        }
        stage('Package') {
            steps {
               sh "docker build . -t ${image_name}"
            }
        }
        // stage('Deploy') {
        //     steps {
        //        sh "gcloud docker -- push ${image_name}"
        //        sh "helm install --namespace murakoze --name web chart/murakoze"
        //     }
        // }
    }
}