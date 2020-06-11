import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_smssettings/pip_clients_smssettings.dart';
import './SmsSettingsClientFixtureV1.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  8080
]);

void main() {
  group('SmsSettingsMemoryClientV1', () {
    SmsSettingsMemoryClientV1 client;
    SmsSettingsClientFixtureV1 fixture;

    setUp(() async {
      client = SmsSettingsMemoryClientV1();
      fixture = SmsSettingsClientFixtureV1(client);
    });

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
