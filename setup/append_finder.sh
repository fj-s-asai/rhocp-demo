#!/bin/bash

#
# get cds url
#
oc project cds
URL=`oc get route --no-headers | awk '{print $2}'`



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
sed -e "s/\${{CDS_HOME}}/http:\/\/$URL/" ../finder/Deployment.yml | oc apply -f -


# frontweb  -------------------------------------------
sed -e "s/\${{CDS_HOME}}/http:\/\/$URL/" ../frontweb/Deployment_v11.yml | oc apply -f -


#
# Update ServiceMesh  =================================
#

# istio -----------------------------------------------
oc apply -f ../istio/VirtualService_finder.yml

