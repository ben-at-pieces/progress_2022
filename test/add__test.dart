import 'package:connector_openapi/api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:test/test.dart';





void main() async
{
  final port = '1000';
  final host = 'http://localhost:$port';
  final AssetApi assetApi = AssetApi(ApiClient(basePath: host));
  final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
  final PersonsApi personsApi = PersonsApi(ApiClient(basePath: host));
  final PersonApi personApi = PersonApi(ApiClient(basePath: host));
  final TagsApi tagsApi = TagsApi(ApiClient(basePath: host));
  Future<void> testReclassify(ClassificationSpecificEnum ext) async {
    Assets assets = await assetsApi.assetsSnapshot(transferables: false);

    Asset response = await assetApi.assetReclassify(
        assetReclassification: AssetReclassification(
          ext: ext,
          asset: assets.iterable.first,
        ));
    // expect(response.formats.iterable[0].classification, ClassificationSpecificEnum);
  }


  group('Asset Create All Origins', () {


  test('/assets/create VSCode[POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.VS_CODE,
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
            mechanism: MechanismEnum.AUTOMATIC,
            // name: 'sample snippet',
            // description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
            tags: [
              SeededAssetTag(
                  text: 'TEST 1, 2, 3',
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
                      name: 'benjamin_buttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app'),
                ),
              )
            ],
            websites: [
              SeededAssetWebsite(
                mechanism: MechanismEnum.RECOMMENDED,
                url: 'www.pieces.app',
                name: 'Pieces for Developers',
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

  group('Asset Reclassify1', () {

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    ///----------------2<-------------Reclassify First Asset to: C++
    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    ///----------------3<-------------Reclassify First Asset to: Batchfile
    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    ///----------------4<-------------Reclassify First Asset to: CoffeeScript
    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------5<-------------Reclassify First Asset to:
    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------6<-------------Reclassify First Asset to: CSS
    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    ///----------------7<-------------Reclassify First Asset to: Dart
    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    ///----------------8<-------------Reclassify First Asset to: Erlang
    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    ///----------------9<-------------Reclassify First Asset to: Go
    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    ///----------------10<-------------Reclassify First Asset to: Groovy
    test('Groovy', () async {
      await testReclassify(ClassificationSpecificEnum.gz);
    });

    ///----------------11<-------------Reclassify First Asset to: Haskell
    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    ///----------------12<-------------Reclassify First Asset to: HTML
    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    ///----------------13<-------------Reclassify First Asset to: Java
    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    ///----------------14<-------------Reclassify First Asset to: Javascript
    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    ///----------------15<-------------Reclassify First Asset to: Lua
    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    ///----------------16<-------------Reclassify First Asset to: Markdown
    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    ///----------------17<-------------Reclassify First Asset to: Matlab
    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    ///----------------18<-------------Reclassify First Asset to: Objective C
    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    ///----------------19<-------------Reclassify First Asset to: Perl
    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    ///----------------20<-------------Reclassify First Asset to: PHP
    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    ///----------------21<-------------Reclassify First Asset to: PowerShell
    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    ///----------------22<-------------Reclassify First Asset to: Python
    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    ///----------------23<-------------Reclassify First Asset to: R
    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    ///----------------23<-------------Reclassify First Asset to: Ruby
    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    ///----------------24<-------------Reclassify First Asset to: Rust
    test('Reclassify First Asset to ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    ///----------------25<-------------Reclassify First Asset to: Scala
    test('Rust', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    ///----------------26<-------------Reclassify First Asset to: Shell
    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    ///----------------27<-------------Reclassify First Asset to: SQL
    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    ///----------------28<-------------Reclassify First Asset to: Swift
    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    ///----------------29<-------------Reclassify First Asset to: Tex
    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    ///----------------30<-------------Reclassify First Asset to: Text
    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });

  test('/assets/create pieces CLI [POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.PIECES_FOR_DEVELOPERS_CLI,
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
            mechanism: MechanismEnum.AUTOMATIC,
            // name: 'sample snippet',
            // description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
            tags: [
              SeededAssetTag(
                  text: 'TEST 1, 2, 3',
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
                      name: 'benjamin_buttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app'),
                ),
              )
            ],
            websites: [
              SeededAssetWebsite(
                mechanism: MechanismEnum.RECOMMENDED,
                url: 'www.pieces.app',
                name: 'Pieces for Developers',
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

  group('Asset Reclassify2', () {

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    ///----------------2<-------------Reclassify First Asset to: C++
    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    ///----------------3<-------------Reclassify First Asset to: Batchfile
    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    ///----------------4<-------------Reclassify First Asset to: CoffeeScript
    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------5<-------------Reclassify First Asset to:
    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------6<-------------Reclassify First Asset to: CSS
    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    ///----------------7<-------------Reclassify First Asset to: Dart
    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    ///----------------8<-------------Reclassify First Asset to: Erlang
    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    ///----------------9<-------------Reclassify First Asset to: Go
    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    ///----------------10<-------------Reclassify First Asset to: Groovy
    test('Groovy', () async {
      await testReclassify(ClassificationSpecificEnum.gz);
    });

    ///----------------11<-------------Reclassify First Asset to: Haskell
    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    ///----------------12<-------------Reclassify First Asset to: HTML
    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    ///----------------13<-------------Reclassify First Asset to: Java
    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    ///----------------14<-------------Reclassify First Asset to: Javascript
    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    ///----------------15<-------------Reclassify First Asset to: Lua
    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    ///----------------16<-------------Reclassify First Asset to: Markdown
    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    ///----------------17<-------------Reclassify First Asset to: Matlab
    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    ///----------------18<-------------Reclassify First Asset to: Objective C
    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    ///----------------19<-------------Reclassify First Asset to: Perl
    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    ///----------------20<-------------Reclassify First Asset to: PHP
    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    ///----------------21<-------------Reclassify First Asset to: PowerShell
    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    ///----------------22<-------------Reclassify First Asset to: Python
    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    ///----------------23<-------------Reclassify First Asset to: R
    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    ///----------------23<-------------Reclassify First Asset to: Ruby
    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    ///----------------24<-------------Reclassify First Asset to: Rust
    test('Reclassify First Asset to ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    ///----------------25<-------------Reclassify First Asset to: Scala
    test('Rust', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    ///----------------26<-------------Reclassify First Asset to: Shell
    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    ///----------------27<-------------Reclassify First Asset to: SQL
    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    ///----------------28<-------------Reclassify First Asset to: Swift
    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    ///----------------29<-------------Reclassify First Asset to: Tex
    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    ///----------------30<-------------Reclassify First Asset to: Text
    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });

  test('/assets/create firefox [POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.fIREFOXADDONMV3,
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
            mechanism: MechanismEnum.AUTOMATIC,
            // name: 'sample snippet',
            // description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
            tags: [
              SeededAssetTag(
                  text: 'TEST 1, 2, 3',
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
                      name: 'benjamin_buttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app'),
                ),
              )
            ],
            websites: [
              SeededAssetWebsite(
                mechanism: MechanismEnum.RECOMMENDED,
                url: 'www.pieces.app',
                name: 'Pieces for Developers',
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

  group('Asset Reclassify3', () {

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    ///----------------2<-------------Reclassify First Asset to: C++
    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    ///----------------3<-------------Reclassify First Asset to: Batchfile
    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    ///----------------4<-------------Reclassify First Asset to: CoffeeScript
    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------5<-------------Reclassify First Asset to:
    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------6<-------------Reclassify First Asset to: CSS
    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    ///----------------7<-------------Reclassify First Asset to: Dart
    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    ///----------------8<-------------Reclassify First Asset to: Erlang
    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    ///----------------9<-------------Reclassify First Asset to: Go
    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    ///----------------10<-------------Reclassify First Asset to: Groovy
    test('Groovy', () async {
      await testReclassify(ClassificationSpecificEnum.gz);
    });

    ///----------------11<-------------Reclassify First Asset to: Haskell
    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    ///----------------12<-------------Reclassify First Asset to: HTML
    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    ///----------------13<-------------Reclassify First Asset to: Java
    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    ///----------------14<-------------Reclassify First Asset to: Javascript
    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    ///----------------15<-------------Reclassify First Asset to: Lua
    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    ///----------------16<-------------Reclassify First Asset to: Markdown
    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    ///----------------17<-------------Reclassify First Asset to: Matlab
    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    ///----------------18<-------------Reclassify First Asset to: Objective C
    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    ///----------------19<-------------Reclassify First Asset to: Perl
    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    ///----------------20<-------------Reclassify First Asset to: PHP
    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    ///----------------21<-------------Reclassify First Asset to: PowerShell
    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    ///----------------22<-------------Reclassify First Asset to: Python
    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    ///----------------23<-------------Reclassify First Asset to: R
    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    ///----------------23<-------------Reclassify First Asset to: Ruby
    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    ///----------------24<-------------Reclassify First Asset to: Rust
    test('Reclassify First Asset to ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    ///----------------25<-------------Reclassify First Asset to: Scala
    test('Rust', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    ///----------------26<-------------Reclassify First Asset to: Shell
    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    ///----------------27<-------------Reclassify First Asset to: SQL
    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    ///----------------28<-------------Reclassify First Asset to: Swift
    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    ///----------------29<-------------Reclassify First Asset to: Tex
    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    ///----------------30<-------------Reclassify First Asset to: Text
    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });

  test('/assets/create safari [POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.sAFARIEXTENSIONMV3,
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
            mechanism: MechanismEnum.AUTOMATIC,
            // name: 'sample snippet',
            // description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
            tags: [
              SeededAssetTag(
                  text: 'TEST 1, 2, 3',
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
                      name: 'benjamin_buttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app'),
                ),
              )
            ],
            websites: [
              SeededAssetWebsite(
                mechanism: MechanismEnum.RECOMMENDED,
                url: 'www.pieces.app',
                name: 'Pieces for Developers',
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

  group('Asset Reclassify4', () {

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    ///----------------2<-------------Reclassify First Asset to: C++
    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    ///----------------3<-------------Reclassify First Asset to: Batchfile
    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    ///----------------4<-------------Reclassify First Asset to: CoffeeScript
    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------5<-------------Reclassify First Asset to:
    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------6<-------------Reclassify First Asset to: CSS
    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    ///----------------7<-------------Reclassify First Asset to: Dart
    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    ///----------------8<-------------Reclassify First Asset to: Erlang
    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    ///----------------9<-------------Reclassify First Asset to: Go
    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    ///----------------10<-------------Reclassify First Asset to: Groovy
    test('Groovy', () async {
      await testReclassify(ClassificationSpecificEnum.gz);
    });

    ///----------------11<-------------Reclassify First Asset to: Haskell
    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    ///----------------12<-------------Reclassify First Asset to: HTML
    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    ///----------------13<-------------Reclassify First Asset to: Java
    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    ///----------------14<-------------Reclassify First Asset to: Javascript
    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    ///----------------15<-------------Reclassify First Asset to: Lua
    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    ///----------------16<-------------Reclassify First Asset to: Markdown
    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    ///----------------17<-------------Reclassify First Asset to: Matlab
    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    ///----------------18<-------------Reclassify First Asset to: Objective C
    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    ///----------------19<-------------Reclassify First Asset to: Perl
    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    ///----------------20<-------------Reclassify First Asset to: PHP
    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    ///----------------21<-------------Reclassify First Asset to: PowerShell
    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    ///----------------22<-------------Reclassify First Asset to: Python
    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    ///----------------23<-------------Reclassify First Asset to: R
    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    ///----------------23<-------------Reclassify First Asset to: Ruby
    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    ///----------------24<-------------Reclassify First Asset to: Rust
    test('Reclassify First Asset to ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    ///----------------25<-------------Reclassify First Asset to: Scala
    test('Rust', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    ///----------------26<-------------Reclassify First Asset to: Shell
    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    ///----------------27<-------------Reclassify First Asset to: SQL
    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    ///----------------28<-------------Reclassify First Asset to: Swift
    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    ///----------------29<-------------Reclassify First Asset to: Tex
    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    ///----------------30<-------------Reclassify First Asset to: Text
    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });

  test('/assets/create pieces os [POST]', () async {
    /// (1) register or get an application first
    final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));

    /// (2) get your application
    Application application = (await connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.OS_SERVER,
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
            mechanism: MechanismEnum.AUTOMATIC,
            // name: 'sample snippet',
            // description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
            tags: [
              SeededAssetTag(
                  text: 'TEST 1, 2, 3',
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
                      name: 'benjamin_buttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app'),
                ),
              )
            ],
            websites: [
              SeededAssetWebsite(
                mechanism: MechanismEnum.RECOMMENDED,
                url: 'www.pieces.app',
                name: 'Pieces for Developers',
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

  group('Asset Reclassify5', () {

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    ///----------------2<-------------Reclassify First Asset to: C++
    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    ///----------------3<-------------Reclassify First Asset to: Batchfile
    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    ///----------------4<-------------Reclassify First Asset to: CoffeeScript
    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------5<-------------Reclassify First Asset to:
    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------6<-------------Reclassify First Asset to: CSS
    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    ///----------------7<-------------Reclassify First Asset to: Dart
    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    ///----------------8<-------------Reclassify First Asset to: Erlang
    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    ///----------------9<-------------Reclassify First Asset to: Go
    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    ///----------------10<-------------Reclassify First Asset to: Groovy
    test('Groovy', () async {
      await testReclassify(ClassificationSpecificEnum.gz);
    });

    ///----------------11<-------------Reclassify First Asset to: Haskell
    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    ///----------------12<-------------Reclassify First Asset to: HTML
    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    ///----------------13<-------------Reclassify First Asset to: Java
    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    ///----------------14<-------------Reclassify First Asset to: Javascript
    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    ///----------------15<-------------Reclassify First Asset to: Lua
    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    ///----------------16<-------------Reclassify First Asset to: Markdown
    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    ///----------------17<-------------Reclassify First Asset to: Matlab
    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    ///----------------18<-------------Reclassify First Asset to: Objective C
    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    ///----------------19<-------------Reclassify First Asset to: Perl
    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    ///----------------20<-------------Reclassify First Asset to: PHP
    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    ///----------------21<-------------Reclassify First Asset to: PowerShell
    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    ///----------------22<-------------Reclassify First Asset to: Python
    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    ///----------------23<-------------Reclassify First Asset to: R
    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    ///----------------23<-------------Reclassify First Asset to: Ruby
    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    ///----------------24<-------------Reclassify First Asset to: Rust
    test('Reclassify First Asset to ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    ///----------------25<-------------Reclassify First Asset to: Scala
    test('Rust', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    ///----------------26<-------------Reclassify First Asset to: Shell
    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    ///----------------27<-------------Reclassify First Asset to: SQL
    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    ///----------------28<-------------Reclassify First Asset to: Swift
    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    ///----------------29<-------------Reclassify First Asset to: Tex
    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    ///----------------30<-------------Reclassify First Asset to: Text
    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });

  test('/assets/create jetBrains [POST]', () async {
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
            mechanism: MechanismEnum.AUTOMATIC,
            // name: 'sample snippet',
            // description: 'testing 1, 2, 3, 4, 5, 6, 7, 8, 9',
            tags: [
              SeededAssetTag(
                  text: 'TEST 1, 2, 3',
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
                      name: 'benjamin_buttons',
                      url: 'www.google.com',
                      email: 'benjaminbuttons@pieces.app'),
                ),
              )
            ],
            websites: [
              SeededAssetWebsite(
                mechanism: MechanismEnum.RECOMMENDED,
                url: 'www.pieces.app',
                name: 'Pieces for Developers',
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

  group('Asset Reclassify6', () {

    test('C ', () async {
      await testReclassify(ClassificationSpecificEnum.c);
    });

    ///----------------2<-------------Reclassify First Asset to: C++
    test('C++ ', () async {
      await testReclassify(ClassificationSpecificEnum.cpp);
    });

    ///----------------3<-------------Reclassify First Asset to: Batchfile
    test('BatchFile', () async {
      await testReclassify(ClassificationSpecificEnum.bat);
    });

    ///----------------4<-------------Reclassify First Asset to: CoffeeScript
    test('Coffee Script ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------5<-------------Reclassify First Asset to:
    test('C # ', () async {
      await testReclassify(ClassificationSpecificEnum.cs);
    });

    ///----------------6<-------------Reclassify First Asset to: CSS
    test('CSS', () async {
      await testReclassify(ClassificationSpecificEnum.css);
    });

    ///----------------7<-------------Reclassify First Asset to: Dart
    test('Dart', () async {
      await testReclassify(ClassificationSpecificEnum.dart);
    });

    ///----------------8<-------------Reclassify First Asset to: Erlang
    test('Erlang', () async {
      await testReclassify(ClassificationSpecificEnum.erl);
    });

    ///----------------9<-------------Reclassify First Asset to: Go
    test('Go', () async {
      await testReclassify(ClassificationSpecificEnum.go);
    });

    ///----------------10<-------------Reclassify First Asset to: Groovy
    test('Groovy', () async {
      await testReclassify(ClassificationSpecificEnum.gz);
    });

    ///----------------11<-------------Reclassify First Asset to: Haskell
    test('Haskell', () async {
      await testReclassify(ClassificationSpecificEnum.hs);
    });

    ///----------------12<-------------Reclassify First Asset to: HTML
    test('HTML', () async {
      await testReclassify(ClassificationSpecificEnum.html);
    });

    ///----------------13<-------------Reclassify First Asset to: Java
    test('Java', () async {
      await testReclassify(ClassificationSpecificEnum.java);
    });

    ///----------------14<-------------Reclassify First Asset to: Javascript
    test('JavaScript', () async {
      await testReclassify(ClassificationSpecificEnum.js);
    });

    ///----------------15<-------------Reclassify First Asset to: Lua
    test('Lua', () async {
      await testReclassify(ClassificationSpecificEnum.lua);
    });

    ///----------------16<-------------Reclassify First Asset to: Markdown
    test('MarkDown', () async {
      await testReclassify(ClassificationSpecificEnum.md);
    });

    ///----------------17<-------------Reclassify First Asset to: Matlab
    test('MatLab', () async {
      await testReclassify(ClassificationSpecificEnum.matlab);
    });

    ///----------------18<-------------Reclassify First Asset to: Objective C
    test('Object C', () async {
      await testReclassify(ClassificationSpecificEnum.m);
    });

    ///----------------19<-------------Reclassify First Asset to: Perl
    test('Perl', () async {
      await testReclassify(ClassificationSpecificEnum.p);
    });

    ///----------------20<-------------Reclassify First Asset to: PHP
    test('PHP', () async {
      await testReclassify(ClassificationSpecificEnum.php);
    });

    ///----------------21<-------------Reclassify First Asset to: PowerShell
    test('PowerShell', () async {
      await testReclassify(ClassificationSpecificEnum.ps);
    });

    ///----------------22<-------------Reclassify First Asset to: Python
    test('Python', () async {
      await testReclassify(ClassificationSpecificEnum.py);
    });

    ///----------------23<-------------Reclassify First Asset to: R
    test('R', () async {
      await testReclassify(ClassificationSpecificEnum.r);
    });

    ///----------------23<-------------Reclassify First Asset to: Ruby
    test('Ruby', () async {
      await testReclassify(ClassificationSpecificEnum.rb);
    });

    ///----------------24<-------------Reclassify First Asset to: Rust
    test('Reclassify First Asset to ', () async {
      await testReclassify(ClassificationSpecificEnum.rs);
    });

    ///----------------25<-------------Reclassify First Asset to: Scala
    test('Rust', () async {
      await testReclassify(ClassificationSpecificEnum.scala);
    });

    ///----------------26<-------------Reclassify First Asset to: Shell
    test('Shell', () async {
      await testReclassify(ClassificationSpecificEnum.sh);
    });

    ///----------------27<-------------Reclassify First Asset to: SQL
    test('SQL', () async {
      await testReclassify(ClassificationSpecificEnum.sql);
    });

    ///----------------28<-------------Reclassify First Asset to: Swift
    test('Swift', () async {
      await testReclassify(ClassificationSpecificEnum.swift);
    });

    ///----------------29<-------------Reclassify First Asset to: Tex
    test('Tex', () async {
      await testReclassify(ClassificationSpecificEnum.tex);
    });

    ///----------------30<-------------Reclassify First Asset to: Text
    test('Text', () async {
      await testReclassify(ClassificationSpecificEnum.text);
    });
  });
  });







  }


