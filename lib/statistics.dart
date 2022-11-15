import 'package:core_openapi/api.dart';
import 'package:gsheets/pie/pie%20chart/boot.dart';
import 'package:string_stats/string_stats.dart';

import 'api.dart';

Future<List> assetsSnapshotFuture = Boot().getAssets();
Future<Statistics> getStats() async {
  Assets assets = await PiecesApi.assetsApi.assetsSnapshot();
  int snippetsSaved = 0;
  int shareableLinks = 0;
  int updatedSnippets = 0;
  int currentMonth = DateTime.now().month;
  int totalLinesSaved = 0;

  Map<String, double> classifications = {};
  for (Asset asset in assets.iterable) {
    String? classification = asset.original.reference?.classification.specific.value;
    String? raw;

    if (asset.original.reference?.classification.generic == ClassificationGenericEnum.CODE) {
      raw = asset.original.reference?.fragment?.string?.raw;
    }
    if (raw != null) {
      totalLinesSaved = totalLinesSaved + lineCount(raw);
    }

    /// Snippets saved in a month
    if (asset.created.value.month == currentMonth) {
      snippetsSaved = snippetsSaved + 1;
    }

    /// Snippets modified in a month
    if (asset.updated.value.month == currentMonth && asset.updated.value != asset.created.value) {
      updatedSnippets = updatedSnippets + 1;
    }

    /// Classification  Map
    if (classification != null && !classifications.containsKey(classification)) {
      classifications[classification] = 1;
    } else if (classification != null) {
      classifications[classification] = (classifications[classification]! + 1);
    }

    /// Share links generated
    List<Share>? shares = asset.shares?.iterable;
    for (Share share in shares ?? []) {
      if (share.created.value.month == currentMonth) {
        shareableLinks = shareableLinks + 1;
      }
    }
  }

  print("Map");
  print(classifications);
  print("Snippets Saved");
  print(snippetsSaved);
  print("Shareable Links");
  print(shareableLinks);
  print("Updated Snippets");
  print(updatedSnippets);
  print("Lines Saved");
  print(totalLinesSaved);
  Statistics statistics = Statistics(
      classifications: classifications,
      snippetsSaved: snippetsSaved,
      shareableLinks: shareableLinks,
      updatedSnippets: updatedSnippets,
      totalLinesSaved: totalLinesSaved);
  return statistics;
}

class Statistics {
  final Map<String, double> classifications;
  final int snippetsSaved;
  final int shareableLinks;
  final int updatedSnippets;

  final int totalLinesSaved;
  Statistics({
    required this.classifications,
    required this.snippetsSaved,
    required this.shareableLinks,
    required this.updatedSnippets,
    required this.totalLinesSaved,
  });
}
