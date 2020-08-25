#!/bin/bash


#
# demo project ***************************************
#
oc project demo



# backweb1  ------------------------------------------
oc apply -f ./backweb1/BuildConfig_v12.yml
oc apply -f ./backweb1/DestinationRule_v12.yml
oc apply -f ./backweb1/VirtualService_v12.yml

sleep 90


#
# Deploy Phase ========================================
#


# backweb1  -------------------------------------------
oc apply -f ./backweb1/Deployment_v12.yml

