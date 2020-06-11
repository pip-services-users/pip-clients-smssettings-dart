import 'package:test/test.dart';
import 'package:pip_services_smssettings/pip_services_smssettings.dart';
import 'package:pip_clients_smssettings/pip_clients_smssettings.dart';

final SETTINGS = SmsSettingsV1(
    id: '1',
    name: 'User 1',
    phone: '+1234567890',
    language: 'en',
    verified: false);

class SmsSettingsClientFixtureV1 {
  ISmsSettingsClientV1 _client;

  SmsSettingsClientFixtureV1(ISmsSettingsClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testCrudOperations() async {
    SmsSettingsV1 settings1;

    // Create sms settings
    var settings = await _client.setSettings(null, SETTINGS);
    expect(settings, isNotNull);
    expect(SETTINGS.id, settings.id);
    expect(SETTINGS.phone, settings.phone);
    expect(settings.verified, isFalse);

    settings1 = settings;

    // Update verified sms settings
    settings = await _client.setVerifiedSettings(null, settings1);
    expect(settings, isNotNull);
    expect(settings1.id, settings.id);
    expect(settings1.phone, settings.phone);
    expect(settings.verified, isTrue);

    // Update the settings
    settings1.subscriptions = {'engagement': true};

    settings = await _client.setSettings(null, settings1);
    expect(settings, isNotNull);
    expect(settings1.id, settings.id);
    expect(settings.subscriptions['engagement'], isTrue);

    // Get settings
    var list = await _client.getSettingsByIds(null, [settings1.id]);
    expect(list, isNotNull);
    expect(list.length, 1);

    // Delete the settings
    settings = await _client.deleteSettingsById(null, settings1.id);
    expect(settings, isNotNull);
    expect(settings1.id, settings.id);

    // Try to get deleted settings
    settings = await _client.getSettingsById(null, settings1.id);
    expect(settings, isNull);
  }
}
