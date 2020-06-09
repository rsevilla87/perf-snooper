#!/bin/bash -eu

set -eu
usage(){
  cat << EOF
Usage:

$0 -d elasticsearch -t template-path [-i index]
EOF
exit 0
}
index=""
while getopts "u:d:i:t:h" opt; do
  case ${opt} in
    d )
      datasource=$OPTARG
      ;;
    i )
      index=$OPTARG
      ;;
    t )
      template=$OPTARG
      ;;
    h )
      usage 
      ;;
    \? )
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done

source common.sh
index=${index:-ripsaw-uperf-results}

${ENGINE} run -d --rm -p ${PORT}:3000 -e GF_AUTH_ANONYMOUS_ENABLED=true ${IMAGE}
sleep 5
echo ${esds} | curl -sS http://localhost:${PORT}/api/datasources -H "Content-type: application/json" -u admin:admin -d@- -o /dev/null
url=$(echo "${dashboard}" | curl -sS http://localhost:${PORT}/api/dashboards/db -H "Content-type: application/json" -u admin:admin  -d@- | jq -r .url)
echo -e "UPerf dashboard available at:\nhttp://localhost:${PORT}${url}"

