import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_smssettings/pip_services_smssettings.dart';
import './ISmsSettingsClientV1.dart';

class SmsSettingsDirectClientV1 extends DirectClient<dynamic>
    implements ISmsSettingsClientV1 {
  //ConfigParams _defaultParameters = ConfigParams();

  SmsSettingsDirectClientV1([config]) : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-smssettings', 'controller', '*', '*', '1.0'));
    var thisConfig = ConfigParams.fromValue(config);
    //_defaultParameters = thisConfig.getSection('parameters');
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
    var timing = instrument(correlationId, 'sms_settings.get_settings_by_ids');
    var list = await controller.getSettingsByIds(correlationId, recipientIds);
    timing.endTiming();
    return list;
  }

  /// Gets a sms settings by recipient id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of settings to be retrieved.
  /// Return         Future that receives sms settings or error.
  @override
  Future<SmsSettingsV1> getSettingsById(
      String correlationId, String recipientId) async {
    var timing = instrument(correlationId, 'sms_settings.get_settings_by_id');
    var settings = await controller.getSettingsById(correlationId, recipientId);
    timing.endTiming();
    return settings;
  }

  /// Gets a sms settings by its phone.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [phone]                a sms of sms settings to be retrieved.
  /// Return         Future that receives sms settings or error.
  @override
  Future<SmsSettingsV1> getSettingsByPhoneSettings(
      String correlationId, String phone) async {
    var timing = instrument(correlationId, 'sms_settings.get_settings_by_sms');
    var settings =
        await controller.getSettingsByPhoneSettings(correlationId, phone);
    timing.endTiming();
    return settings;
  }

  /// Sets a sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [settings]              a sms settings to be set.
  /// Return         (optional) Future that receives set sms settings or error.
  @override
  Future<SmsSettingsV1> setSettings(
      String correlationId, SmsSettingsV1 settings) async {
    var timing = instrument(correlationId, 'sms_settings.set_settings');
    var result = await controller.setSettings(correlationId, settings);
    timing.endTiming();
    return result;
  }

  /// Sets a verified sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [settings]              an sms settings to be set.
  /// Return         (optional) Future that receives set verified sms settings or error.
  @override
  Future<SmsSettingsV1> setVerifiedSettings(
      String correlationId, SmsSettingsV1 settings) async {
    var timing =
        instrument(correlationId, 'sms_settings.set_verified_settings');
    var result = await controller.setVerifiedSettings(correlationId, settings);
    timing.endTiming();
    return result;
  }

  /// Sets a recipient info into sms settings.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of settings to be retrieved.
  /// - [name]                a recipient name of settings to be set.
  /// - [phone]                a recipient sms of settings to be set.
  /// - [language]                a recipient language of settings to be set.
  /// Return         (optional) Future that receives updated sms settings
  /// Throws error.
  @override
  Future<SmsSettingsV1> setRecipient(String correlationId, String recipientId,
      String name, String phone, String language) async {
    var timing = instrument(correlationId, 'sms_settings.set_recipient');
    var result = await controller.setRecipient(
        correlationId, recipientId, name, phone, language);
    timing.endTiming();
    return result;
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
    var timing = instrument(correlationId, 'sms_settings.set_subscriptions');
    var result = await controller.setSubscriptions(
        correlationId, recipientId, subscriptions);
    timing.endTiming();
    return result;
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
    var timing =
        instrument(correlationId, 'sms_settings.delete_settings_by_id');
    var settings =
        await controller.deleteSettingsById(correlationId, recipientId);
    timing.endTiming();
    return settings;
  }

  /// Resends verification.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of the sms settings to be resend verification
  /// Return                Future that receives null for success.
  /// Throws error.
  @override
  Future resendVerification(String correlationId, String recipientId) async {
    var timing = instrument(correlationId, 'sms_settings.resend_verification');
    var result =
        await controller.resendVerification(correlationId, recipientId);
    timing.endTiming();
    return result;
  }

  /// Verifies a phone.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]                a recipient id of the sms settings to be verified sms
  /// - [code]                a verification code for verifying sms
  /// Return                Future that receives null for success.
  /// Throws error.
  @override
  Future verifyPhone(
      String correlationId, String recipientId, String code) async {
    var timing = instrument(correlationId, 'sms_settings.verify_sms');
    var result = await controller.verifyPhone(correlationId, recipientId, code);
    timing.endTiming();
    return result;
  }
}
