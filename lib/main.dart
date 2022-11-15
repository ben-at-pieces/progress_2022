// import 'package:connector_openapi/api_client.dart';
// ignore_for_file: omit_local_variable_types, prefer_const_constructors
import 'package:collection/collection.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/tabs/TabAppBar.dart';
import 'package:gsheets/tabs/pie%20chart%20home/dataMap.dart';

void main() async {
  CircularProgressIndicator(
    color: Colors.black54,
    strokeWidth: 10,
  );

  /// changes
  // await create();
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');

  await batch_file_();
  await c_();
  await cPP_();
  await coffee_();
  await cSharp_();
  await cSS_();
  await dartCount();
  await erlang_();
  await go_();
  await haskell_();
  await html_();
  await image_();
  await java_();
  await json_();
  await javascript_();
  await lua_();
  await markdown_();
  await matlab_();
  await objective_c_();
  await perl_();
  await php_();
  await powerShell_();
  await python_();
  await r_();
  await ruby_();
  await rust_();
  await scala_();
  await shell_();
  await sql_();
  await swift_();
  await tex_();
  await text_();
  await toml_();
  await typeScript_();
  await yaml_();
  await empty_();

  dataMap.removeWhere((key, value) => value == 0);

  if (dataMap.length > 1) {
    dataMap.removeWhere((key, value) => value == 0.01);
  }

  if (dataMap.isNotEmpty) {
    double total = dataMap.values.sum;
    print('Total Snippets: $total');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pie Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HomePageAppBar(),
    );
  }
}
