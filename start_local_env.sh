#!/bin/bash -xe

CURRENT_DIR=$(pwd)

if [[ $1 == 'deploy' ]]; then

    if [[ -z $IOT_LICENSE_KEY ]]; then
      echo "You need export IOT_LICENSE_KEY first"
      exit 1
    fi


    # IoTC gateway creds
    #
    export IOT_GATEWAY_USERNAME=iot-user
    export IOT_GATEWAY_PASSWORD=$(openssl rand -base64 32)
    echo $IOT_GATEWAY_PASSWORD > out
    # IoTC api creds
    #
    export BASIC_AUTH_USERNAME=api-user
    export BASIC_AUTH_PASSWORD=$(openssl rand -base64 32)
    echo $BASIC_AUTH_PASSWORD >> out

    # Simulation creds
    #
    export IOT_ENDPOINT_USERNAME=$IOT_GATEWAY_USERNAME
    export IOT_ENDPOINT_PASSWORD=$IOT_GATEWAY_PASSWORD
    export IOT_API_USERNAME=$BASIC_AUTH_USERNAME
    export IOT_API_PASSWORD=$BASIC_AUTH_PASSWORD

    # Generate self sign certificates
    #
    openssl req -x509 -newkey rsa:4096 -keyout $CURRENT_DIR/deploy/nginx/dev.localhost.key -out $CURRENT_DIR/deploy/nginx/dev.localhost.crt -sha256 -days 365 -subj '/CN=localhost' -nodes

    # Deploy core
    #
    cd $CURRENT_DIR/deploy/local_deployment && docker-compose up -d

    # Deploy Simulation
    #
    cd $CURRENT_DIR/deploy/simulation_ui_deployment && docker-compose up -d
elif [[ $1 == 'destroy' ]]; then
    cd $CURRENT_DIR/deploy/simulation_ui_deployment && docker-compose down
    cd $CURRENT_DIR/deploy/local_deployment && docker-compose down
    rm -f $CURRENT_DIR/deploy/nginx/dev.localhost.key
    rm -f $CURRENT_DIR/deploy/nginx/dev.localhost.crt
else
    echo "Only deploy/destroy params are available"
    exit 1
fi