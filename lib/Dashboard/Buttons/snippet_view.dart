import 'package:flutter/material.dart';
import 'package:gsheets/connections/statistics_singleton.dart';
import 'package:runtime_client/particle.dart';

class AlertDialogWidget extends StatefulWidget {
  final String title;

  final String content;

  AlertDialogWidget({
    required this.title,
    required this.content,
  });

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: AlertDialog(
        title: Text(widget.title),
        content: SingleChildScrollView(child: Text(widget.content)),
        actions: <Widget>[
          ParticleButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: ('text'),

          ),
        ],
      ),
    );
  }
}

