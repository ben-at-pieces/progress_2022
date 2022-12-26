import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/connections/statistics_singleton.dart';
import 'package:runtime_client/particle.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tabBar_appbar.dart';

class CutomBottomAppBar extends StatelessWidget implements PreferredSizeWidget {



  @override
  Widget build(BuildContext context) {
    final TextEditingController _textFieldController = TextEditingController();
    Future<Context> connect() async {
      try {
        return connectorApi.connect(
          seededConnectorConnection: SeededConnectorConnection(
            application: SeededTrackedApplication(
              name: ApplicationNameEnum.ULTRA_EDIT,
              platform: PlatformEnum.MACOS,
              version: '1.5.8',
            ),
          ),
        );
        // print('======== $connect');
      } catch (err) {
        throw Exception('Error occurred when establishing connection. error:$err');
      }
    }
    return SizedBox(
      height: 30,
      child: BottomAppBar(
        notchMargin: 5,
        color: Colors.black54,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${StatisticsSingleton().statistics?.user}',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
            Icon(
              Icons.bolt_sharp,
              color: Colors.white,
            ),
            TextButton(
              child: Text(
                'Powered by Pieces Runtime',
                style: ParticleFont.micro(
                  context,
                  customization: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ),
              onPressed: () async {
                String linkUrl = 'https://www.runtime.dev/';

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
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
