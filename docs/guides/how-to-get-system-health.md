IoTC periodically checks the status of the containers to validate correct operation of IoTC. After each check, a system health notification is sent on MQTT to notify the application of the IoTC status. The application should examine the health notification and notify the system administrator in case issues are observed. The application should also use the periodic health notification as a keep alive and expect issues if the health notifications are not received.  

The system health notification sent on MQTT can also be requested through API. The system health information is guaranteed to be less than 60 seconds old when requested through the API.

The default system health check and reporting internal is 10 min, which can be configured through the HEALTH_PUBLISH_INTERVAL parameter in the docker-compose file.

A system health endpoint is automatically created with EEP D2-14-41 and ID: **04211939**. This is needed by IoTC to check the ingress and integration containers. This endpoint must be ignored by the application. 
