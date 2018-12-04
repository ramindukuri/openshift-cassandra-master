#!/bin/bash
#===============================================================================
#
#          FILE:  delete.sh
# 
#         USAGE:  ./delete.sh 
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
#       CREATED:  12/03/2018 02:11:15 PM EST
#      REVISION:  ---
#===============================================================================

oc delete all -l app=cassandra
