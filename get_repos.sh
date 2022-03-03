#!/bin/bash
# Author: Sarav AK
# Email: hello@gritfy.com
# Created Date: 19 Aug 2021
#

USERNAME=<USERNAME>

# No of reposoitories per page - Maximum Limit is 100
PERPAGE=100

# Change the BASEURL to  your Org or User based
# Org base URL
# BASEURL="https://api.github.com/orgs/<your_org_name>/repos"

# User base URL
BASEURL="https://api.github.com/users/${USERNAME}/repos"

# Calculating the Total Pages after enabling Pagination
TOTALPAGES=`curl -I -i -u $USERNAME:${GITHUB_SECRET} -H "Accept: application/vnd.github.v3+json" -s ${BASEURL}\?per_page\=${PERPAGE} | grep -i link: 2>/dev/null|sed 's/link: //g'|awk -F',' -v  ORS='\n' '{ for (i = 1; i <= NF; i++) print $i }'|grep -i last|awk '{print $1}' | tr -d '\<\>' | tr '\?\&' ' '|awk '{print $3}'| tr -d '=;page'`
# echo $TOTALPAGES
i=1

until [ $i -gt $TOTALPAGES ]
do
  result=`curl -s -u $USERNAME:${GITHUB_SECRET} -H 'Accept: application/vnd.github.v3+json' ${BASEURL}?per_page=${PERPAGE}\&page=${i} 2>&1`
  echo $result > tempfile
  # echo "Repo Name, SSH URL, Clone URL"
  cat tempfile|jq '.[]| [.name]| @csv'|tr -d '\\"'
  ((i=$i+1))
done