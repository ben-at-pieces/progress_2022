import 'package:builds_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:runtime_client/utils.dart';

import 'build_list_item_package.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.builds,
    required this.stage,
  }) : super(key: key);

  final Builds builds;
  final String stage;

  @override
  Widget build(BuildContext context) {
    List<BuildListItemPackage> packageList = [];

    for (MapEntry package in builds.packages!.toJson().entries) {
      packageList.add(
        BuildListItemPackage(
          ext: package.key.toString(),
          url: package.value['url'].toString(),
          size: package.value['size'].toString(),
          hash: package.value['hash'].toString(),
          updated: package.value['updated'].toString(),
          latest: package.value['latest'].toString(),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(ParticleSpacing.standard),
      margin: EdgeInsets.all(ParticleSpacing.small),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: ParticleRounding.standard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectableText(
                builds.item ?? "",
                style: ParticleFont.headline6(context),
              ),
              ParticlePill(
                text: 'Build ${builds.number}',
                micro: true,
                theme: ParticleWidgetThemeEnum.monochromatic,
              ),
            ],
          ),
          SizedBox(height: ParticleSpacing.small),
          SelectableText(
            'Tag: ${builds.tag ?? ''}',
            style: ParticleFont.caption(
              context,
              customization: TextStyle(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(height: ParticleSpacing.standard),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: packageList,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ParticleButton(
                text: 'ALL BUILDS',
                backgroundColor: Colors.transparent,
                textColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamed(context, '/detail/${builds.item}/$stage');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
