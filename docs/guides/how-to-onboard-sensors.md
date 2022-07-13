Use `POST /device` to add the devices one by one or `POST /backup` all at once.
Minimum parameters are:
```json
{
  "eep": "A5-04-05",
  "friendlyID": "Room Panel 02",
  "location": "Level 2 / Room 221",
  "sourceEurid": "a1b2c3d4"
}
```

Check the [API Documentation](./api-documentation.md) for the complete schema.