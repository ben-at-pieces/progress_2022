import 'package:flutter/material.dart';
import 'package:gsheets/Dashboard/languages.dart';
import 'package:gsheets/Dashboard/sidebar.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:gsheets/connections/statistics_singleton.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import 'boiler_language.dart';

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

  @override
  Widget build(BuildContext context) {
    int? classificationCount = StatisticsSingleton().statistics?.classifications.length;
    Iterable<String>? classificationsList = StatisticsSingleton().statistics?.classifications.keys;

    /// ======= THIS IS WHERE WE CN CUSTOMIZE THE LAYOUT OF THE VERTICAL TAB BAR
    return Scaffold(
        body: SafeArea(
          child: Row(
            children: [
            SizedBox(
            width: 150,
            child: ListView.separated(
              itemCount: languages.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
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
                          height: (selectedIndex == index) ? 0 : 0,
                          width: 5,
                          color: Colors.blue,
                        ),
                        Expanded(
                          child: Container(
                            color: (selectedIndex == index)
                                ? Colors.blueGrey.withOpacity(0.2)
                                : Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child: Text('${languages?.elementAt(index)}'),
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
              child: PageView(
                  controller: _pageController,
                  children: [
                    LanguageBuilder(title: 'Batchfile',subtitle: 'sub', leading: Image.asset('batchfile-black.jpg'),),
                    LanguageBuilder(title: 'C',subtitle: 'sub', leading: Image.asset('c.jpg'),),
                    LanguageBuilder(title: 'Coffeescript',subtitle: 'sub', leading: Image.asset('coffeescript-black.jpg'),),
                    LanguageBuilder(title: 'C++',subtitle: 'sub', leading: Image.asset('cpp.jpg'),),
                    LanguageBuilder(title: 'C#',subtitle: 'sub', leading: Image.asset('c-sharp.jpg'),),
                    LanguageBuilder(title: 'CSS',subtitle: 'sub', leading: Image.asset('css.jpg'),),
                    LanguageBuilder(title: 'Dart',subtitle: 'sub', leading: Image.asset('dart.jpg'),),
                    LanguageBuilder(title: 'Erlang',subtitle: 'sub', leading: Image.asset('erlang.jpg'),),
                    LanguageBuilder(title: 'Go',subtitle: 'sub', leading: Image.asset('go.jpg'),),
                    LanguageBuilder(title: 'Haskell',subtitle: 'sub', leading: Image.asset('haskell.jpg'),),
                    LanguageBuilder(title: 'HTML',subtitle: 'sub', leading: Image.asset('html.jpg'),),
                    LanguageBuilder(title: 'Image',subtitle: 'sub', leading: Image.asset('Gallery_icon small.jpeg'),),
                    LanguageBuilder(title: 'Java',subtitle: 'sub', leading: Image.asset('java.jpg'),),
                    LanguageBuilder(title: 'Javascript',subtitle: 'sub', leading: Image.asset('javascript.jpg'),),
                    LanguageBuilder(title: 'JSON',subtitle: 'sub', leading: Image.asset('json.jpg'),),
                    LanguageBuilder(title: 'Lua',subtitle: 'sub', leading: Image.asset('lua.jpg'),),
                    LanguageBuilder(title: 'MarkDown',subtitle: 'sub', leading: Image.asset('markdown-black.jpg'),),
                    LanguageBuilder(title: 'Matlab',subtitle: 'sub', leading: Image.asset('matlab.jpg'),),
                    LanguageBuilder(title: 'ObjectiveC',subtitle: 'sub', leading: Image.asset('objective-c.jpg'),),
                    LanguageBuilder(title: 'Perl',subtitle: 'sub', leading: Image.asset('perl.jpg'),),
                    LanguageBuilder(title: 'PHP',subtitle: 'sub', leading: Image.asset('php.jpg'),),
                    LanguageBuilder(title: 'Powershell',subtitle: 'sub', leading: Image.asset('powershell.jpg'),),
                    LanguageBuilder(title: 'Python',subtitle: 'sub', leading: Image.asset('python.jpg'),),
                    LanguageBuilder(title: 'R',subtitle: 'sub', leading: Image.asset('r.jpg'),),
                    LanguageBuilder(title: 'Ruby',subtitle: 'sub', leading: Image.asset('ruby.jpg'),),
                    LanguageBuilder(title: 'Rust',subtitle: 'sub', leading: Image.asset('rust-black.jpg'),),
                    LanguageBuilder(title: 'Scala',subtitle: 'sub', leading: Image.asset('scala.jpg'),),
                    LanguageBuilder(title: 'Shell',subtitle: 'sub', leading: Image.asset('powershell.jpg'),),
                    LanguageBuilder(title: 'SQL',subtitle: 'sub', leading: Image.asset('sql.jpg'),),
                    LanguageBuilder(title: 'Swift',subtitle: 'sub', leading: Image.asset('swift.jpg'),),
                    LanguageBuilder(title: 'Tex',subtitle: 'sub', leading: Image.asset('tex-black.jpg'),),
                    LanguageBuilder(title: 'Text',subtitle: 'sub', leading: Image.asset('text.jpg'),),
                    LanguageBuilder(title: 'Toml',subtitle: 'sub', leading: Image.asset('toml-black.jpg'),),
                    LanguageBuilder(title: 'Typescript',subtitle: 'sub', leading: Image.asset('typescript.jpg'),),
                    LanguageBuilder(title: 'YAML',subtitle: 'sub', leading: Image.asset('yaml-black.jpg'),),
                    LanguageBuilder(title: 'YAML',subtitle: 'sub', leading: Image.asset('yaml-black.jpg'),

                )],
                ),
              ),
            )
            ],
          ),
        ));
  }
}

























