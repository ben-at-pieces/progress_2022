import 'package:flutter/material.dart';
import 'package:gsheets/connections/statistics_singleton.dart';
import 'package:runtime_client/particle.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tabBar_appbar.dart';

class OutlinedCardExample extends StatelessWidget {
  final String title;

  const OutlinedCardExample({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: const SizedBox(
        width: 300,
        height: 100,
        child: Center(child: Text('Outlined Card')),
      ),
    );
  }
}
