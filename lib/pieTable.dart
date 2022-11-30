// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'dart:core';

import 'package:connector_openapi/api/connector_api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api/asset_api.dart';
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api/user_api.dart';
import 'package:core_openapi/api/users_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';

import 'chart data/boot.dart';
import 'chart data/originPieChart.dart';
import 'chart data/pieChartWidget.dart';
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
  HomePagePie({Key? key}) : super(key: key);

  get touchedIndex => -1;

  final Iterable<String>? personEmptyCheck =
      StatisticsSingleton().statistics?.persons.where((element) => element.isNotEmpty);

  final Iterable<String>? tagsEmptyCheck =
      StatisticsSingleton().statistics?.tags.where((element) => element.isNotEmpty);

  final Iterable<String>? relatedLinksEmptyCheck =
      StatisticsSingleton().statistics?.relatedLinks.where((element) => element.isNotEmpty);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// add a piece row
        Container(
          color: Colors.transparent,
          height: 20,

          // child: ,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  Text(
                    '${StatisticsSingleton().statistics?.user}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: MyPieChart(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: OriginChart(),
                ),
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 18.0),
        //   child: DataTable(
        //     columns: <DataColumn>[
        //       /// TOP LEFT TITLE
        //       DataColumn(
        //         label: Expanded(
        //           child: Text(
        //             '',
        //           ),
        //         ),
        //       ),
        //
        //       /// FIRST COLUMN TO THE RIGHT OF THE INITIAL COLUMN
        //       DataColumn(
        //         tooltip: 'these are the people who have contributed to your Pieces repo!',
        //         label: Expanded(
        //           child: Text(
        //             'PEOPLE:',
        //             style: TitleTheme.title,
        //           ),
        //         ),
        //       ),
        //       DataColumn(
        //         tooltip: 'these are your unique tags!',
        //         label: Expanded(
        //           child: Text(
        //             'TAGS:',
        //             style: TitleTheme.title,
        //           ),
        //         ),
        //       ),
        //       DataColumn(
        //         tooltip: 'return to the place you saved from!',
        //         label: Expanded(
        //           child: Text(
        //             'RELATED LINKS:',
        //             style: TitleTheme.title,
        //           ),
        //         ),
        //       ),
        //     ],
        //     rows: <DataRow>[
        //       /// TOP 5 TAGS
        //       /// this is the first data row in our table
        //       ///    (   x , y    )
        //       DataRow(
        //         cells: <DataCell>[
        //           DataCell(Text(
        //             '1.',
        //             style: TitleTheme.title,
        //           )),
        //           DataCell(
        //             SizedBox(
        //               width: 120,
        //               child: Text(
        //                 '${personEmptyCheck?.elementAt(0) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 90,
        //               height: 30,
        //               child: Text(
        //                 '${tagsEmptyCheck?.elementAt(0) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 200,
        //               height: 30,
        //               child: Text(
        //                 '${relatedLinksEmptyCheck?.elementAt(0) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //
        //       /// this is the 1st row above the bottom row
        //
        //       /// TOP 4 links
        //       /// this is the first data row in our table
        //       ///    (   x , y    )
        //       DataRow(
        //         cells: <DataCell>[
        //           DataCell(
        //             Text(
        //               '2.',
        //               style: TitleTheme.title,
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 200,
        //               height: 30,
        //               child: Text(
        //                 '${personEmptyCheck?.elementAt(1) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 200,
        //               height: 30,
        //               child: Text(
        //                 '${tagsEmptyCheck?.elementAt(1) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 200,
        //               height: 30,
        //               child: Text(
        //                 '${relatedLinksEmptyCheck?.elementAt(1) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //
        //       /// this is the 3rd Row
        //       DataRow(
        //         cells: <DataCell>[
        //           DataCell(Text(
        //             '3.',
        //             style: TitleTheme.title,
        //           )),
        //           DataCell(
        //             SizedBox(
        //               width: 120,
        //               height: 30,
        //               child: Text(
        //                 '${personEmptyCheck?.elementAt(2) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //           DataCell(
        //             Text(
        //               '${tagsEmptyCheck?.elementAt(2) ?? '0'}',
        //               style: GreyTheme.small,
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 200,
        //               height: 30,
        //               child: Text(
        //                 '${relatedLinksEmptyCheck?.elementAt(2) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //
        //       /// this is the 4rd Row
        //       DataRow(
        //         cells: <DataCell>[
        //           DataCell(Text(
        //             '4.',
        //             style: TitleTheme.title,
        //           )),
        //           DataCell(
        //             SizedBox(
        //               width: 120,
        //               height: 30,
        //               child: Text(
        //                 '${personEmptyCheck?.elementAt(3) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //           DataCell(
        //             Text(
        //               '${tagsEmptyCheck?.elementAt(3) ?? '0'}',
        //               style: GreyTheme.small,
        //             ),
        //           ),
        //           DataCell(
        //             SizedBox(
        //               width: 200,
        //               height: 30,
        //               child: Text(
        //                 '${relatedLinksEmptyCheck?.elementAt(3) ?? '0'}',
        //                 style: GreyTheme.small,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),

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

class GreyTheme {
  static const TextStyle small = TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
}

class TitleTheme {
  static const TextStyle title = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

class CellTheme {
  static const SizedBox cellBox = SizedBox(
    // height: ,
    width: 120,
  );
}
