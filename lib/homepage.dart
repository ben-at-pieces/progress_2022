// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:core';
import 'dart:math' as math;

import 'package:connector_openapi/api/connector_api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api/asset_api.dart';
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api/user_api.dart';
import 'package:core_openapi/api/users_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'chart data/boot.dart';
import 'chart data/colors.dart';
import 'chart data/statistics_singleton.dart';

enum LegendShape { circle, rectangle }

String host = 'http://localhost:1000';
AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
AssetApi assetApi = AssetApi(ApiClient(basePath: host));
ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: 'http://localhost:1000'));
UsersApi usersApi = UsersApi(ApiClient(basePath: host));
UserApi userApi = UserApi(ApiClient(basePath: host));
List assetsSnapshot = [];
late Future<List> assetsSnapshotFuture = Boot().getAssets();
ApiClient api = ApiClient(basePath: 'http://localhost:1000');
// var isClassification = StatisticsSingleton().statistics?.classifications.containsKey('') ? 0 : 1;

class HomePagePie extends StatelessWidget {
  const HomePagePie({Key? key}) : super(key: key);

  get touchedIndex => -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// add a piece row
        Container(
          color: Colors.transparent,
          height: 70,

          // child: ,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Related People'),

            /// pie chart
          ],
        ),

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('1: ${StatisticsSingleton().statistics?.persons.elementAt(0) ?? '0'}'),
                Text('2: ${StatisticsSingleton().statistics?.persons.elementAt(1) ?? '0'}'),

                /// pie chart
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Top 5 Tags'),

                  /// pie chart
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('1: ${StatisticsSingleton().statistics?.tags.elementAt(0) ?? '0'}'),
                Text('2: ${StatisticsSingleton().statistics?.tags.elementAt(1) ?? '0'}'),
                Text('3: ${StatisticsSingleton().statistics?.tags.elementAt(2) ?? '0'}'),
                Text('4: ${StatisticsSingleton().statistics?.tags.elementAt(3) ?? '0'}'),

                /// pie chart
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: PieChart(
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesOutside: true,
                  showChartValueBackground: true,
                  decimalPlaces: 0,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                ),
                ringStrokeWidth: 60,
                emptyColor: Colors.grey,
                baseChartColor: Colors.black45,
                centerTextStyle:
                    TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                key: ValueKey(key),
                dataMap: StatisticsSingleton().statistics!.classifications,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 30,
                chartRadius: math.min(MediaQuery.of(context).size.width / 2.5, 80),
                colorList: colorList,
                chartType: ChartType.ring,
                // centerText: StatisticsSingleton().statistics?.classifications.containsKey('') ? '' : '',

                // ${StatisticsSingleton().statistics?.classifications.values.length} TOTAL'
                //     : null,
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.left,
                  showLegends: true,
                  legendShape: true ? BoxShape.circle : BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        /// SPACER ====================
        Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              height: 40.0,
              child: Stack(
                textDirection: TextDirection.ltr,
                children: [
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    bottom: 0.0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      // child: Image.asset(
                      //   'images/piecesLogo.png',
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

final TextEditingController newNameController = TextEditingController();

Future<Context> connect() async {
  try {
    return connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.PIECES_FOR_DEVELOPERS,
          platform: PlatformEnum.MACOS,
          version: '1.5.8',
        ),
      ),
    );
    // print('======== $connect');
  } catch (err) {
    throw Exception('Error occurred when establishing connection. error:$err');
  }
}
