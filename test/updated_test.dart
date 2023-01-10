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
  final SensitivesApi sensitivesApi = SensitivesApi(ApiClient(basePath: host));

  ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   Asset/ Reclassification Update POST All Language Ext   v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

  group('Asset/Reclassification POST [all EXT types]', () {
    ///
    ///
    ///
    AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));

    Future<void> testReclassify(ClassificationSpecificEnum ext) async {
      Assets assets = await assetsApi.assetsSnapshot(transferables: false);

      Asset response = await assetApi.assetReclassify(
          assetReclassification: AssetReclassification(
            ext: ext,
            asset: assets.iterable.first,
          ));

      // expect(response.formats.iterable[0].classification.specific.value, ClassificationSpecificEnum);
    }

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    test('Rust ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    test('Scala', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });
    test('TypeScript', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });
  group('Create and Update', () {

  ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /name update [GET]    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
  test('name', () async {
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

  ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   Asset/ Description Update POST    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

  test('description', () async {
    Assets assetsSnapshot = await assetsApi.assetsSnapshot(transferables: false);

    Asset firstAsset = assetsSnapshot.iterable.first;

    firstAsset.description = 'this is a newly added description';

    Asset descriptionUpdate = await assetApi.assetUpdate(asset: firstAsset);

    expect(descriptionUpdate.runtimeType, Asset);
  });

  ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   Asset/ Related Link Update POST    v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^

  test('/assets/{asset}/Website -->add a related link', () async {
    /// websitesCreateNewWebsite
    Assets assets = await assetsApi.assetsSnapshot();

    Asset firstAsset = assets.iterable.first;

    Website newWebsite = await websitesApi.websitesCreateNewWebsite(
      seededWebsite: SeededWebsite(
        asset: firstAsset.id,
        url: 'https://www.google.com/',
        name: 'Google',
      ),
    );

    expect(newWebsite.runtimeType, Website);
  });

  ///^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^   /person/create [POST]   v^v^^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
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

    expect(created.type.basic?.name?.isNotEmpty, true);

    /// TODO check our edge cases with error status codes.
    /// TODO get a snapshot of the asset and ensure that our created person is on there!
    /// TODO try and create a UserProfile && a Basic User.
    expect(created.runtimeType, Person);
  });

  /// Persons Empty Check
  // /persons/{person}/delete [POST]
  test('Caught error from empty persons snapshot', () async {
    // (1) call /persons endpoint
    Persons persons = await personsApi.personsSnapshot();

    // (2) if the iterable persons snapshot is empty we will expect that the iterable person is empty (true)
    if (persons.iterable.isEmpty) {
      expect(persons.iterable.isEmpty, true);
      throw Exception(
        '/persons/{person}/delete [POST] FAILED, b/c our iterable is empty and cannot truly test our test.',
      );
    }
    // (3) delete the first iterable person if the persons snapshot is not empty.
    if (persons.iterable.isNotEmpty) {
      await personsApi.personsDeletePerson(persons.iterable.first.id);
    }
  });

  test('/sensitives/create [POST]', () async {
    /// (1) get the asset we are going to create a sensitive on.
    String asset = (await assetsApi.assetsSnapshot(transferables: false)).iterable.first.id;

    /// (2) create our sensitive.
    Sensitive created = await sensitivesApi.sensitivesCreateNewSensitive(
      seededSensitive: SeededSensitive(
        asset: asset,
        text: 'hello here is some sensitive information',
        category: SensitiveCategoryEnum.API_KEY,
        severity: SensitiveSeverityEnum.HIGH,
        name: 'stripe key',
        description: 'this is the key used for stripe.',
      ),
    );



    List languages = [
      'batchfile',
      'c-sharp',
      'coffeescript',
      'coffeescript',
      'cpp',
      'css',
      'dart',
      'erlang',
      'go',
      'haskell',
      'html',
      'java',
      'Javascript',
      'json',
      'lua',
      'markdown',
      'matlab',
      'objective-c',
      'perl',
      'php',
      'powershell',
      'python',
      'r',
      'ruby',
      'rust',
      'rust',
      'scala',
      'sql',
      'swift',
      'tex',
      'text',
      'toml',
      'typescript',
      'yaml',
      'yaml'
    ];
  });
  });
}
