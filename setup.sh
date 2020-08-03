#!/bin/bash


oc project demo

# frontweb  ------------------------------------------
oc apply -f ./frontweb/ImageStream.yml
oc apply -f ./frontweb/BuildConfig.yml
oc apply -f ./frontweb/Deployment.yml
#oc apply -f ./frontweb/DeploymentConfig.yml
oc apply -f ./frontweb/Service.yml


# backweb1  ------------------------------------------
oc apply -f ./backweb1/ImageStream.yml
oc apply -f ./backweb1/BuildConfig.yml
oc apply -f ./backweb1/Deployment.yml
#oc apply -f ./backweb1/DeploymentConfig.yml
oc apply -f ./backweb1/Service.yml



# backweb1 ------------------------------------------
oc apply -f ./backweb2/ImageStream.yml
oc apply -f ./backweb2/BuildConfig.yml
oc apply -f ./backweb2/Deployment.yml
#oc apply -f ./backweb2/DeploymentConfig.yml
oc apply -f ./backweb2/Service.yml


# mysql   ------------------------------------------
oc apply -f ./mysql/ImageStream.yml
oc apply -f ./mysql/pvc.yml
oc apply -f ./mysql/BuildConfig.yml
oc apply -f ./mysql/DeploymentConfig.yml
oc apply -f ./mysql/Service.yml



# restdb  ------------------------------------------
oc apply -f ./restdb/ImageStream.yml
oc apply -f ./restdb/BuildConfig.yml
#oc apply -f ./restdb/Deployment.yml
oc apply -f ./restdb/DeploymentConfig.yml
oc apply -f ./restdb/Service.yml



oc project cds












