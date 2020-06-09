

IMAGE=${IMAGE:-docker.io/grafana/grafana:7.0.3}
ENGINE=${ENGINE:-podman}
PORT=$((($RANDOM%64000)+1024))

dashboard='{
  "dashboard": '$(cat ${template})'
}'

esds='{
  "name": "'${name}'",
  "type": "elasticsearch",
  "access": "proxy",
  "url": "'${datasource}'",
  "database": "'${index}'",
  "jsonData": {
    "esVersion": 70,
    "maxConcurrentShardRequests": 5,
    "timeField": "uperf_ts"
  }
}'
