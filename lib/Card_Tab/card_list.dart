import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/page1': (context) => Page1(),
        // '/page2': (context) => Page2(),
        // '/page3': (context) => Page3(),
        // '/page4': (context) => Page4(),
        // '/page5': (context) => Page5(),
        // '/page6': (context) => Page6(),
        // '/page7': (context) => Page7(),
        // '/page8': (context) => Page8(),
        // '/page9': (context) => Page9(),
        // '/page10': (context) => Page10(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page1');
              },
              child: Text('Go to Page 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: Text('Go to Page 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page3');
              },
              child: Text('Go to Page 3'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page4');
              },
              child: Text('Go to Page 4'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page5');
              },
              child: Text('Go to Page 5'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page6');
              },
              child: Text('Go to Page 6'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/page7');
            //   },
            //   child: Text('Go to Page 7'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/page8');
            //   },
            //   child: Text('Go to Page 8'),
            // ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello, thanks chat GPT!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: Text('Go to Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page3');
              },
              child: Text('Go to Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page4');
              },
              child: Text('Go to Page 4'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page5');
              },
              child: Text('Go to Page 5'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page6');
              },
              child: Text('Go to Page 6'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page6 extends StatefulWidget {
  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 6'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page10');
              },
              child: Text('Go to Page 10'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page7 extends StatefulWidget {
  @override
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 7'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
