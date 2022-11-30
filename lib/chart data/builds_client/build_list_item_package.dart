import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildListItemPackage extends StatefulWidget {
  const BuildListItemPackage({
    Key? key,
    required this.ext,
    required this.url,
    required this.size,
    required this.hash,
    required this.updated,
    required this.latest,
    this.verticalDivider = false,
  }) : super(key: key);

  final String ext;
  final String url;
  final String size;
  final String hash;
  final String updated;
  final String latest;
  final bool verticalDivider;

  @override
  State<BuildListItemPackage> createState() => _BuildListItemPackageState();
}

class _BuildListItemPackageState extends State<BuildListItemPackage> {
  bool information = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ParticleSpacing.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    widget.ext,
                    style: ParticleFont.subtitle1(context),
                  ),
                  SizedBox(width: ParticleSpacing.micro),
                  ParticleIconButton(
                    icon: information ? Icons.close : Icons.info,
                    micro: true,
                    tooltip: information ? 'Hide information' : 'Show more information',
                    onPressed: () {
                      setState(() {
                        information = !information;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  ParticleIconButton(
                    icon: Icons.download,
                    tooltip: 'Download package',
                    onPressed: () {
                      launchUrl(Uri.parse(widget.url));
                    },
                  ),
                  if (widget.ext == 'windows-msix') ...[
                    SizedBox(width: ParticleSpacing.micro),
                    getAppinstallerLink(),
                  ],
                ],
              ),
            ],
          ),
          if (information) ...[
            SizedBox(height: ParticleSpacing.micro),
            SelectableText(
              'Size: ${formatBytes(int.parse(widget.size), 2)}',
              style: ParticleFont.caption(
                context,
                customization: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(height: ParticleSpacing.micro),
            SelectableText(
              'Uploaded: ${formatDate(widget.updated)}',
              style: ParticleFont.caption(
                context,
                customization: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(height: ParticleSpacing.micro),
            SelectableText(
              'MD5 Hash: ${widget.hash.toString()}',
              style: ParticleFont.caption(
                context,
                customization: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat("E, dd MMM yyyy HH:mm:ss").format(dateTime);
  }

  ParticleButton getAppinstallerLink() {
    String url = widget.url.contains('pieces_for_x')
        ? 'https://builds.pieces.app/stages/staging/appinstaller/pieces_for_x.appinstaller'
        : 'https://builds.pieces.app/stages/staging/appinstaller/os_server.appinstaller';

    if (widget.latest.contains('production')) {
      url = widget.url.contains('pieces_for_x')
          ? 'https://builds.pieces.app/stages/production/appinstaller/pieces_for_x.appinstaller'
          : 'https://builds.pieces.app/stages/production/appinstaller/os_server.appinstaller';
    }

    return ParticleButton(
      text: "appinstaller",
      onPressed: () => launchUrl(Uri.parse(url)),
    );
  }
}
