#!/bin/bash

# EDIT name and domain
CONCOURSE_ENDPOINT=cli-vm.corp.local:8080
CONCOURSE_TARGET=nsx-concourse
PIPELINE_NAME=install-pks-with-nsx
CONCOURSE_USER=admin
CONCOURSE_PW=VMware1!

alias fly-s="fly -t $CONCOURSE_TARGET set-pipeline -p $PIPELINE_NAME -c install-pks-pipeline.yml -l pks-params.yml"
alias fly-d="fly -t $CONCOURSE_TARGET destroy-pipeline -p $PIPELINE_NAME"
alias fly-l="fly -t $CONCOURSE_TARGET containers | grep $PIPELINE_NAME"
alias fly-h="fly -t $CONCOURSE_TARGET hijack -b "

echo "Concourse target set to $CONCOURSE_ENDPOINT"
echo "Login using fly"
echo ""

fly --target $CONCOURSE_TARGET login -u $CONCOURSE_USER -p $CONCOURSE_PW --concourse-url http://${CONCOURSE_ENDPOINT} -n main
