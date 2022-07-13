# EnOcean IoT Connector - 1.3.0 Released

## General

### Features

- Support for secure MQTT 
- Configuration option to only support encrypted data from secure devices
- System health check of IoTC is performed at fixed interval. Health information is published to the MQTT topic and can be accessed via API calls

## API Container

### Features

- Added PATCH operation to /backup endpoint
- New system health API enpoint

## Engine Container

### Features

- A5-12-01 EEP added

### Bugs

- Minor transcoding error fixed on d2-14-40 and d2-14-41 profiles

## Integration Container

### Features

- Added MQTTS support with x509 certificates
- Egress functionality has been decoupled from engine and moved to a separate "integration" container  

