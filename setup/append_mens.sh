#!/bin/bash


#
# demo project ***************************************
#
oc project demo


# mens  ------------------------------------------
oc apply -f ../mens/ImageStream.yml
oc apply -f ../mens/BuildConfig.yml
oc apply -f ../mens/Service.yml
oc apply -f ../mens/DestinationRule.yml
oc apply -f ../mens/VirtualService.yml


# frontweb  ------------------------------------------
oc apply -f ../frontweb/BuildConfig_v12.yml
oc apply -f ../frontweb/DestinationRule_v12.yml
oc apply -f ../frontweb/VirtualService_v12.yml

sleep 90


#
# Deploy Phase ========================================
#


# frontweb  -------------------------------------------
oc apply -f ../mens/Deployment.yml


# frontweb  -------------------------------------------
oc apply -f ../frontweb/Deployment_v12.yml



#
# Update ServiceMesh  =================================
#

# istio -----------------------------------------------
oc apply -f ../istio/VirtualService_mens.yml


