import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_smssettings/pip_services_smssettings.dart';
import './ISmsSettingsClientV1.dart';

class SmsSettingsHttpClientV1 extends CommandableHttpClient
    implements ISmsSettingsClientV1 {
  SmsSettingsHttpClientV1([config]) : super('v1/sms_settings') {
    var thisConfig = ConfigParams.fromValue(config);
    if (config != null) configure(thisConfig);
  }

  /// Gets a list of sms settings retrieved by a ids.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [recipientIds]            a recipient ids to get settings
  /// Return         Future that receives a data list
  /// Throws error.
  @override
  Future<List<SmsSettingsV1>> getSettingsByIds(
      String correlationId, List<String> recipientIds) async {
    var result = await callCommand(
      'get_settings_by_ids',
      correlationId,
      {'recipient_ids': recipientIds},
    );
    return List<SmsSettingsV1>.from(json
        .decode(result)
        .map((itemsJson) => SmsSettingsV1.fromJson(itemsJson)));
  }

  /// Gets a sms settings by recipient id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of settings to be retrieved.
  /// Return         Future that receives sms settings or error.
  @override
  Future<SmsSettingsV1> getSettingsById(
      String correlationId, String recipientId) async {
    var result = await callCommand(
        'get_settings_by_id', correlationId, {'recipient_id': recipientId});
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Gets a sms settings by its phone.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [phone]                a sms of sms settings to be retrieved.
  /// Return         Future that receives sms settings or error.
  @override
  Future<SmsSettingsV1> getSettingsByPhoneSettings(
      String correlationId, String phone) async {
    var result = await callCommand(
        'get_settings_by_phone', correlationId, {'phone': phone});
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Sets a sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [settings]              a sms settings to be set.
  /// Return         (optional) Future that receives set sms settings or error.
  @override
  Future<SmsSettingsV1> setSettings(
      String correlationId, SmsSettingsV1 settings) async {
    var result = await callCommand(
        'set_settings', correlationId, {'settings': settings});
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Sets a verified sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [settings]              a sms settings to be set.
  /// Return         (optional) Future that receives set verified sms settings or error.
  @override
  Future<SmsSettingsV1> setVerifiedSettings(
      String correlationId, SmsSettingsV1 settings) async {
    var result = await callCommand(
        'set_verified_settings', correlationId, {'settings': settings});
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Sets a recipient info into sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of settings to be retrieved.
  /// - [name]                a recipient name of settings to be set.
  /// - [phone]                a recipient phone of settings to be set.
  /// - [language]                a recipient language of settings to be set.
  /// Return         (optional) Future that receives updated sms settings
  /// Throws error.
  @override
  Future<SmsSettingsV1> setRecipient(String correlationId, String recipientId,
      String name, String phone, String language) async {
    var result = await callCommand('set_recipient', correlationId, {
      'recipient_id': recipientId,
      'name': name,
      'phone': phone,
      'language': language
    });
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Sets a subscriptions into sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of settings to be retrieved.
  /// - [subscriptions]                a subscriptions to be set.
  /// Return         (optional) Future that receives updated sms settings
  /// Throws error.
  @override
  Future<SmsSettingsV1> setSubscriptions(
      String correlationId, String recipientId, subscriptions) async {
    var result = await callCommand('set_subscriptions', correlationId,
        {'recipient_id': recipientId, 'subscriptions': subscriptions});
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Deletes a sms settings by recipient id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of the sms settings to be deleted
  /// Return                Future that receives deleted sms settings
  /// Throws error.
  @override
  Future<SmsSettingsV1> deleteSettingsById(
      String correlationId, String recipientId) async {
    var result = await callCommand(
        'delete_settings_by_id', correlationId, {'recipient_id': recipientId});
    if (result == null) return null;
    var item = SmsSettingsV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Resends verification.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of the sms settings to be resend verification
  /// Return                Future that receives null for success.
  /// Throws error.
  @override
  Future resendVerification(String correlationId, String recipientId) {
    return callCommand(
        'resend_verification', correlationId, {'recipient_id': recipientId});
  }

  /// Verifies an phone.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of the sms settings to be verified sms
  /// - [code]                a verification code for verifying sms
  /// Return                Future that receives null for success.
  /// Throws error.
  @override
  Future verifyPhone(String correlationId, String recipientId, String code) {
    return callCommand('verify_phone', correlationId,
        {'recipient_id': recipientId, 'code': code});
  }
}
