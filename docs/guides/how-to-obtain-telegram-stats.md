The API provides telegram statistics of the individual enocean device and per ingress gateway.

=== "Gateway statistics"

    Calling `GET /gateways/metadata/statistics/telegrams` returns the statics per gateway
    
    ```json
    [
        {
        "device": {
          "hardwareDescriptor": "AP-305",
          "mac": "d01546c204a2",
          "softwareVersion": "8.7.1.1-8.7.1.1"
        },
        "stats": {
          "lastSeen": "1619210924",
          "notProcessed": 0,
          "succesfullyProcessed": 78662,
          "totalTelegramCount": 78662
        }
      },
      {
        "device": {
          "hardwareDescriptor": "AP-305",
          "mac": "24f27f551bf4",
          "softwareVersion": "8.7.1.0-8.7.1.0"
        },
        "stats": {
          "lastSeen": "1619210928",
          "notProcessed": 0,
          "succesfullyProcessed": 91526,
          "totalTelegramCount": 91526
        }
      }
    ]
    ```

=== "EnOcean Device statistics"

    Calling `GET /devices/metadata/statistics/telegrams?sourceID=051b03c9&destinationID=FFFFFFFF` returns statistics for a individul EnOcean device `sourceID=051b03c9&destinationID=FFFFFFFF`.
    
    ```json
    [
      {
        "device": {
          "activeFlag": "true",
          "customTag": "",
          "destinationEurid": "ffffffff",
          "eep": "a5-09-09",
          "friendlyID": "co2_Hardware2",
          "isPTM": "false",
          "location": "Hardware 2",
          "sourceEurid": "051b03c9"
        },
        "stats": {
          "lastSeen": "1619210854",
          "notProcessed": 0,
          "succesfullyProcessed": 1057,
          "totalTelegramCount": 1057
        }
      }
    ]
    ```

The  `stats` section is defined as:

```yaml
TelegramStatistics:
      properties:
        lastSeen:
          description: Timestamp of last valid telegram from device in UTC seconds.
          type: string
        notProcessed:
          description: Count of not processed telegrams due to various reasons & NOT forwarded on egress.
          type: integer
        succesfullyProcessed:
          description: Count of succesfully processed telegrams & forwarded on egress.
          type: integer
        totalTelegramCount:
          description: Total count of received telegrams.
          type: integer
```

General operation can be checked by the `lastSeen` parameter. Some devices have a periodic communication pattern. Checking deviations / fluctuations in the pattern can help to detect issues.