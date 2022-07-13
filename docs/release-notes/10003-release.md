# EnOcean IoT Connector - 1.1.0 Released

## General

### Features

- License check will provides more context why activation failed e.g. internet connection failed
- Timestamp added to MetaEvents of sensors
- Detailed report about performance and resource consumption during common peak traffic load scenarios
- Container versions are now listed in each container separately
- All MQTT JSON payloads are now available as JSON schemas in the download section

### Bugs

- Start up of deployments in Azure is more stable and fails gracefully
- Fixed: Summary also enabled for egress into Azure IoT Hub

## API Container

### Bugs

- Renamed response schemas for telegram / gateway statistics

### Features

- Health messages are included are appended the gateway Information structure when using the API

## Azure Container

### Features

- Redis startup error messages are now handled gracefully

## Engine Container

### Features

- Added support for Deuta People passing counter ESC.
- Supported EEP List in documentation is autogenerated
- Extended documentation on additional debug/error messages

## MQTT Container

### Features

- Telegram statistics of sensors are periodically posted on MQTT. Feature can be turned off..
- Topic: "/gateway/<MAC>/health" renamed to "/gateway/<MAC>/meta/event"
- All MQTT topics are configurable with ENV variables at deployment
- Removed sensor health & security from telemetry JSON. Equivalent present in metaEvent
- Telegram statistics gateways are periodically posted on MQTT. Feature is configurable..
- MQTT Topic structure documented in detail
- An example in docker-compose file is provided how to deploy the mosquito broker with TLS certificates and user authentication
- Telegram statistics of posted on MQTT with telemetry
- MQTT basic username and password authentication
- x509 Certificate Connection to MQTT
