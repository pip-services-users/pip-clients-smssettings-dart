# Examples for Sms Settings Microservice

This is a sms settings microservice from Pip.Services library. 
This microservice keeps settings of sms recipients.

Define client configuration parameters that match the configuration of the microservice's external API
```dart
// Client configuration
var httpConfig = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = SmsSettingsHttpClientV1(config);

// Configure the client
client.configure(httpConfig);

// Connect to the microservice
try{
  await client.open(null)
}catch() {
  // Error handling...
}       
// Work with the microservice
// ...
```

Now the client is ready to perform operations
```dart
// Create a new settings
final SETTINGS = SmsSettingsV1(
    id: '1',
    name: 'User 1',
    phone: '+1234567890',
    language: 'en',
    verified: false);

    // Create the settings
    try {
      var settings = await client.setSettings('123', SETTINGS);
      // Do something with the returned settings...
    } catch(err) {
      // Error handling...     
    }
```

```dart
// Get the settings
try {
var settings = await client.getSettingsByPhoneSettings(
    null,
    '+1234567890');
    // Do something with settings...

    } catch(err) { // Error handling}
```

```dart
// Verify an sms
try {
    settings1 = SETTINGS;
    settings1.ver_code = '123';  
    await controller.verifySms(null, '1', '123');

    var settings = await client.getSettingsById(
    null,
    '1');
    // Do something with settings...

    } catch(err) { // Error handling}
```

In the help for each class there is a general example of its use. Also one of the quality sources
are the source code for the [**tests**](https://github.com/pip-services-users/pip-clients-smssettings-dart/tree/master/test).
