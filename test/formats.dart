// ignore_for_file: omit_local_variable_types

import 'dart:convert';

import 'package:core_openapi/api.dart' hide Theme;
import 'package:core_openapi/api_client.dart';
import 'package:test/test.dart' hide Tags;

void main() async {
  final port = '1000';
  final host = 'http://localhost:$port';

  /// init the assets Api (plural)
  AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
  /// init the assets Api (plural)
ActivitiesApi activitiesApi = ActivitiesApi(ApiClient(basePath: host));
ActivityApi activityApi = ActivityApi(ApiClient(basePath: host));




  test('/activity/{activity} [GET]', () async {
    /// (1) call /activities snapshot
    Activities activities = await activitiesApi.activitiesSnapshot();

    /// (2) get the first activity from your activitiesSnapshot
    Activity first = activities.iterable.first;

    /// (3) get the first activity ID -->string
    String activity = first.id;

    /// (4) call the endpoint --> SpecificActivitySnapshot
    Activity activitySnapshot = await activityApi.activitiesSpecificActivitySnapshot(activity);

    print(activitySnapshot.application.version);
    print(activitySnapshot.application.platform);
    print(activitySnapshot);
  });








  test('/assets [GET]', () async {
    /// (1) get the formats of all of your assets (returns a list)
    Assets assets = await assetsApi.assetsSnapshot(transferables: true);

   List <Asset> assetIterable = assets.iterable;

   print(assetIterable);

    print(assets.iterable.length);
    /// (2) Expect Statement
    // expect(formats.runtimeType, Formats);
  });







  // test('/formats [GET]', () async {
  //   /// (1) get the formats of all of your assets (returns a list)
  //   Formats formats = await formatsApi.formatsSnapshot(transferables: true);
  //
  //   print(formats.iterable.length);
  //   /// (2) Expect Statement
  //   // expect(formats.runtimeType, Formats);
  // });
  //
  // test('/formats/{format} [GET]', () async {
  //   /// (1) get the formats of all of your assets (returns a list)
  //   Formats formats = await formatsApi.formatsSnapshot(transferables: false);
  //
  //   /// (2) get the first format from your formats list 'formatSnapshot
  //   Format first = formats.iterable.first;
  //
  //   /// (3) get the first format ID
  //   String format = first.id;
  //
  //   /// (4) use your first format ID in junction with formatsSpecificSnapshot
  //   Format snapshot = await formatsApi.formatsSpecificFormatSnapshot(format);
  //
  //   /// (5) Expect formatsSpecific Snapshot to be of type Format
  //   expect(snapshot.runtimeType, Format);
  // });
  //
  // /// format (Singular format) =====================================================================
  //
  // test('/format/reclassify', () async {
  //   /// (1) get the formats of all of your assets (returns a list)
  //   Formats formats = await formatsApi.formatsSnapshot(transferables: false);
  //
  //   /// (2) get the first format from your formats list 'formatSnapshot
  //   Format first = formats.iterable.first;
  //
  //   /// (3) get the first format ID
  //   String format = first.id;
  //
  //   /// (4) use your first format ID in junction with formatsSpecificSnapshot
  //   Format snapshot = await formatsApi.formatsSpecificFormatSnapshot(format);
  //
  //   print('${snapshot.analysis?.code}');
  //
  //   /// (5) Expect formatsSpecific Snapshot to be of type Format
  //   expect(snapshot.runtimeType, Format);
  // });
  //
  // test('format list', () async {
  //   /// init formats api
  //   Formats formats = await formatsApi.formatsSnapshot(transferables: false);
  //
  //   /// get a list of iterable singular Format
  //   List<Format> formatsSnapshot = formats.iterable;
  //
  //   /// get the first format
  //   Format first = formatsSnapshot.first;
  //
  //   // print(first);
  //
  //   print('formats -> first -> analysis -> code: ${first.analysis?.code}');
  //   print('formats -> first -> classification -> generic: ${first.classification}');
  //   print('formats -> first -> analysis : ${first.analysis}');
  //   print('formats -> first -> analysis --> format: ${first.analysis?.format}');
  //   // d5617d4b-8994-4477-b889-499280e1a311
  // });
}
