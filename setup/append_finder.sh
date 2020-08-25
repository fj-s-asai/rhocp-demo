#!/bin/bash


#
# demo project ***************************************
#
oc project demo




# finder  ------------------------------------------
oc apply -f ../finder/ImageStream.yml
oc apply -f ../finder/BuildConfig.yml
oc apply -f ../finder/Service.yml
oc apply -f ../finder/DestinationRule.yml
oc apply -f ../finder/VirtualService.yml


# frontweb  ------------------------------------------
oc apply -f ../frontweb/BuildConfig_v11.yml
oc apply -f ../frontweb/DestinationRule_v11.yml
oc apply -f ../frontweb/VirtualService_v11.yml

sleep 90


#
# Deploy Phase ========================================
#


# finder  ---------------------------------------------
oc apply -f ../finder/Deployment.yml


# frontweb  -------------------------------------------
oc apply -f ../frontweb/Deployment_v11.yml


#
# Update ServiceMesh  =================================
#

# istio -----------------------------------------------
oc apply -f ../istio/VirtualService_finder.yml

