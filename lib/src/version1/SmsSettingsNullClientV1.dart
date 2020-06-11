import 'dart:async';
import 'package:pip_services_smssettings/pip_services_smssettings.dart';
import './ISmsSettingsClientV1.dart';

class SmsSettingsNullClientV1 implements ISmsSettingsClientV1 {
  @override
  Future<List<SmsSettingsV1>> getSettingsByIds(
      String correlationId, List<String> recipientIds) async {
    return List<SmsSettingsV1>(0);
  }

  @override
  Future<SmsSettingsV1> getSettingsById(
      String correlationId, String recipientId) async {
    return null;
  }

  @override
  Future<SmsSettingsV1> getSettingsByPhoneSettings(
      String correlationId, String phone) async {
    return null;
  }

  @override
  Future<SmsSettingsV1> setSettings(
      String correlationId, SmsSettingsV1 settings) {
    return null;
  }

  @override
  Future<SmsSettingsV1> setVerifiedSettings(
      String correlationId, SmsSettingsV1 settings) {
    return null;
  }

  @override
  Future<SmsSettingsV1> setRecipient(String correlationId, String recipientId,
      String name, String phone, String language) {
    return null;
  }

  @override
  Future<SmsSettingsV1> setSubscriptions(
      String correlationId, String recipientId, subscriptions) {
    return null;
  }

  @override
  Future<SmsSettingsV1> deleteSettingsById(
      String correlationId, String recipientId) {
    return null;
  }

  @override
  Future resendVerification(String correlationId, String recipientId) {
    return null;
  }

  @override
  Future verifyPhone(String correlationId, String recipientId, String code) {
    return null;
  }
}
