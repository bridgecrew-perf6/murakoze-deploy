pipeline {
    agent any
    options {
        timestamps()
        timeout(time: 1, unit: 'HOURS')
    }
    tools{
        go 'go-1.17'
    }
    environment { 
        image_name = "myproj/nzajos-org/murakoze:1.0"
        PATH="$PATH:/usr/lib/go-1.9/bin"
        GOPATH="$WORKSPACE"
        GO117MODULE = 'off' 
    }
    
    stages {
        stage('Checkout') {
            steps { 
                sh "mkdir -p $GOPATH/src/github.com/nzajos-org/murakoze"
                dir("$GOPATH/src/github.com/nzajos-org/murakoze") {
                    git url: 'https://user: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@github.com/nzajos-org/murakoze.git', credentialsId: 'none', branch: 'main'
                
                }
            }
        }
        stage('Build') {
            steps {
                dir("$GOPATH/src/github.com/nzajos-org/murakoze") { 
                    sh "go build"
                }
            }
        }
        // stage('Test') {
        //     steps {
        //         dir("$GOPATH/src/github.com/nzajos-org/murakoze") {
        //             sh "go test"
        //         }
        //     }
        // }
        //test okkk
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