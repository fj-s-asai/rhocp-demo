#!/bin/bash


#
# cds project ******************************************
#
oc project cds


#
# build phase ==========================================
#
# cdsupdater  ------------------------------------------
oc apply -f ../cdsupdater/ImageStream.yml
oc apply -f ../cdsupdater/pvc.yml
oc apply -f ../cdsupdater/BuildConfig.yml

# cds  ------------------------------------------
oc apply -f ../cds/ImageStream.yml
oc apply -f ../cds/BuildConfig.yml
oc apply -f ../cds/Service.yml
oc apply -f ../cds/Route.yml


sleep 120


#
# Deploy Phase =========================================
#

# cdsupdater  ------------------------------------------
oc apply -f ../cdsupdater/Job.yml

sleep 30

# cdsupdater  ------------------------------------------
oc apply -f ../cds/DeploymentConfig.yml




exit 0















