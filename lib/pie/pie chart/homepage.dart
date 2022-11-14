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
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';

import '../languages/batch_file.dart';
import 'boot.dart';
import 'colors.dart';
import 'dataMap.dart';

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
BatchFileSnips launch = BatchFileSnips(api: api);

class HomePagePie extends StatelessWidget {
  const HomePagePie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// add a piece row
        Container(
          color: Colors.white,
          height: 50,

          // child: ,
        ),

        /// pie chart
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 180,
            width: 450,
            color: Colors.white,
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
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 30,
              chartRadius: math.min(MediaQuery.of(context).size.width / 2.5, 120),
              colorList: colorList,
              chartType: ChartType.ring,
              centerText: true ? '$length TOTAL' : null,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     SizedBox(
                  //       width: 220,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(3.0),
                  //         child: ExpandableMenu(
                  //           width: 40.0,
                  //           height: 40.0,
                  //           backgroundColor: Colors.black54,
                  //           iconColor: Colors.white,
                  //           itemContainerColor: Colors.white,
                  //           items: [
                  //             ParticleIconButton(
                  //               micro: true,
                  //               color: Colors.black,
                  //               icon: Icons.local_offer_outlined,
                  //               onPressed: () {},
                  //             ),
                  //
                  //             /// Add a Related Link
                  //             ParticleIconButton(
                  //               tooltip: 'quick link',
                  //               micro: true,
                  //               color: Colors.black,
                  //               icon: Icons.link_outlined,
                  //               onPressed: () {
                  //                 showDialog(
                  //                   context: context,
                  //                   builder: (ctx) => AlertDialog(
                  //                     title: Row(
                  //                       children: [
                  //                         Padding(
                  //                           padding: const EdgeInsets.only(right: 8.0),
                  //                           child: Icon(
                  //                             Icons.add_link_outlined,
                  //                             color: Colors.green,
                  //                           ),
                  //                         ),
                  //                         Text('Add a Related Link'),
                  //                       ],
                  //                     ),
                  //                     content: Container(
                  //                       color: Colors.white12,
                  //                       child: Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           /// todo add related link logic
                  //                           SizedBox(
                  //                             height: 45,
                  //                             child: TextField(
                  //                               style: ParticleFont.micro(context),
                  //                               autofocus: true,
                  //                               cursorHeight: 10,
                  //                               minLines: 1,
                  //                               maxLines: 1,
                  //                               autocorrect: true,
                  //                               controller: _websiteController,
                  //                               toolbarOptions: ToolbarOptions(
                  //                                 copy: true,
                  //                                 paste: true,
                  //                                 selectAll: true,
                  //                               ),
                  //                               decoration: InputDecoration(
                  //                                 focusColor: Colors.black,
                  //                                 hoverColor: Colors.black,
                  //                                 floatingLabelBehavior:
                  //                                     FloatingLabelBehavior.always,
                  //                                 labelText: 'add your link...',
                  //                                 hintStyle: ParticleFont.micro(context,
                  //                                     customization:
                  //                                         TextStyle(color: Colors.black)),
                  //                                 // suffixIcon: IconButton(
                  //                                 //   iconSize: 12,
                  //                                 //   icon: Icon(
                  //                                 //     Icons.clear,
                  //                                 //     color: Colors.black,
                  //                                 //   ),
                  //                                 //   onPressed: () {
                  //                                 //     _nameController.clear();
                  //                                 //   },
                  //                                 // ),
                  //                                 enabledBorder: UnderlineInputBorder(
                  //                                   borderSide: BorderSide(
                  //                                     color: Colors.black,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //
                  //                           /// Widget showing link description
                  //                           /// this logic takes the users description and adds it to the snippet content
                  //                           /// as raw string data
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 18.0),
                  //                             child: SizedBox(
                  //                               height: 120,
                  //                               child: Padding(
                  //                                 padding: EdgeInsets.all(2.0),
                  //                                 child: TextField(
                  //                                   showCursor: true,
                  //                                   cursorColor: Colors.black,
                  //                                   style: ParticleFont.micro(context),
                  //                                   autofocus: true,
                  //                                   cursorHeight: 10,
                  //                                   minLines: 20,
                  //                                   maxLines: 20,
                  //                                   autocorrect: true,
                  //                                   controller: _controller,
                  //                                   toolbarOptions: ToolbarOptions(
                  //                                     copy: true,
                  //                                     paste: true,
                  //                                     selectAll: true,
                  //                                   ),
                  //                                   decoration: InputDecoration(
                  //                                     focusColor: Colors.black,
                  //                                     hoverColor: Colors.black,
                  //                                     floatingLabelBehavior:
                  //                                         FloatingLabelBehavior.always,
                  //                                     labelText: 'link description...',
                  //                                     hintStyle: ParticleFont.micro(context),
                  //                                     // suffixIcon: IconButton(
                  //                                     //   iconSize: 12,
                  //                                     //   icon: Icon(
                  //                                     //     Icons.clear,
                  //                                     //     color: Colors.black,
                  //                                     //   ),
                  //                                     //   onPressed: () {
                  //                                     //     _controller.clear();
                  //                                     //   },
                  //                                     // ),
                  //                                     enabledBorder: OutlineInputBorder(
                  //                                       borderSide: BorderSide(
                  //                                         color: Colors.black,
                  //                                       ),
                  //                                     ),
                  //                                     border: OutlineInputBorder(
                  //                                       gapPadding: 4,
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //
                  //                           /// Bottom Icons  save/close/copy
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 2.0),
                  //                             child: Row(
                  //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                               crossAxisAlignment: CrossAxisAlignment.start,
                  //                               children: [
                  //                                 /// save button widget
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.all(1.0),
                  //                                   child: ParticleButton(
                  //                                     overlayColor: Colors.greenAccent,
                  //                                     backgroundColor: Colors.black54,
                  //                                     text: 'save',
                  //                                     textColor: Colors.white,
                  //                                     onPressed: () async {
                  //                                       /// function 1
                  //                                       Context connection = await connect();
                  //
                  //                                       /// function 2
                  //
                  //                                       Navigator.of(ctx).pop();
                  //                                       String create = await connectorApi.create(
                  //                                         connection.application.id,
                  //                                         seededConnectorCreation:
                  //                                             SeededConnectorCreation(
                  //                                           asset: SeededConnectorAsset(
                  //                                             metadata: SeededAssetMetadata(
                  //                                               name:
                  //                                                   '${_descriptionController.text}',
                  //                                               mechanism: MechanismEnum.AUTOMATIC,
                  //                                             ),
                  //                                             format: SeededFormat(
                  //                                               websites: [
                  //                                                 SeededWebsite(
                  //                                                   asset: '',
                  //                                                   url:
                  //                                                       '${_websiteController.text}',
                  //                                                   name: '',
                  //                                                 ),
                  //                                               ],
                  //                                               fragment: SeededFragment(
                  //                                                 // metadata: FragmentMetadata(
                  //                                                 // ext: ClassificationSpecificEnum.),
                  //                                                 string: TransferableString(
                  //                                                   raw: "${_controller.text}",
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                       );
                  //
                  //                                       /// function 1
                  //                                       _controller.clear();
                  //
                  //                                       /// function 2
                  //                                       _nameController.clear();
                  //
                  //                                       /// function 3
                  //                                       _descriptionController.clear();
                  //
                  //                                       /// function 4
                  //                                       _websiteController.clear();
                  //
                  //                                       /// function 4
                  //                                       ScaffoldMessenger.of(context).showSnackBar(
                  //                                         SnackBar(
                  //                                           backgroundColor: Colors.white,
                  //                                           content: Row(
                  //                                             crossAxisAlignment:
                  //                                                 CrossAxisAlignment.end,
                  //                                             mainAxisAlignment:
                  //                                                 MainAxisAlignment.end,
                  //                                             children: [
                  //                                               Text.rich(
                  //                                                 textAlign: TextAlign.end,
                  //                                                 TextSpan(
                  //                                                   text: '',
                  //                                                   style: ParticleFont.micro(
                  //                                                       context,
                  //                                                       customization: TextStyle(
                  //                                                           color: Colors.black)),
                  //                                                   children: <InlineSpan>[
                  //                                                     TextSpan(
                  //                                                       text: 'Saved to Pieces!',
                  //                                                       style: ParticleFont.bodyText1(
                  //                                                           context,
                  //                                                           customization:
                  //                                                               TextStyle(
                  //                                                                   color: Colors
                  //                                                                       .green)),
                  //                                                     )
                  //                                                   ],
                  //                                                 ),
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                           duration: Duration(
                  //                                               days: 0,
                  //                                               hours: 0,
                  //                                               minutes: 0,
                  //                                               seconds: 2,
                  //                                               milliseconds: 30,
                  //                                               microseconds: 10),
                  //                                         ),
                  //                                       );
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //
                  //                                 /// close button widget
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.all(1.0),
                  //                                   child: ParticleButton(
                  //                                     overlayColor: Colors.orangeAccent,
                  //                                     backgroundColor: Colors.black54,
                  //                                     text: 'close',
                  //                                     textColor: Colors.white,
                  //                                     onPressed: () async {
                  //                                       /// function 1
                  //                                       Navigator.of(ctx).pop();
                  //
                  //                                       /// function 1
                  //                                       _controller.clear();
                  //
                  //                                       /// function 2
                  //                                       _nameController.clear();
                  //
                  //                                       /// function 3
                  //                                       _descriptionController.clear();
                  //
                  //                                       /// function 4
                  //                                       _websiteController.clear();
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //
                  //                                 /// clear button widget
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.all(1.0),
                  //                                   child: ParticleButton(
                  //                                     overlayColor: Colors.redAccent,
                  //                                     backgroundColor: Colors.black54,
                  //                                     text: 'clear',
                  //                                     textColor: Colors.white,
                  //                                     onPressed: () async {
                  //                                       /// function 1
                  //                                       _controller.clear();
                  //
                  //                                       /// function 2
                  //                                       _nameController.clear();
                  //
                  //                                       /// function 3
                  //                                       _descriptionController.clear();
                  //
                  //                                       /// function 4
                  //                                       _websiteController.clear();
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //
                  //                           ///Widget to control the user profile
                  //                           // Text('@ B e n  V e r s o z a ',
                  //                           //     style: TextStyle(
                  //                           //       fontSize: 40,
                  //                           //     )),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 );
                  //               },
                  //             ),
                  //
                  //             ParticleIconButton(
                  //               tooltip: 'quick add',
                  //               micro: true,
                  //               color: Colors.black,
                  //               icon: Icons.add,
                  //               onPressed: () async {
                  //                 showDialog(
                  //                   context: context,
                  //                   builder: (ctx) => AlertDialog(
                  //                     title: Row(
                  //                       children: [
                  //                         Padding(
                  //                           padding: const EdgeInsets.only(right: 8.0),
                  //                           child: Icon(
                  //                             Icons.add_box,
                  //                             color: Colors.green,
                  //                           ),
                  //                         ),
                  //                         Text('Add a Snippet'),
                  //                       ],
                  //                     ),
                  //                     content: Container(
                  //                       color: Colors.white12,
                  //                       child: Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           /// Widget showing paste text field
                  //                           /// this is a quick view of adding a snippet
                  //                           /// TODO add advanced save option
                  //                           SizedBox(
                  //                             height: 120,
                  //                             child: Padding(
                  //                               padding: EdgeInsets.only(top: 2.0),
                  //                               child: TextField(
                  //                                 showCursor: true,
                  //                                 cursorColor: Colors.black,
                  //                                 style: ParticleFont.micro(context),
                  //                                 autofocus: true,
                  //                                 cursorHeight: 10,
                  //                                 minLines: 20,
                  //                                 maxLines: 20,
                  //                                 autocorrect: true,
                  //                                 controller: _controller,
                  //                                 toolbarOptions: ToolbarOptions(
                  //                                   copy: true,
                  //                                   paste: true,
                  //                                   selectAll: true,
                  //                                 ),
                  //                                 decoration: InputDecoration(
                  //                                   focusColor: Colors.black,
                  //                                   hoverColor: Colors.black,
                  //                                   floatingLabelBehavior:
                  //                                       FloatingLabelBehavior.always,
                  //                                   labelText: 'paste some code...',
                  //                                   hintStyle: ParticleFont.micro(context),
                  //                                   // suffixIcon: IconButton(
                  //                                   //   iconSize: 12,
                  //                                   //   icon: Icon(
                  //                                   //     Icons.clear,
                  //                                   //     color: Colors.black,
                  //                                   //   ),
                  //                                   //   onPressed: () {
                  //                                   //     _controller.clear();
                  //                                   //   },
                  //                                   // ),
                  //                                   enabledBorder: OutlineInputBorder(
                  //                                     borderSide: BorderSide(
                  //                                       color: Colors.black,
                  //                                     ),
                  //                                   ),
                  //                                   border: OutlineInputBorder(
                  //                                     gapPadding: 4,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //
                  //                           /// Widget showing add a name text field
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(bottom: 8.0),
                  //                             child: SizedBox(
                  //                               height: 40,
                  //                               child: TextField(
                  //                                 style: ParticleFont.micro(context),
                  //                                 autofocus: false,
                  //                                 cursorHeight: 10,
                  //                                 minLines: 1,
                  //                                 maxLines: 1,
                  //                                 autocorrect: true,
                  //                                 controller: _nameController,
                  //                                 toolbarOptions: ToolbarOptions(
                  //                                   copy: true,
                  //                                   paste: true,
                  //                                   selectAll: true,
                  //                                 ),
                  //                                 decoration: InputDecoration(
                  //                                   focusColor: Colors.black,
                  //                                   hoverColor: Colors.black,
                  //                                   floatingLabelBehavior:
                  //                                       FloatingLabelBehavior.always,
                  //                                   labelText: 'add a name...',
                  //                                   hintStyle: ParticleFont.micro(context),
                  //                                   // suffixIcon: IconButton(
                  //                                   //   iconSize: 12,
                  //                                   //   icon: Icon(
                  //                                   //     Icons.clear,
                  //                                   //     color: Colors.black,
                  //                                   //   ),
                  //                                   //   onPressed: () {
                  //                                   //     _nameController.clear();
                  //                                   //   },
                  //                                   // ),
                  //                                   enabledBorder: UnderlineInputBorder(
                  //                                     borderSide: BorderSide(
                  //                                       color: Colors.black,
                  //                                     ),
                  //                                   ),
                  //                                   border: OutlineInputBorder(
                  //                                     gapPadding: 4,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //
                  //                           /// Bottom Icons  save/close/copy
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 2.0),
                  //                             child: Row(
                  //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                               crossAxisAlignment: CrossAxisAlignment.start,
                  //                               children: [
                  //                                 /// save button widget
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.all(1.0),
                  //                                   child: ParticleButton(
                  //                                     overlayColor: Colors.greenAccent,
                  //                                     backgroundColor: Colors.black54,
                  //                                     text: 'save',
                  //                                     textColor: Colors.white,
                  //                                     onPressed: () async {
                  //                                       /// function 1
                  //                                       Context connection = await connect();
                  //
                  //                                       /// function 2
                  //                                       Navigator.of(ctx).pop();
                  //                                       String create = await connectorApi.create(
                  //                                         connection.application.id,
                  //                                         seededConnectorCreation:
                  //                                             SeededConnectorCreation(
                  //                                           asset: SeededConnectorAsset(
                  //                                             metadata: SeededAssetMetadata(
                  //                                               description:
                  //                                                   '${_descriptionController.text}',
                  //                                               name: '${_nameController.text}',
                  //                                               mechanism: MechanismEnum.AUTOMATIC,
                  //                                             ),
                  //                                             format: SeededFormat(
                  //                                               websites: [
                  //                                                 SeededWebsite(
                  //                                                   asset: '',
                  //                                                   url:
                  //                                                       '${_websiteController.text}',
                  //                                                   name: '',
                  //                                                 ),
                  //                                               ],
                  //                                               fragment: SeededFragment(
                  //                                                 // metadata: FragmentMetadata(
                  //                                                 // ext: ClassificationSpecificEnum.),
                  //                                                 string: TransferableString(
                  //                                                   raw: "${_controller.text}",
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                       );
                  //
                  //                                       /// function 1
                  //                                       _controller.clear();
                  //
                  //                                       /// function 2
                  //                                       _nameController.clear();
                  //
                  //                                       /// function 3
                  //                                       _descriptionController.clear();
                  //
                  //                                       /// function 4
                  //                                       _websiteController.clear();
                  //
                  //                                       /// function 4
                  //                                       ScaffoldMessenger.of(context).showSnackBar(
                  //                                         SnackBar(
                  //                                           backgroundColor: Colors.white,
                  //                                           content: Row(
                  //                                             crossAxisAlignment:
                  //                                                 CrossAxisAlignment.end,
                  //                                             mainAxisAlignment:
                  //                                                 MainAxisAlignment.end,
                  //                                             children: [
                  //                                               Text.rich(
                  //                                                 textAlign: TextAlign.end,
                  //                                                 TextSpan(
                  //                                                   text: '',
                  //                                                   style: ParticleFont.micro(
                  //                                                       context,
                  //                                                       customization: TextStyle(
                  //                                                           color: Colors.black)),
                  //                                                   children: <InlineSpan>[
                  //                                                     TextSpan(
                  //                                                       text: 'Saved to Pieces!',
                  //                                                       style: ParticleFont.bodyText1(
                  //                                                           context,
                  //                                                           customization:
                  //                                                               TextStyle(
                  //                                                                   color: Colors
                  //                                                                       .green)),
                  //                                                     )
                  //                                                   ],
                  //                                                 ),
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                           duration: Duration(
                  //                                               days: 0,
                  //                                               hours: 0,
                  //                                               minutes: 0,
                  //                                               seconds: 2,
                  //                                               milliseconds: 30,
                  //                                               microseconds: 10),
                  //                                         ),
                  //                                       );
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //
                  //                                 /// close button widget
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.all(1.0),
                  //                                   child: ParticleButton(
                  //                                     overlayColor: Colors.orangeAccent,
                  //                                     backgroundColor: Colors.black54,
                  //                                     text: 'close',
                  //                                     textColor: Colors.white,
                  //                                     onPressed: () async {
                  //                                       /// function 1
                  //                                       Navigator.of(ctx).pop();
                  //
                  //                                       /// function 1
                  //                                       _controller.clear();
                  //
                  //                                       /// function 2
                  //                                       _nameController.clear();
                  //
                  //                                       /// function 3
                  //                                       _descriptionController.clear();
                  //
                  //                                       /// function 4
                  //                                       _websiteController.clear();
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //
                  //                                 /// clear button widget
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.all(1.0),
                  //                                   child: ParticleButton(
                  //                                     overlayColor: Colors.redAccent,
                  //                                     backgroundColor: Colors.black54,
                  //                                     text: 'clear',
                  //                                     textColor: Colors.white,
                  //                                     onPressed: () async {
                  //                                       /// function 1
                  //                                       _controller.clear();
                  //
                  //                                       /// function 2
                  //                                       _nameController.clear();
                  //
                  //                                       /// function 3
                  //                                       _descriptionController.clear();
                  //
                  //                                       /// function 4
                  //                                       _websiteController.clear();
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //
                  //                           ///Widget to control the user profile
                  //                           // Text('@ B e n  V e r s o z a ',
                  //                           //     style: TextStyle(
                  //                           //       fontSize: 40,
                  //                           //     )),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 );
                  //               },
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )),
      ],
    );
  }
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final TextEditingController _websiteController = TextEditingController();
final TextEditingController newNameController = TextEditingController();
final TextEditingController _controller = TextEditingController();

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
