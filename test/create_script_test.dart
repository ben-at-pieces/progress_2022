import 'package:connector_openapi/api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:gsheets/chart%20data/statistics_singleton.dart';
import 'package:test/test.dart';

/// /assets [GET]
/// /assets/{asset} [GET]
/// /assets/create] [POST]
/// /assets/{asset}/delete [POST]
/// /assets/related [GET]
/// /assets/search?query=string [GET]
/// TODO standardize db between all tests

Future<void> main() async {
  String port = '1000';
  String host = 'http://localhost:$port';
  final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
  final PersonsApi personsApi = PersonsApi(ApiClient(basePath: host));

  /// this is a future instance of assetsApi and
  /// allows for it to be referenced in other tests within this file

  group('Add Custom Group', () {
    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /assets [GET]    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^    /assets/create [POST]     v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

    /// TODO for this test different cases here
    /// images, text, code, different languages, different parameters within the metadata(tags, websites, classifications))
    ///
    test('/assets/create C [POST]', () async {
      /// (1) register or get an application first
      final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

      /// (2) get your application
      Application application = (await connectorApi.connect(
        seededConnectorConnection: SeededConnectorConnection(
          application: SeededTrackedApplication(
            name: ApplicationNameEnum.JETBRAINS,
            platform: PlatformEnum.MACOS,
            version: '3.1.0',
          ),
        ),
      ))
          .application;
      // print('application?? ${application}');

      /// (3) call the endpoint --> assetsCreateNewAsset
      Asset created = await assetsApi.assetsCreateNewAsset(
        seed: Seed(
          asset: SeededAsset(
            discovered: true,
            metadata: SeededAssetMetadata(
              name: 'sample snippet',
              mechanism: MechanismEnum.MANUAL,
              description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
              tags: [
                SeededAssetTag(
                    text: 'C', mechanism: MechanismEnum.AUTOMATIC, category: TagCategoryEnum.HANDLE)
              ],
              persons: [
                SeededPerson(
                  access: PersonAccess(
                      schema: EmbeddedModelSchema(
                          migration: 1,
                          semantic: EmbeddedModelSchemaSemanticVersionEnum.mAJOR0MINOR0PATCH1)),
                  type: PersonType(
                    basic: PersonBasicType(
                      username: '??',
                      name: 'benjaminbuttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app',
                    ),
                  ),
                ),
              ],
              websites: [
                SeededAssetWebsite(
                  url: 'www.pieces.app',
                  name: 'google!',
                )
              ],
              sensitives: [
                SeededAssetSensitive(
                  text: '333 333333 333333333',
                  category: SensitiveCategoryEnum.ACCESS_KEY,
                  severity: SensitiveSeverityEnum.HIGH,
                  name: 'Secret Test',
                  description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
                )
              ],
              // persons: [],
            ),
            application: application,
            format: SeededFormat(
              fragment: SeededFragment(
                string: TransferableString(
                  raw: '''void main () {
 print('hello world');
}''',
                ),
              ),
            ),
          ),
          type: SeedTypeEnum.ASSET,
        ),
      );
      // print('created: ${created.original.reference?.application}');

      /// TODO for when this PR merges to main
      // expect(response.name?.contains('jpeg'), true);
      // expect(response.description?.contains('jpeg'), true);
      expect(created.runtimeType, Asset);
      // print(response);
    });
    test('/assets/create [POST]', () async {
      /// (1) register or get an application first
      final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

      /// (2) get your application
      Application application = (await connectorApi.connect(
        seededConnectorConnection: SeededConnectorConnection(
          application: SeededTrackedApplication(
            name: ApplicationNameEnum.JETBRAINS,
            platform: PlatformEnum.MACOS,
            version: '3.1.0',
          ),
        ),
      ))
          .application;
      // print('application?? ${application}');

      /// (3) call the endpoint --> assetsCreateNewAsset
      Asset created = await assetsApi.assetsCreateNewAsset(
        seed: Seed(
          asset: SeededAsset(
            application: application,
            format: SeededFormat(
              fragment: SeededFragment(
                string: TransferableString(
                  raw: '''void main () {
 print('hello world');
}''',
                ),
              ),
            ),
            discovered: true,
            metadata: SeededAssetMetadata(
              name: 'sample snippet',
              description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
              tags: [
                SeededAssetTag(
                    text: 'dart',
                    mechanism: MechanismEnum.AUTOMATIC,
                    category: TagCategoryEnum.HANDLE)
              ],
              persons: [
                SeededPerson(
                  access: PersonAccess(
                      schema: EmbeddedModelSchema(
                          migration: 1,
                          semantic: EmbeddedModelSchemaSemanticVersionEnum.mAJOR0MINOR0PATCH1)),
                  type: PersonType(
                    basic: PersonBasicType(
                        username: '??',
                        name: 'benjaminbuttons',
                        url: 'www.google.com',
                        email: 'benjaminbuttons@pieces.app'),
                  ),
                )
              ],
              websites: [SeededAssetWebsite(url: 'www.pieces.app', name: 'google!')],
              sensitives: [
                SeededAssetSensitive(
                  text: '333 333333 333333333',
                  category: SensitiveCategoryEnum.ACCESS_KEY,
                  severity: SensitiveSeverityEnum.HIGH,
                  name: 'Secret Test',
                  description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
                )
              ],
              // persons: [],
              mechanism: MechanismEnum.MANUAL,
            ),
          ),
          type: SeedTypeEnum.ASSET,
        ),
      );
      // print('created: ${created.original.reference?.application}');

      /// TODO for when this PR merges to main
      // expect(response.name?.contains('jpeg'), true);
      // expect(response.description?.contains('jpeg'), true);
      expect(created.runtimeType, Asset);
      // print(response);
    });
  });





  test('/assets/create [POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.VS_CODE,
          platform: PlatformEnum.MACOS,
          version: '1.5.8',
        ),
      ),
    ))
        .application;
    // print('application?? ${application}');

    /// (3) call the endpoint --> assetsCreateNewAsset
    Asset created = await assetsApi.assetsCreateNewAsset(
      seed: Seed(
        asset: SeededAsset(
            application: application,
            format: SeededFormat(
              classification: SeededClassification(specific: ClassificationSpecificEnum.c),
              fragment: SeededFragment(
                string: TransferableString(
                  raw: ' new snippet Added via assetsCreateNewAsset ',
                ),
              ),
            )),
        type: SeedTypeEnum.ASSET,
      ),
    );
    // print('created: ${created.original.reference?.application}');

    /// TODO for when this PR merges to main
    // expect(response.name?.contains('jpeg'), true);
    // expect(response.description?.contains('jpeg'), true);
    expect(created.runtimeType, Asset);
    // print(response);
  });
  test('/assets/create [POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.VS_CODE,
          platform: PlatformEnum.MACOS,
          version: '1.5.8',
        ),
      ),
    ))
        .application;
    // print('application?? ${application}');

    /// (3) call the endpoint --> assetsCreateNewAsset
    Asset created = await assetsApi.assetsCreateNewAsset(
      seed: Seed(
        asset: SeededAsset(
            application: application,
            format: SeededFormat(
              fragment: SeededFragment(
                string: TransferableString(
                  raw: ' new snippet Added via assetsCreateNewAsset ',
                ),
              ),
            )),
        type: SeedTypeEnum.ASSET,
      ),
    );
    // print('created: ${created.original.reference?.application}');

    /// TODO for when this PR merges to main
    // expect(response.name?.contains('jpeg'), true);
    // expect(response.description?.contains('jpeg'), true);
    expect(created.runtimeType, Asset);
    // print(response);
  });

}

void executeClosed() {
  print('closed');
}
