// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../../connections/statistics_singleton.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FAB',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FloatingCopyButton(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class FloatingCopyButton extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<FloatingCopyButton> {
//   int? index = StatisticsSingleton().statistics?.python.length;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       trailing: IconButton(
//         tooltip: 'copy',
//         splashRadius: 2,
//         icon: Icon(
//           Icons.copy,
//           color: Colors.black,
//           size: 20,
//         ),
//         onPressed: () async {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 'Copied to Clipboard',
//               ),
//               duration: Duration(
//                   days: 0,
//                   hours: 0,
//                   minutes: 0,
//                   seconds: 1,
//                   milliseconds: 30,
//                   microseconds: 20),
//             ),
//           );
//           ClipboardData data = ClipboardData(
//               text:
//               '${StatisticsSingleton().statistics?.python.elementAt(index!).original.reference?.fragment?.string?.raw}');
//           await Clipboard.setData(data);
//         },
//       ),
//     );
//   }
// }
