# EnOcean IoT Connector - 1.2.0 Released

## General

### Features

- All container OS images changed from Debian to Alpine
- All containers are now successfully passing SNYK static vulnerability scan.

## Azure Container

### Features

- Commissioning of EnOcean devices into EIoTC is now possible from Azure IoT Central
- Integration between EIoTC and Azure IoT Central is enabled
- Integration for telemetry exchange between EIoTC and Azure IoT Central

## Engine Container

### Features

- Commissioning of devices from EIoTC into Azure IoT Central enabled
- Azure IoT Central connection enabled and documented in the references.
- MQTT payload now validated against a schema for each egress message

### Bugs

- Improve mqtt egress re-connection timing parameters

## Ingress Container

### Features

- Optimization of Redis re-connection interval
- /auth/eotunnel endpoint for generic gateways enabled
- Support for generic gateway was added. /auth/eotunnel endpoint used for authentication.

