import 'package:flutter/material.dart';
import 'package:gsheets/Dashboard/languages.dart';
import 'package:gsheets/Dashboard/Language_Logic/r_language.dart';
import 'package:gsheets/Dashboard/pageview_builder.dart';
import 'package:gsheets/Dashboard/settingsLanguageBuilder.dart';
import 'package:gsheets/Dashboard/settings_bar.dart';
import 'package:gsheets/Dashboard/sidebar.dart';
import 'package:runtime_common_library/model/asset.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:gsheets/connections/statistics_singleton.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../checkbox_class.dart';
import 'Language_Logic/Swiftl_language.dart';
import 'Language_Logic/batch_language.dart';
import 'Language_Logic/c++_language.dart';
import 'Language_Logic/c_language.dart';
import 'Language_Logic/coffee_language.dart';
import 'Language_Logic/csharp_language.dart';
import 'Language_Logic/css_language.dart';
import 'Language_Logic/dart_language.dart';
import 'Language_Logic/erlang_language.dart';
import 'Language_Logic/go_language.dart';
import 'Language_Logic/haskell_language.dart';
import '../home_language.dart';
import 'Language_Logic/html_language.dart';
import 'Language_Logic/image_language.dart';
import 'Language_Logic/javaScript_language.dart';
import 'Language_Logic/java_language.dart';
import 'Language_Logic/json_language.dart';
import 'Language_Logic/lua_language.dart';
import 'Language_Logic/markdown_language.dart';
import 'Language_Logic/matLab_language.dart';
import 'Language_Logic/obj_c_language.dart';
import 'Language_Logic/perl_language.dart';
import 'Language_Logic/php_language.dart';
import 'Language_Logic/powershell_language.dart';
import 'Language_Logic/python_language.dart';
import 'Language_Logic/ruby_language.dart';
import 'Language_Logic/rust_language.dart';
import 'Language_Logic/scala_language.dart';
import 'Language_Logic/shell_language.dart';
import 'Language_Logic/sql_language.dart';
import 'Language_Logic/tex_language.dart';
import 'Language_Logic/text_language.dart';
import 'Language_Logic/toml_language.dart';
import 'Language_Logic/typescript_language.dart';
import 'Language_Logic/yaml_language.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is
//the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextSpan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VerticalTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VerticalTabBar extends StatefulWidget {
  VerticalTabBar({Key? key}) : super(key: key);

  @override
  State<VerticalTabBar> createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar> {
  int selectedIndex = 0;

  PageController _pageController = PageController();

  Iterable<String>? classifications = StatisticsSingleton().statistics?.classifications.keys;

  int get index => StatisticsSingleton().statistics?.nestedList.length ?? 0;

  @override
  Widget build(BuildContext context) {
    /// ======= THIS IS WHERE WE CN CUSTOMIZE THE LAYOUT OF THE VERTICAL TAB BAR
    return Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          Container(
            color: Colors.black12,
            width: 105,
            child: ListView.separated(
              itemCount: StatisticsSingleton().statistics?.classifications.entries.length ?? 0,
              separatorBuilder: (BuildContext context, int index) {
                return Container(color: Colors.black54, height: 1);
              },
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      _pageController.jumpToPage(index);
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 500),
                          height: (selectedIndex == index) ? 20 : 0,
                          width: 5,
                          color: Colors.black12,
                        ),
                        Expanded(
                          child: Container(
                            color: (selectedIndex == index)
                                ? Colors.blueGrey.withOpacity(0.2)
                                : Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                  child: Text(
                                      '${StatisticsSingleton().statistics?.classifications.entries.elementAt(index).key.toUpperCase()}' ??
                                          ''),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                  child: Text(
                                      '${StatisticsSingleton().statistics?.classifications.entries.elementAt(index).value}' ??
                                          ''),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// Widget List ========================================================
          Expanded(
            child: Container(
              // height: 250,
              ///todo impliment pagebuilder
              child: PageView(
                controller: _pageController,
                children: [
                  // PageLanguageBuilder(subtitle: 'heey',),
                  MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: Scaffold(
                      body: Container(
                        color: Colors.grey,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: 120,
                          ),
                          itemCount: StatisticsSingleton()
                                  .statistics
                                  ?.filteredList
                                  .elementAt(index)
                                  .length ??
                              0,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 300,
                              color: Colors.white38,
                              child: SingleChildScrollView(
                                child: ListTile(
                                  // title: Text(
                                  //     '${StatisticsSingleton().statistics?.nestedList.length ?? ''}'),
                                  // leading: SizedBox(
                                  //     height: 25,
                                  //     width: 25,
                                  //     child: Image.asset('black_GPT.png')),
                                  // subtitle: Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Text(
                                  //     '${StatisticsSingleton().statistics?.asset.elementAt(index).description ?? ''}',
                                  //     style: TextStyle(fontSize: 10),
                                  //   ),
                                  // ),
                                  trailing: MyCheckBoxWidgget(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // BatchLanguageBuilder(
                  //   title: 'Batchfile',
                  //   subtitle: '',
                  //   leading: Image.asset('batchfile-black.jpg'),
                  // ),
                  // CLanguageBuilder(
                  //   title: 'C',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('c.jpg'),
                  // ),
                  // CoffeeLanguageBuilder(
                  //   title: 'Coffeescript',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('coffeescript-black.jpg'),
                  // ),
                  // CPlusLanguageBuilder(
                  //   title: 'C++',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('cpp.jpg'),
                  // ),
                  // CSharpLanguageBuilder(
                  //   title: 'C#',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('c-sharp.jpg'),
                  // ),
                  // CSSLanguageBuilder(
                  //   title: 'CSS',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('css.jpg'),
                  // ),
                  DartLanguageBuilder(
                    title: 'Dart',
                    subtitle: 'sub',
                    leading: Image.asset('dart.jpg'),
                  ),
                  // ErlangLanguageBuilder(
                  //   title: 'Erlang',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('erlang.jpg'),
                  // ),
                  // GoLanguageBuilder(
                  //   title: 'Go',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('go.jpg'),
                  // ),
                  // HaskellLanguageBuilder(
                  //   title: 'Haskell',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('haskell.jpg'),
                  // ),
                  // HTMLLanguageBuilder(
                  //   title: 'HTML',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('html.jpg'),
                  // ),
                  // ImageLanguageBuilder(
                  //   title: 'png/jpg',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('image.jpeg'),
                  // ),
                  // JavaLanguageBuilder(
                  //   title: 'Java',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('java.jpg'),
                  // ),
                  // JavaScriptLanguageBuilder(
                  //   title: 'Javascript',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('javascript.jpg'),
                  // ),
                  // JSONLanguageBuilder(
                  //   title: 'JSON',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('json.jpg'),
                  // ),
                  // LuaLanguageBuilder(
                  //   title: 'Lua',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('lua.jpg'),
                  // ),
                  // MarkdownLanguageBuilder(
                  //   title: 'MarkDown',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('markdown-black.jpg'),
                  // ),
                  // MatLabLanguageBuilder(
                  //   title: 'Matlab',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('matlab.jpg'),
                  // ),
                  // OBJCLanguageBuilder(
                  //   title: 'ObjectiveC',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('objective-c.jpg'),
                  // ),
                  // PerlLanguageBuilder(
                  //   title: 'Perl',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('perl.jpg'),
                  // ),
                  // PHPLanguageBuilder(
                  //   title: 'PHP',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('php.jpg'),
                  // ),
                  // PowershellLanguageBuilder(
                  //   title: 'Powershell',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('powershell.jpg'),
                  // ),
                  // PythonLanguageBuilder(
                  //   title: 'Python',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('python.jpg'),
                  // ),
                  // RLanguageBuilder(
                  //   title: 'R',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('r.jpg'),
                  // ),
                  // RubyLanguageBuilder(
                  //   title: 'Ruby',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('ruby.jpg'),
                  // ),
                  // RustLanguageBuilder(
                  //   title: 'Rust',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('rust-black.jpg'),
                  // ),
                  // ScalaLanguageBuilder(
                  //   title: 'Scala',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('scala.jpg'),
                  // ),
                  // ShellLanguageBuilder(
                  //   title: 'Shell',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('powershell.jpg'),
                  // ),
                  // SQLLanguageBuilder(
                  //   title: 'SQL',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('sql.jpg'),
                  // ),
                  // SwiftLanguageBuilder(
                  //   title: 'Swift',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('swift.jpg'),
                  // ),
                  // TexLanguageBuilder(
                  //   title: 'Tex',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('tex-black.jpg'),
                  // ),
                  // TextLanguageBuilder(
                  //   title: 'Text',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('text.jpg'),
                  // ),
                  // TOMLLanguageBuilder(
                  //   title: 'Toml',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('toml-black.jpg'),
                  // ),
                  // TypeScriptLanguageBuilder(
                  //   title: 'Typescript',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('typescript.jpg'),
                  // ),
                  // YAMLLanguageBuilder(
                  //   title: 'YAML',
                  //   subtitle: 'sub',
                  //   leading: Image.asset('yaml-black.jpg'),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
