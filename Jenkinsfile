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

        stage('Get credentials - k8'){
            echo "Get kubeconfig"

            sh """
                aws eks --region us-east-2 update-kubeconfig --name terraform-eks-demo-gr
            """

        }
        stage('Deploy service') {
            sh """
                kubectl apply -f k8s/app.yaml
            """
        }
    }
    catch (all) {
        echo "Exception: " + all.toString()
    }
}

