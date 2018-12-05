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
