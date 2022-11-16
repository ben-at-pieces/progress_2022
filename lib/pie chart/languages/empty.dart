// ignore_for_file: omit_local_variable_types

import 'dart:core';

import 'package:core_openapi/api_client.dart';

void main() {
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');
}

// // ignore: camel_case_types
// class empty_State {
//   late final AssetsApi assetsApi;
//   late final AssetApi assetApi;
//   late final ApiClient api;
//
//   //====================================================================
//   //Step (1) Initialize Api
//   empty_State({required ApiClient api}) {
//     assetsApi = AssetsApi(api);
//     assetApi = AssetApi(api);
//   }
class empty_State {
  Future<double> run() async {
    //====================================================================

    double filter = 0.01;

    // print(filter);

    return filter;
  }
}

// Assets ordered = assets.iterable.sort()

/// =================================== Add Throw Away Code && Commented out code here =============
// static List<T> castFrom<S, T>(List<S> source) => CastList<S, T>(source);
