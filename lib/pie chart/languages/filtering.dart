// ignore_for_file: omit_local_variable_types, non_constant_identifier_names, avoid_print

import 'dart:core';

import 'package:core_openapi/api/asset_api.dart';
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api_client.dart';

/// Recipe #7: I want to order all of my assets alphabetically

void main() {
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');

  InitialFilter launch = InitialFilter(api: api);
  launch.run();
}

class InitialFilter {
  late final AssetsApi assetsApi;
  late final AssetApi assetApi;
  late final ApiClient api;

  /// Occasionally you will need to pass in properties to the constructor
  /// so that we can use them in your run function.

  //====================================================================
  //Step (1) Initialize Api
  InitialFilter({required ApiClient api}) {
    assetsApi = AssetsApi(api);
    assetApi = AssetApi(api);
  }

  get dubs => null;

  Future<void> run() async {
    //====================================================================
    ///Step (1) snapshot
    Assets assets = await assetsApi.assetsSnapshot();

    // list of iterable asset
    List<Asset> assetCountMain = assets.iterable;
    List<String?> dubs = [];

    /// BatchFile
    List<Asset> filterCode = assetCountMain
        .where((element) =>
            element.original.reference?.classification.generic == ClassificationGenericEnum.CODE)
        .toList();
    double filter_code = filterCode.length.toDouble();
    int filter = filterCode.reversed.length;

    List<Asset> code = filterCode.toList();

    String? code0 = code.elementAt(0).original.reference?.classification.specific.value;
    //
    dubs.add(code0);
    //
    String? code1 = code.elementAt(1).original.reference?.classification.specific.value;
    //
    dubs.add(code1);
    //
    String? code2 = code.elementAt(2).original.reference?.classification.specific.value;
    //
    dubs.add(code2);
    //
    String? code3 = code.elementAt(3).original.reference?.classification.specific.value;
    //
    dubs.add(code3);
    //
    String? code4 = code.elementAt(4).original.reference?.classification.specific.value;
    //
    dubs.add(code4);

    print('$dubs');
    print('done');
    // print('CodeFiles: ${filterCode.toList()}');
    var batch = 'batchFile: $filter_code';

    // int textCount = assetCount
    //     .where((element) => element.original.reference?.classification.specific.value == 'text')
    //     .length;
    // double text_list = textCount.toDouble();
    // print(text_list);
    // if (textCount > 0) {
    //   return dubs.add(text_list);
    // }

    double total = dubs.length.toDouble();

    print(total);
  }
}
