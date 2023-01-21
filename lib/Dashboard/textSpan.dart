import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:gsheets/connections/statistics_singleton.dart';

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
      home: MyDashBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDashBoard extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDashBoard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GeeksforGeeks'), backgroundColor: Colors.green),
      body: Row(
        children: [
          SizedBox(
            width: 180,
            child: SideNavigationBar(
              footer: SideNavigationBarFooter(label: Text('${StatisticsSingleton().statistics?.platform}')),
              header: SideNavigationBarHeader(
                image: Image.asset('an_instance_of_PFD.jpeg', width: 50, height: 50,),
                title: Text('Pieces OS'),
                subtitle: Text('Connected'),
              ),
              expandable: false,
              selectedIndex: selectedIndex,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Batch',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'C',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'C#',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Coffeescript',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'C++',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'C++',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'CSS',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Dart',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Erlang',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Go',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Haskell',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'HTML',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Java',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'JSON',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Lua',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Markdown',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Matlab',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Objective-C',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'PHP',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Perl',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'PowerShell',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Python',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'R',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Ruby',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Rust',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Scala',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Shell',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'SQL',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Swift',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'TypeScript',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Tex',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'Text',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'TOML',
                ),
                SideNavigationBarItem(
                  icon: Icons.view_carousel_rounded,
                  label: 'YAML',
                ),
              ],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          // Center(
          //   child: Text.rich(TextSpan(text: 'This is textspan ', children: <InlineSpan>[
          //     TextSpan(
          //       text: 'Widget in flutter',
          //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //     )
          //   ])),
          // ),
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
