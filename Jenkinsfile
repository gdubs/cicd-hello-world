node {
    try {
        deleteDir()

        def dockerfilename = 'Dockerfile'


        stage('Checkout repo') {
            echo "versions: ${params.versions}"
            echo "git cred: ${params.git_credentialsId}"
            echo "git url: ${params.git_url}"
            // checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: "*/master"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "${params.git_credentialsId}", url: "${params.git_url}"]]]
            git branch: 'master', credentialsId: "${params.git_credentialsId}", url: "${params.git_repo_url}"
        }

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
                aws eks --region ${params.region} update-kubeconfig --name ${params.cluster_name}
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

