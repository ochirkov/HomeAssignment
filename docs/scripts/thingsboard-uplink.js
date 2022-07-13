// Decode an uplink message from a buffer
// payload - array of bytes
// metadata - key/value object

/** Decoder **/

// decode payload to string
//var payloadStr = decodeToString(payload);

// decode payload to JSON
var data = decodeToJson(payload);

var deviceName = data.sensor.id;
var deviceType = data.sensor.eep;
//var customerName = 'customer';
//var groupName = 'thermostat devices';
// use assetName and assetType instead of deviceName and deviceType
// to automatically create assets instead of devices.
var assetName = data.sensor.location;
var assetType = 'room';
var topicPattern = '/sensor/+/telemetry';


// Result object with device/asset attributes/telemetry data

let telemetryEntry = {}

telemetryEntry.ts = parseInt(data.raw.timestamp)*1000;
telemetryEntry.values = {};

    data.telemetry.data.forEach((element) => {
       telemetryEntry.values[element.key] =  element.value

    });

    data.telemetry.signal.forEach((element) => {
       telemetryEntry.values[element.key] =  element.value

    });

telemetryEntry.values["signal-dbm"] =  data.raw.rssi;

var result = {
// Use deviceName and deviceType or assetName and assetType, but not both.
   deviceName: deviceName,
   deviceType: deviceType,
   deviceLabel: data.sensor.friendlyID,
   attributes: {
       integrationName: metadata['integrationName'],
       eurid: data.sensor.id,
       location: data.sensor.location
   },
//   assetName: assetName,
//   assetType: assetType,
//   customerName: payloadStr.sensor.friendlyID,

   telemetry: telemetryEntry
};

/** Helper functions **/

function decodeToString(payload) {
   return String.fromCharCode.apply(String, payload);
}

function decodeToJson(payload) {
   // covert payload to string.
   var str = decodeToString(payload);

   // parse string to JSON
   var data = JSON.parse(str);
   return data;
}

return result;
