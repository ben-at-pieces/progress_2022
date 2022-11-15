import 'package:core_openapi/api.dart';
import 'package:string_stats/string_stats.dart';

import 'api.dart';

Future<Statistics> getStats() async {
  Assets assets = await PiecesApi.assetsApi.assetsSnapshot();
  int snippetsSaved = 0;
  int shareableLinks = 0;
  int updatedSnippets = 0;
  int currentMonth = DateTime.now().month;
  int totalLinesSaved = 0;
  Map<String, int> tagMap = {};
  Map<String, int> personMap = {};
  List<String> relatedLinks = [];

  Map<String, double> classifications = {};
  for (Asset asset in assets.iterable) {
    String? classification = asset.original.reference?.classification.specific.value;
    String? raw;

    if (asset.original.reference?.classification.generic == ClassificationGenericEnum.CODE) {
      raw = asset.original.reference?.fragment?.string?.raw;
    }

    /// Line count
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

    /// Top 5 tags
    for (Tag tag in asset.tags?.iterable ?? []) {
      if (tagMap.containsKey(tag.text)) {
        tagMap[tag.text] = tagMap[tag.text]! + 1;
      } else {
        tagMap[tag.text] = 1;
      }
    }

    /// Top 5 people
    for (Person person in asset.persons?.iterable ?? []) {
      if (person.type.basic?.email != null && personMap.containsKey(person.type.basic?.email)) {
        personMap[person.type.basic?.email ?? ""] = personMap[person.type.basic?.email]! + 1;
      } else if (person.type.basic?.email != null) {
        personMap[person.type.basic?.email ?? ""] = 1;
      }
    }

    /// Related Links
    for (Website website in asset.websites?.iterable ?? []) {
      relatedLinks.add(website.url);
    }
  }

  List<String> tags =
      (Map.fromEntries(tagMap.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)))).keys.toList();
  if (tags.length > 5) {
    tags = tags.take(5).toList();
  }
  List<String> persons =
      (Map.fromEntries(personMap.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)))).keys.toList();

  Statistics statistics = Statistics(
    classifications: classifications,
    snippetsSaved: snippetsSaved,
    shareableLinks: shareableLinks,
    updatedSnippets: updatedSnippets,
    totalLinesSaved: totalLinesSaved,
    tags: tags,
    persons: persons,
    relatedLinks: relatedLinks,
  );
  return statistics;
}

class Statistics {
  final Map<String, double> classifications;
  final int snippetsSaved;
  final int shareableLinks;
  final int updatedSnippets;
  final int totalLinesSaved;
  final List<String> tags;
  final List<String> persons;
  final List<String> relatedLinks;
  Statistics({
    required this.classifications,
    required this.snippetsSaved,
    required this.shareableLinks,
    required this.updatedSnippets,
    required this.totalLinesSaved,
    required this.tags,
    required this.persons,
    required this.relatedLinks,
  });
}
