import 'package:connector_openapi/api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:test/test.dart';

/// These tests cover the methods afforded by the connector SDK
void main() async {
  const String port = '1000';
  const String host = 'http://localhost:$port';
  final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

  /// Future instance of Connect to be used in connectorApi Tests ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
  Future<Context> connect() async {
    try {
      return connectorApi.connect(
        seededConnectorConnection: SeededConnectorConnection(
          application: SeededTrackedApplication(
            name: ApplicationNameEnum.ULTRA_EDIT,
            platform: PlatformEnum.MACOS,
            version: '1.5.8',
          ),
        ),
      );
      // print('======== $connect');
    } catch (err) {
      throw Exception('Error occurred when establishing connection. error:$err');
    }
  }

///ConnectorApi Group
///  .--.      .--.      .--.      .--.      .--.      .--.      .--.      .--.
/// :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
/// '      `--'      `--'      `--'      `--'      `--'      `--'      `--'      `
group('Testing the connectorApi ', ()
  {
    ///
    ///
    ///==============================================================================================
    test('/onboarded', () async {
      Context context = await connect();

      /// /onboarded Runtime Type
      ///  .--.      .--.      .--.      .--.      .--.      .--.      .--.      .--.
      /// :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
      /// '      `--'      `--'      `--'      `--'      `--'      `--'      `--'      `
      String response = await connectorApi.onboarded(
        context.application.id,
        body: true,
      );

      print(response);

      expect(response.runtimeType, String);
    });
    test('ok', () async {
      Context context = await connect();

      /// /onboarded == 'OK' Type
      ///  .--.      .--.      .--.      .--.      .--.      .--.      .--.      .--.
      /// :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
      /// '      `--'      `--'      `--'      `--'      `--'      `--'      `--'      `
      String response = await connectorApi.onboarded(
        context.application.id,
        body: true,
      );

      expect(response.contains('OK'), true);
    });
    });
  }