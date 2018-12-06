#!/bin/bash
#===============================================================================
#
#          FILE:  build.sh
# 
#         USAGE:  ./build.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  12/04/2018 05:51:48 PM EST
#      REVISION:  ---
#===============================================================================

oc new-build --strategy docker --binary --docker-image openshift-cassandra:latest --name waus
oc start-build openshift-cassandra --from-dir . --follow


docker build . -t openshift-cassandra:latest
oc new-build --strategy docker --binary --docker-image openshift-cassandra:latest --name openshift-cassandra
oc start-build openshift-cassandra:latest --from-dir . --follow


sudo rm -rf openshift.local.clusterup 
docker build . -t oc-cassandra
docker tag oc-cassandra:latest rindukuri/oc-cassandra
docker push rindukuri/oc-cassandra