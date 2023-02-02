import 'package:flutter/material.dart';
import 'package:gsheets/connections/statistics_singleton.dart';



class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final Function onPressed;

  CustomIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();


}

class _CustomIconButtonState extends State<CustomIconButton> {
  String? cloudConnect = StatisticsSingleton().statistics?.user;


  bool connected = true;




  @override
  Widget build(BuildContext context) {

    if (cloudConnect != Null) {
       connected = true;
    }
    else if (cloudConnect == Null) {
      connected = false;
    }

    return IconButton(
      iconSize: 14,
      icon: Icon(
        widget.icon,
        color: connected ? Colors.green : Colors.grey,
      ),
      onPressed: () {
        print(cloudConnect);
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(Float());
//
// class Float extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  FloatingActionButton(
//           child: Icon(Icons.question_answer),
//           onPressed: () => showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('FAQs'),
//                 content: SingleChildScrollView(
//                   child: ListBody(
//                     children: [
//                       Text('Q1. What is this app about?'),
//                       Text('A1. This is a demo app that shows a frequently asked questions AlertDialog.'),
//                       Text('Q2. How does it work?'),
//                       Text('A2. It uses a FloatingActionButton to trigger the display of the FAQs AlertDialog.'),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   ElevatedButton(
//                     child: Text('OK'),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//   }
// }
