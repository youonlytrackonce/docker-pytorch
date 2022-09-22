#! /bin/sh
#

docker build . --network=host --file $1 -t mas:$2-$3-$4
