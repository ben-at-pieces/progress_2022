// ignore_for_file: omit_local_variable_types

import 'dart:core';

import 'package:core_openapi/api/asset_api.dart';
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api_client.dart';

import '../pie/pie chart/home_appbar.dart';

Coffee__Snips launch = Coffee__Snips(api: api);

void main() {
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');
}

class Coffee__Snips {
  late final AssetsApi assetsApi;
  late final AssetApi assetApi;
  late final ApiClient api;

  //====================================================================
  //Step (1) Initialize Api
  Coffee__Snips({required ApiClient api}) {
    assetsApi = AssetsApi(api);
    assetApi = AssetApi(api);
  }

  Future<int> runInt() async {
    //====================================================================
    ///Step (2) snapshot
    Assets assets = await assetsApi.assetsSnapshot(transferables: false);

    List<Asset> assetCount = assets.iterable;

    List<int> assetsStream = [assetCount.length];

    List<Asset> filterBatchFile = assetCount
        .where((element) =>
            element.original.reference?.classification.specific ==
            ClassificationSpecificEnum.coffee)
        .toList();

    int filter = filterBatchFile.length;

    // print(filter);

    return filter;
  }
}

// Assets ordered = assets.iterable.sort()

/// =================================== Add Throw Away Code && Commented out code here =============
// static List<T> castFrom<S, T>(List<S> source) => CastList<S, T>(source);
