pipeline {
  agent {
    node {
      label 'nodejs'
    }
  }
  stages {
    stage("project") {
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject() {
              echo "Using project: ${openshift.project()}"
            }
          }
        }
      }
    }
    stage("build image") {
     steps {
        script {
          openshift.withCluster() {
            openshift.withProject() {
              echo "Build Appliction Image: backweb2"
              def bc = openshift.selector("bc", "backweb2")
              bc.startBuild().logs("-f")
              def bb = bc.narrow("bc").related("builds")
              timeout(10) {
                bb.untilEach(1) {
                  return (it.object().status.phase == "Complete")
                }
              }
            }
          }
        }
      }
    }
    stage("create tag") {
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject() {
              echo "Create Tag Image: backweb2"
              openshift.tag("backweb2:latest", "backweb2:v1")
            }
          }
        }
      }
    }
  }
}