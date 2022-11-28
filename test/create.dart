import 'package:connector_openapi/api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';
import 'package:core_openapi/api_client.dart';
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
              metadata: SeededAssetMetadata(
                // name: 'hello',
                // description: 'sample description',
                // websites: [],
                // sensitives: [],
                // persons: [],
                mechanism: MechanismEnum.AUTOMATIC,
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

    /// TODO check our edge cases what if an asset isn't present??
    test('/persons/create [POST]', () async {
      /// (1) get the asset we are going to create a person on.
      String asset = (await assetsApi.assetsSnapshot(transferables: false)).iterable.first.id;

      /// (2) create our person.
      Person created = await personsApi.personsCreateNewPerson(
        seededPerson: SeededPerson(
          /// you must pass in access, but providing a scope is only required for platform users.
          access: PersonAccess(),
          type: PersonType(
            basic: PersonBasicType(
              username: '@mark',
              name: 'mark widman',
              email: 'mark@pieces.app',
              picture:
                  'https://lh3.google.com/u/0/ogw/ADea4I6m0GU1ooKiWRgvDIuDd1uP8yu0cCJuK1AjzMbu=s64-c-mo',
              sourced: ExternallySourcedEnum.TWITTER,
              url: 'www.twitter.com',
            ),
          ),
          asset: asset,
          mechanism: MechanismEnum.MANUAL,
        ),
      );

      /// expect
      /// TODO check all our properties are present.
      /// TODO check our edge cases with error status codes.
      /// TODO get a snapshot of the asset and ensure that our created person is on there!
      /// TODO try and create a UserProfile && a Basic User.
      expect(created.runtimeType, Person);
    });
    test('/person2/create [POST]', () async {
      /// (1) get the asset we are going to create a person on.
      String asset = (await assetsApi.assetsSnapshot(transferables: false)).iterable.first.id;

      /// (2) create our person.
      Person created = await personsApi.personsCreateNewPerson(
        seededPerson: SeededPerson(
          /// you must pass in access, but providing a scope is only required for platform users.
          access: PersonAccess(),
          type: PersonType(
            basic: PersonBasicType(
              username: '@ben',
              name: 'ben versoza',
              email: 'ben@pieces.app',
              picture:
                  'https://lh3.googleusercontent.com/a/ALm5wu3HDvvMtKjI0TZr_Ju9DRyq51O3LI8JkQKZYVQl=s96-c',
              sourced: ExternallySourcedEnum.TWITTER,
              url: 'www.pieces.app',
            ),
          ),
          asset: asset,
          mechanism: MechanismEnum.MANUAL,
        ),
      );

      /// expect
      /// TODO check all our properties are present.
      /// TODO check our edge cases with error status codes.
      /// TODO get a snapshot of the asset and ensure that our created person is on there!
      /// TODO try and create a UserProfile && a Basic User.
      expect(created.runtimeType, Person);
    });
  });
}
