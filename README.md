# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br> Sms Settings Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-smssettings](https://github.com/pip-services-users/pip-services-smssettings-dart) microservice.

## Download

Right now the only way to get the microservice is to check it out directly from github repository
```bash
git clone git@github.com:pip-services-users/pip-clients-smssettings-dart.git
```

Pip.Service team is working to implement packaging and make stable releases available for your 
as zip downloadable archieves.

## Contract

Logical contract of the microservice is presented below. For physical implementation (HTTP/REST),
please, refer to documentation of the specific protocol.

```dart
class SmsSettingsV1 implements IStringIdentifiable {
  /* Recipient information */
  String id;
  String name;
  String phone;
  String language;

  /* SmsSettings management */
  dynamic subscriptions;
  bool verified;
  String ver_code;
  DateTime ver_expire_time;

  /* Custom fields */
  dynamic custom_hdr;
  dynamic custom_dat;
}

abstract class ISmsSettingsV1 {
  Future<List<SmsSettingsV1>> getSettingsByIds(
      String correlationId, List<String> recipientIds);

  Future<SmsSettingsV1> getSettingsById(String correlationId, String recipientId);

  Future<SmsSettingsV1> getSettingsByPhoneSettings(String correlationId, String phone);

  Future<SmsSettingsV1> setSettings(String correlationId, SmsSettingsV1 settings);

  Future<SmsSettingsV1> setVerifiedSettings(String correlationId, SmsSettingsV1 settings);  

  Future<SmsSettingsV1> setRecipient(String correlationId, String recipientId, String name, String phone, String language);

  Future<SmsSettingsV1> setSubscriptions(String correlationId, String recipientId, dynamic subscriptions);

  Future<SmsSettingsV1> deleteSettingsById(String correlationId, String recipientId);

  Future resendVerification(String correlationId, String recipientId);

  Future verifyPhone(String correlationId, String recipientId, String code);
}
```

## Use

The easiest way to work with the microservice is to use client SDK. 

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

## Acknowledgements

This microservice was created and currently maintained by
- **Sergey Seroukhov**
- **Nuzhnykh Egor**.
