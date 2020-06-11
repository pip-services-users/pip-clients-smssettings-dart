import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import '../version1/SmsSettingsNullClientV1.dart';
import '../version1/SmsSettingsDirectClientV1.dart';
import '../version1/SmsSettingsHttpClientV1.dart';

class SmsSettingsClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-services-smssettings', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor =
      Descriptor('pip-services-smssettings', 'client', 'direct', '*', '1.0');
  static final HttpClientDescriptor =
      Descriptor('pip-services-smssettings', 'client', 'http', '*', '1.0');

  SmsSettingsClientFactory() : super() {
    registerAsType(
        SmsSettingsClientFactory.NullClientDescriptor, SmsSettingsNullClientV1);
    registerAsType(SmsSettingsClientFactory.DirectClientDescriptor,
        SmsSettingsDirectClientV1);
    registerAsType(
        SmsSettingsClientFactory.HttpClientDescriptor, SmsSettingsHttpClientV1);
  }
}
