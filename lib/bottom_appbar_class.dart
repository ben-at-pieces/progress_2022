import 'package:connector_openapi/api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api/applications_api.dart';
import 'package:core_openapi/api/assets_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Dashboard/faqs.dart';
import 'connections/statistics_singleton.dart';
import 'connections/suggestions.dart';
import 'tabBar_appbar.dart';

class CustomBottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BottomAppBar(
        notchMargin: 5,
        color: Colors.black45,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${StatisticsSingleton().statistics?.classifications} ',
              style: ParticleFont.micro(
                context,
                customization: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
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

final TextEditingController _textFieldController = TextEditingController();

const String port = '1000';
const String host = 'http://localhost:$port';

/// Future instance of Connect to be used in connectorApi Tests ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
Future<Context> connect() async {
  final ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: host));


  final ApplicationsApi applicationsApi = ApplicationsApi(ApiClient(basePath: 'http://localhost:1000'));
  Applications snapshot = await applicationsApi.applicationsSnapshot();

  List<Application> applicationsList = snapshot.iterable.toList();

  Application first = applicationsList.first;
  try {
    return connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          capabilities: CapabilitiesEnum.BLENDED,
          schema: first.schema,
          name: first.name,
          platform: first.platform,
          version: first.version,
        ),
      ),
    );
    // print('======== $connect');
  } catch (err) {
    throw Exception('Error occurred when establishing connection. error:$err');
  }
}
