import 'dart:async';
//import 'package:pip_clients_sms/pip_clients_sms.dart';
import 'package:test/test.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_smssettings/pip_services_smssettings.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_smssettings/pip_clients_smssettings.dart';
import './SmsSettingsClientFixtureV1.dart';

void main() {
  group('SmsSettingsDirectClientV1', () {
    SmsSettingsDirectClientV1 client;
    SmsSettingsClientFixtureV1 fixture;
    SmsSettingsMemoryPersistence persistence;
    SmsSettingsController controller;

    setUp(() async {
      var logger = ConsoleLogger();
      persistence = SmsSettingsMemoryPersistence();
      controller = SmsSettingsController();
      var references = References.fromTuples([
        Descriptor('pip-services', 'logger', 'console', 'default', '1.0'),
        logger,
        Descriptor('pip-services-smssettings', 'persistence', 'memory',
            'default', '1.0'),
        persistence,
        Descriptor('pip-services-smssettings', 'controller', 'default',
            'default', '1.0'),
        controller
        // Descriptor('pip-services-sms', 'client', 'null', 'default', '1.0'), SmsNullClientV1()
      ]);
      controller.setReferences(references);

      client = SmsSettingsDirectClientV1();
      client.setReferences(references);

      fixture = SmsSettingsClientFixtureV1(client);
      await client.open(null);
    });

    tearDown(() async {
      await client.close(null);
      await Future.delayed(Duration(milliseconds: 2000));
    });

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
