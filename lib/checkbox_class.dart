import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   MyApp({super.key});

  static  String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title:  Text(_title)),
        body:  Center(
          child: MyCheckBoxWidgget(),
        ),
      ),
    );
  }
}

class MyCheckBoxWidgget extends StatefulWidget {
   MyCheckBoxWidgget({super.key});

  @override
  State<MyCheckBoxWidgget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyCheckBoxWidgget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
       Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.greenAccent;
      }
      return Colors.black;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;


        });
      },
    );
  }
}
