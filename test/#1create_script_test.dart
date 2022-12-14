import 'package:connector_openapi/api.dart' hide Tags;
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';

import 'package:core_openapi/api_client.dart';
import 'package:test/test.dart' hide Tags;

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
  final TagsApi tagsApi = TagsApi(ApiClient(basePath: host));
  final TagApi tagApi = TagApi(ApiClient(basePath: host));
  final AssetApi assetApi = AssetApi(ApiClient(basePath: host));
  final PersonApi personApi = PersonApi(ApiClient(basePath: host));
  final WebsiteApi websiteApi = WebsiteApi(ApiClient(basePath: host));
  final WebsitesApi websitesApi = WebsitesApi(ApiClient(basePath: host));

  ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /asset/{asset} POST  v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

  test('/asset/{asset}', () async {
    /// (1) call /assets endpoint
    Assets assets = await assetsApi.assetsSnapshot(transferables: false);

    ///(2) get the first asset
    Asset firstAsset = assets.iterable.first;

    /// (3) call SpecificAssetsSnapshot
    Asset specificAssetSnapshot = await assetApi.assetSnapshot(firstAsset.id);

    /// (4) optional print
    // print(specificAssetSnapshot);

    /// expect RuntimeType: Asset
    expect(specificAssetSnapshot.runtimeType, Asset);
  });

  /// this is a future instance of assetsApi and
  /// allows for it to be referenced in other tests within this file

  group('Add Custom Group', () {
    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /assets [GET]    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^    /assets/create [POST]     v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

    /// TODO for this test different cases here
    /// images, text, code, different languages, different parameters within the metadata(tags, websites, classifications))
    ///
    test('/assets/create JetBrains [POST]', () async {
      /// (1) register or get an application first
      final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

      /// (2) get your application
      Application application = (await connectorApi.connect(
        seededConnectorConnection: SeededConnectorConnection(
          application: SeededTrackedApplication(
            name: ApplicationNameEnum.JETBRAINS,
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
              available: AvailableFormats(iterable: [
                Classification(
                    generic: ClassificationGenericEnum.CODE,
                    specific: ClassificationSpecificEnum.coffee)
              ]),
              discovered: false,
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
                              picture:
                                  'https://lh3.googleusercontent.com/a/AEdFTp44ple5FjUEoDP4w4InROkHFtE5i4hY3nEnGNd1gw=s288-p-rw-no',
                              username: '??',
                              name: 'benjaminbuttons',
                              url: 'www.google.com',
                              email: 'benjaminbuttons@pieces.app')))
                ],
                websites: [SeededAssetWebsite(url: 'www.pieces.app', name: 'google!')],
                sensitives: [
                  SeededAssetSensitive(
                    text: '333 333333 333333333',
                    category: SensitiveCategoryEnum.CLIENT_ID,
                    severity: SensitiveSeverityEnum.HIGH,
                    name: 'Secret Test ==========================',
                    description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
                  )
                ],
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
    test('/asset/update POST', () async {
      /// (1) call assetsSnapshot
      Assets assetsSnapshot = await assetsApi.assetsSnapshot(transferables: false);

      /// (2) get the first asset
      Asset firstAsset = assetsSnapshot.iterable.first;

      /// (3) give your first asset a relevant name, so that it is reflected within our db
      firstAsset.name = 'testing name update';

      /// (4) call the endpoint /asset/update POST
      Asset assetUpdate = await assetApi.assetUpdate(asset: firstAsset);

      // print('/asset/update POST: ${assetUpdate}');
      /// expect RuntimeType: AssetUpdate
      expect(assetUpdate.runtimeType, Asset);
    });

    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   Asset/Reclassify POST    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
    /// TODO in the future check all different iterations of a language
    /// as well as text -> code and vise versa.
    test('/asset/reclassify POST', () async {
      /// (1) lets get our assets
      Assets assetsSnapshot = await assetsApi.assetsSnapshot(transferables: false);

      /// (2) get the first asset
      Asset asset = assetsSnapshot.iterable.first;

      /// (3) call the endpoint (AssetReclassification)
      Asset assetReclassification = await assetApi.assetReclassify(
          assetReclassification:
              AssetReclassification(ext: ClassificationSpecificEnum.c, asset: asset));

      /// expect RuntimeType: Asset
      expect(assetReclassification.runtimeType, Asset);
    });

    test('/tag/{tag} [GET]', () async {
      /// (1) call tags snapshot
      Tags tags = await tagsApi.tagsSnapshot(transferables: false);

      /// (2) get the first tag
      Tag first = tags.iterable.first;

      /// (3) get the first tags ID
      String tag = first.id;

      /// (4) call the endpoint tagsSpecificTagSnapshot
      Tag snapshot = await tagApi.tagsSpecificTagSnapshot(tag);

      /// (5) expect runtimeType: Tag
      expect(snapshot.runtimeType, Tag);
    });

    /// TODO check all the properties we updated are properly updated.
    test('/person/update [POST]', () async {
      /// (1) call our snapshot to get the first asset, so we can update.
      Persons persons = await personsApi.personsSnapshot();
      if (persons.iterable.isEmpty) {
        throw Exception(
            '/person/update [POST] FAILED, b/c our iterable is empty and cannot truely test our test.');
      }

      /// (2) update our first person locally
      Person updated = persons.iterable.first;

      /// (3) get our old person and toJson it so we can compare at the end.
      Map<String, dynamic> old = updated.toJson();
      if (updated.type.basic != null) {
        updated.type.basic!.email = 'update@pieces.app';
      }

      /// TODO check platform user updates. and so on. ie more update testing

      /// (4) send over our updated person
      updated = await personApi.updatePerson(person: updated);

      /// expect that our old and updated values are different.
      /// TODO add individual checks.
      expect(old != updated.toJson(), true);
    });

    test('/websites/create[GET]', () async {
      /// (1) call assets Snapshot
      Assets assets = await assetsApi.assetsSnapshot(transferables: false);

      /// (2) get the first asset
      Asset first = assets.iterable.first;

      /// (3) call the endpoint websitesCreateNewWebsite  --> creates a new website url that is visible in pfd info view
      Website websitesCreate = await websitesApi.websitesCreateNewWebsite(
          seededWebsite: SeededWebsite(
            asset: first.id,
            url: 'www.pieces.app',
            name: first.name.toString(),
          ));

      /// (4) expect /websites/create [GET] to be of type Website
      expect(websitesCreate.runtimeType, Website);

      /// (5) expect website url to not be empty
      expect(websitesCreate.url.isNotEmpty, true);
    });

    test('/tags/create [POST]', () async {
      /// (1) define your new tags name
      String textTag = 'flutter';

      /// (2) call assets Snapshot
      Assets assetsSnapshot = await assetsApi.assetsSnapshot();

      /// (3) get the first asset from assetsSnapshot
      Asset firstAsset = assetsSnapshot.iterable.first;

      /// (4) call the endpoint --> tagsCreateNewTag --> creates a new string tag
      Tag create = await tagsApi.tagsCreateNewTag(seededTag: SeededTag(text: textTag, asset: firstAsset.id));

      create;

      /// (5) expect tagsCreate to be of type Tag
      expect(create.runtimeType, Tag);

      /// TODO create a tag and check to see that the tag is present
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
              picture: 'https://lh3.google.com/u/0/ogw/ADea4I6m0GU1ooKiWRgvDIuDd1uP8yu0cCJuK1AjzMbu=s64-c-mo',
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

    // test('/assets/search?searchable_tags=string [GET]', () async {
    //   /// (1) define your string query to be searched
    //   String searchableTags = 'dart';
    //
    //   /// (2) call the endpoint --> assets Search
    //   SearchedAssets assetsSearchAssets = await assetsApi.assetsSearchAssets(searchableTags: searchableTags);
    //
    //   /// (3) expect assetsSearchAssets to be of type --> SearchedAssets
    //   expect(assetsSearchAssets.runtimeType, SearchedAssets);
    // });
  });
}

void executeClosed() {
  print('closed');
}
