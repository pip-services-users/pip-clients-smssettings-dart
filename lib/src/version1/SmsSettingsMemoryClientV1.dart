import 'package:pip_services_smssettings/pip_services_smssettings.dart';

import './ISmsSettingsClientV1.dart';

class SmsSettingsMemoryClientV1 implements ISmsSettingsClientV1 {
  List<SmsSettingsV1> _settings = <SmsSettingsV1>[];

  @override
  Future<List<SmsSettingsV1>> getSettingsByIds(
      String correlationId, List<String> recipientIds) async {
    var settings = _settings.where((s) => recipientIds.contains(s.id)).toList();
    return settings;
  }

  @override
  Future<SmsSettingsV1> getSettingsById(
      String correlationId, String recipientId) async {
    var settings = _settings.isNotEmpty
        ? _settings.firstWhere((s) => s.id == recipientId)
        : null;
    return settings;
  }

  @override
  Future<SmsSettingsV1> getSettingsByPhoneSettings(
      String correlationId, String phone) async {
    var settings = _settings.isNotEmpty
        ? _settings.firstWhere((s) => s.phone == phone)
        : null;
    return settings;
  }

  @override
  Future<SmsSettingsV1> setSettings(
      String correlationId, SmsSettingsV1 settings) async {
    settings.verified = false;
    settings.subscriptions = settings.subscriptions ?? {};

    var old_settings = _settings;
    _settings = old_settings.where((s) => s.id != settings.id).toList();
    _settings.add(settings);
    return settings;
  }

  @override
  Future<SmsSettingsV1> setVerifiedSettings(
      String correlationId, SmsSettingsV1 settings) async {
    settings.verified = true;
    settings.subscriptions = settings.subscriptions ?? {};

    var old_settings = _settings;
    _settings = old_settings.where((s) => s.id != settings.id).toList();
    _settings.add(settings);
    return settings;
  }

  @override
  Future<SmsSettingsV1> setRecipient(String correlationId, String recipientId,
      String name, String phone, String language) async {
    var settings = _settings.isNotEmpty
        ? _settings.firstWhere((s) => s.id == recipientId)
        : null;

    if (settings != null) {
      settings.name = name;
      settings.phone = phone;
      settings.language = language;
    } else {
      settings = SmsSettingsV1(
          id: recipientId,
          name: name,
          phone: phone,
          language: language,
          verified: false,
          subscriptions: {});
      _settings.add(settings);
    }

    return settings;
  }

  @override
  Future<SmsSettingsV1> setSubscriptions(
      String correlationId, String recipientId, dynamic subscriptions) async {
    var settings = _settings.isNotEmpty
        ? _settings.firstWhere((s) => s.id == recipientId)
        : null;

    if (settings != null) {
      settings.subscriptions = subscriptions;
    } else {
      settings = SmsSettingsV1(
          id: recipientId,
          name: null,
          phone: null,
          language: null,
          subscriptions: subscriptions);
      _settings.add(settings);
    }

    return settings;
  }

  @override
  Future<SmsSettingsV1> deleteSettingsById(
      String correlationId, String recipientId) async {
    var old_settings = _settings;
    var settings = _settings.isNotEmpty
        ? _settings.firstWhere((s) => s.id == recipientId)
        : null;
    _settings = old_settings.where((s) => s.id != recipientId).toList();
    return settings;
  }

  @override
  Future<void> resendVerification(
      String correlationId, String recipientId) async {
    return null;
  }

  @override
  Future<void> verifyPhone(
      String correlationId, String recipientId, String code) async {
    var settings = _settings.isNotEmpty
        ? _settings.firstWhere((s) => s.id == recipientId)
        : null;

    if (settings != null && settings.ver_code == code) {
      settings.verified = true;
      settings.ver_code = null;
    }

    return null;
  }
}
