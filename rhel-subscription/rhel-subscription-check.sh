#!/bin/bash
#
# check-rhel-subscription.sh
#
# Checks RHEL subscription expiry. By default 30 days before expiry of Subscription
# To increase the Days change days in expiration_DATE
# Author: Gnanaraj Thomas
# E-mail:gnanarajtthomas@gmail.com
# Version: 0.1
# Last Modified: December 20


expiration_DATE=$(date -d "+30 days" "+"%Y-%m-%d"")
check_SUBSCRIPTION=$(subscription-manager status --ondate=$expiration_DATE | grep "Overall Status:" | awk {'print $3'})
CUR="Current"
INV="Invalid"

if
     [ "$check_SUBSCRIPTION" == "$CUR" ]
then
     echo "OK - Subscription is $check_SUBSCRIPTION"
elif
     [ "$check_SUBSCRIPTION" == "$INV" ]
then
     echo "WARNING - Subscription is $check_SUBSCRIPTION"
else
     echo "CRITICAL - $check_SUBSCRIPTION"
fi
