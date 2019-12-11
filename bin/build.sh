#!/usr/bin/env bash

for docker in $(find ./ -name Dockerfile); do
  name=$(dirname $docker)
  echo ${name#./}
  (cd $name && docker build -t ${name#./} .)
  $(aws ecr get-login --no-include-email --region ap-south-1)
  docker tag ${name#./}:latest 580572941932.dkr.ecr.ap-south-1.amazonaws.com/cloudenablers/${name#./}:latest
  docker push 580572941932.dkr.ecr.ap-south-1.amazonaws.com/cloudenablers/${name#./}:latest
done
