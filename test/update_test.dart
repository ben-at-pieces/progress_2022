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


  group('JetBrains Update Group', () {



    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /name update [GET]    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
    test('/asset/update name [POST]', () async {
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

    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /person/update [POST]   v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
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


    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /tags/create [POST]  v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
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
    test('/persons/create2 [POST]', () async {
      /// (1) get the asset we are going to create a person on.
      String asset = (await assetsApi.assetsSnapshot(transferables: false)).iterable.first.id;

      Persons personsSnapshot = await personsApi.personsSnapshot(transferables: false);

      var people = personsSnapshot.iterable;

      print(people.first.type.platform?.name);
      var name = people.first.type.platform?.name;
      var username = people.first.type.platform?.username;
      var email = people.first.type.platform?.email;
      var picture = people.first.type.platform?.picture;
      // Person person = await personApi.personSnapshot(person);
      /// (2) create our person.
      Person created = await personsApi.personsCreateNewPerson(
        seededPerson: SeededPerson(
          /// you must pass in access, but providing a scope is only required for platform users.
          access: PersonAccess(scoped: PersonAccessScopedEnum.VIEWER),
          type: PersonType(
            basic: PersonBasicType(
              username: '$username',
              name: '$name',
              email: '$email',
              picture: '$picture',
              // sourced: ExternallySourcedEnum.,
            ),
          ),
          asset: asset,
          mechanism: MechanismEnum.MANUAL,
        ),
      );
       created;
      /// expect
      /// TODO check all our properties are present.
      /// TODO check our edge cases with error status codes.
      /// TODO get a snapshot of the asset and ensure that our created person is on there!
      /// TODO try and create a UserProfile && a Basic User.
      expect(created.runtimeType, Person);
    });

    ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /person/create [POST]   v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
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
              url: 'https://twitter.com',
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

void executeClosed() {
  print('closed');
}
