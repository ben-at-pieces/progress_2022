// Copyright 2020 the Dart project authors.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:runtime_client/particle.dart';

import '../Tab_Peoples_List/peoples_list.dart';
import '../appbar_class.dart';
import '../checkbox_class.dart';
import '../connections/boot.dart';
import '../connections/statistics_singleton.dart';
import 'json_snippets.dart';

/// Demonstrates how to convert a json content to tree, allowing user to
/// modify the content and see how it affects the tree.
class TreeFromJson extends StatefulWidget {
  @override
  _TreeFromJsonState createState() => _TreeFromJsonState();
  late Future<List> assetsSnapshotFuture = Boot().getAssets();

}

class _TreeFromJsonState extends State<TreeFromJson> {
  final TreeController _treeController = TreeController(allNodesExpanded: false);
  final TextEditingController _textController = TextEditingController(text: '''
{
  "User": {
    "name":" ${StatisticsSingleton().statistics?.user}",
    "snippet count": ${StatisticsSingleton().statistics?.snippetsSaved},
    "version": "${StatisticsSingleton().statistics?.version}",
    "platform":" ${StatisticsSingleton().statistics?.platform}"
  },
  "Sample": [
    "json",
    "converter",
    "for",
    "easy",
    "copy",
    "&",
    "paste"
  ]
}
''');

  @override
  Widget build(BuildContext context) {

    var yamlList = StatisticsSingleton().statistics?.yaml;

    // print(yamlList);

    return Scaffold(
      appBar: CustomAppBar(title: 'Format JSON',),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 300,
              child: TextField(
                maxLines: 10000,
                controller: _textController,
                decoration: InputDecoration(border: OutlineInputBorder()),
                style: TextStyle(fontFamily: "courier"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'refresh json treeView',
                  icon: Icon(Icons.refresh,
                    color: Colors.black,),
                  iconSize: 15,
                  onPressed: () => setState(() {}),
                ),
                IconButton(
                  tooltip: 'Grab json from Pieces',
                  icon: Icon(Icons.precision_manufacturing, size: 15,),
                  // tooltip: 'named language',
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('${StatisticsSingleton().statistics?.yaml.first.name}'),
                      content: JSONListWidget(),
                      actions: <Widget>[



                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),




                IconButton(
                  tooltip: 'clear text field',
                  iconSize: 15,
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _textController.clear();
                  },
                ),

              ],
            ),

            SingleChildScrollView(
              child: buildTree(),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds tree or error message out of the entered content.
  Widget buildTree() {
    try {
      var parsedJson = json.decode(_textController.text);
      return TreeView(
        indent: 80,
        nodes: toTreeNodes(parsedJson),
        treeController: _treeController,
      );
    } on FormatException catch (e) {
      return SizedBox(
        height: 350,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListTile(
            title: Text('Grab a JSON snippet from Pieces',


          ),
            subtitle: Text('or Paste json from an external source'),
          ),
        ),
      );
    }
  }

  List<TreeNode> toTreeNodes(dynamic parsedJson) {
    if (parsedJson is Map<String, dynamic>) {
      return parsedJson.keys
          .map((k) => TreeNode(content: Text('$k:'), children: toTreeNodes(parsedJson[k])))
          .toList();
    }
    if (parsedJson is List<dynamic>) {
      return parsedJson
          .asMap()
          .map((i, element) =>
              MapEntry(i, TreeNode(content: Text('[$i]:'), children: toTreeNodes(element))))
          .values
          .toList();
    }
    return [TreeNode(content: Text(parsedJson.toString()))];
  }
}
