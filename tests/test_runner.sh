#!/bin/sh

# stop when one cmd fails, print commands
set -e
set -x

# start docker image
docker run -d -p 8080:80 --name test genepi/imputationserver
sleep 900

# show logs for debugging
docker logs test

# check if cloudgene is running on host port
curl -v -k --fail http://localhost:8080/api/v2/server/version.svg


# test imputationserver and hapmap
TEST_DATA="https://imputationserver.sph.umich.edu/static/downloads/hapmap300.chr1.recode.vcf.gz"
docker exec -t -i test cloudgene run imputationserver --files ${TEST_DATA} --refpanel apps@hapmap2 --conf /etc/hadoop/conf


# cleanup
docker stop test && docker rm test
