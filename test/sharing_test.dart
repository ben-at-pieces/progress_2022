import 'package:connector_openapi/api.dart' hide Tags;
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';

import 'package:core_openapi/api_client.dart';
import 'package:test/test.dart' hide Tags;

Future<void> main() async {
  final ShareApi shareApi = ShareApi(ApiClient(basePath: 'http://localhost:1000'));
  final SharesApi sharesApi = SharesApi(ApiClient(basePath: 'http://localhost:1000'));
  final UsersApi usersApi = UsersApi(ApiClient(basePath: 'http://localhost:1000'));
  Users users = await usersApi.usersSnapshot();


  // List<SeededUser> userList = users.iterable;
  final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: 'http://localhost:1000'));
  Assets assets = await assetsApi.assetsSnapshot(transferables: false);
  Asset asset = assets.iterable.first;

  test('Share', () async {
    Shares shares = await sharesApi.sharesSnapshot(transferables: false);

    expect(shares.runtimeType, Shares);
  });

  test('Share', () async {
    Shares shares = await sharesApi.sharesCreateNewShare(
        seededShare: SeededShare(
          asset: asset,
          assets: assets,
          access: AccessEnum.PUBLIC,
          name: 'shareable link test',
        ),
        transferables: false);

    print(shares.iterable.length);
  });
}
