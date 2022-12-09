// ignore_for_file: omit_local_variable_types

import 'dart:convert';
import 'dart:io';

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
    print(activitySnapshot.application);
  });
  test('classifications', () async {
    final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
    Assets assets = await assetsApi.assetsSnapshot();

    Map<String, double> origins = {};
    for (Asset asset in assets.iterable) {
      String? origin = asset.original.reference?.application.name.value;
    }
    var origin = String;
    switch (origin) {}
  });

  test('/assets [GET]', () async {
    Stopwatch stopWatch = Stopwatch();
    final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
    Assets assets = await assetsApi.assetsSnapshot(transferables: false);
    for (Asset asset in assets.iterable) {
      String? classification = asset.original.reference?.classification.specific.value;
      String? raw;
      // print(classification);

      if (asset.original.reference?.classification.generic == ClassificationGenericEnum.CODE) {
        raw = asset.original.reference?.fragment?.string?.raw;
        // print('${raw?.length}');
      }
    }
  });
  test('/assets --> stopwatch [milliseconds]', () async {
    Stopwatch s = Stopwatch();
    s.start();
    print(s.isRunning); // true
    final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
    Assets assets = await assetsApi.assetsSnapshot(transferables: false);
    // print(assets);
    s.stop();
    print('assets snapshot: ${s.elapsedMilliseconds} milliseconds (Transferrables false)');
    s.reset();
  });
  test('/assets transferables true --> stopwatch [milliseconds]', () async {
    Stopwatch s = Stopwatch();
    s.start();
    print(s.isRunning); // true
    final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
    Assets assets = await assetsApi.assetsSnapshot(transferables: true);
    // print(assets);
    s.stop();
    print('assets snapshot: ${s.elapsedMilliseconds} milliseconds (Transferrables true)');
    s.reset();
  });



  test('/activities --> Discovered Count', () async {
    Stopwatch s = Stopwatch();
    s.start();

    ActivitiesApi activitiesApi = ActivitiesApi(ApiClient(basePath: host));
    Activities activities = await activitiesApi.activitiesSnapshot(transferables: false);

    Iterable<Activity> setOfActivities = [];
    List<Activity> activity = activities.iterable;

    // print(activity);

    Iterable<Activity> act = activity.where((element) => element.asset?.discovered == true);

   print(act.length);


    s.stop();
    print('activities snapshot: ${s.elapsedMilliseconds} milliseconds');
  });

  test('/assets --> for loop', () async {
    Stopwatch stopWatch = Stopwatch();
    final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
    Assets assets = await assetsApi.assetsSnapshot(transferables: false);
    for (Asset asset in assets.iterable) {
      String? classification = asset.original.reference?.classification.specific.value;
      String? raw;



      // print(classification);

      if (asset.original.reference?.classification.specific == ClassificationSpecificEnum.bat) {
        switch(classification) {
          case 'bat': {

            print('BATCHFILE');
          }
          break;
        }
      }
      if (asset.original.reference?.classification.specific == ClassificationSpecificEnum.c) {
        switch(classification) {
          case 'c': {
            print('C');
          }
          break;
        }
      }
      if (asset.original.reference?.classification.specific == ClassificationSpecificEnum.dart) {
        switch(classification) {
          case 'dart': {
            print('DART');
          }
          break;
        }
      }
      if (asset.original.reference?.classification.specific == ClassificationSpecificEnum.pl) {
        switch(classification) {
          case 'pl': {
            print('PERL');
          }
          break;
        }
      }

    }
  });
}



