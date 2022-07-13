# Enable TLS for MQTT
1. Add lines below to integration container's environment variables in docker-compose.yml
```
- MQTT_USE_TLS=True
- MQTT_USE_TLS_VERIFY=True
```
2. Add secrets to integration container in docker-compose.yml
```
secrets:
    - source: mqtt-ca-cert
      target: /mqtt-ca.crt
      mode: 400
    - source: mqtt-client-cert
      target: /mqtt-mqtt_client.crt
      mode: 400
    - source: mqtt-client-key
      target: /mqtt-mqtt_client.key
      mode: 400
```
3. Expose TLS port of MQTT broker adding line below to ports of mqtt container in docker-compose.yml
```
- "8883:8883"
```
4. Give TLS configuration to MQTT Broker using the provided configuration as volume to mqtt container in docker-compose.yml file.
```
volumes:
    - ./mqtt/config:/mosquitto/config/
```
5. Define certificate files on docker-compose.yml secrets to be used on 2. 
```
mqtt-ca-cert:
    file: ./mqtt/certs/ca.crt   # Point your CA Certificate for MQTTS
mqtt-client-cert:
    file: ./mqtt/certs/client.crt  # Point your Client Certificate for MQTTS
mqtt-client-key:
    file: ./mqtt/certs/client.key  # Point your Client Key for MQTTS
```