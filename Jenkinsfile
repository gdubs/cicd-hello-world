node {
    try {
        deleteDir()

        def dockerfilename = 'Dockerfile'

        // stage('Build docker image') {
        //     def image = docker.build("${params.docker_repo}:${params.image_version}", "-f ${dockerfilename} .")

        //     image.inside {
        //         sh 'node -v'
        //     }
        // }
        stage('Checkout'){
            echo "Checking out"
        }

        stage('Deploy container') {
            sh """
                kubectl apply -f k8s/app.yaml
            """
        }
    }
    catch (all) {
        echo "Exception: " + all.toString()
    }
}

