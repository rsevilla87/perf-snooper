# perf-snooper

## Uperf dashboard

```
$ ./uperf.sh -h
Usage:
./uperf.sh -d elasticsearch -t template-path [-i index]

$ ./uperf.sh -d http://es_instance:9200 -t uperf_perf.json
44fcaa208b690803c3d1332b6b40cbad824a2bc11458c3939ac9fac8fb9b19ff
UPerf dashboard available at:
http://localhost:2243/d/iweQlQtZk/public-uperf-results
```

It's also possible to configure an alternative index with the -i flag

```
$ ./uperf.sh -d http://es_instance:9200 -t uperf_perf.json -i my-uperf-index
```

