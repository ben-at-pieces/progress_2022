import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        content: SingleChildScrollView(
          child: Text(widget.content),
        ),
        actions: <Widget>[
          TextButton(
            child: SizedBox(
              height: 20,
              child: Image.asset('chatgptSmall.jpeg'),
            ),
            onPressed: () async {
              String linkUrl = 'https://chat.openai.com/chat';

              linkUrl = linkUrl; //Twitter's URL
              if (await canLaunch(linkUrl)) {
                await launch(
                  linkUrl,
                );
              } else {
                throw 'Could not launch $linkUrl';
              }
            },
          ),
          ParticleButton(
            textColor: Colors.white,
            backgroundColor: Colors.black54,
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: ('close'),
          ),
        ],
      ),
    );
  }
}
