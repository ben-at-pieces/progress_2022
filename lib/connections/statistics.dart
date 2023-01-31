import 'package:core_openapi/api.dart';
import 'package:gsheets/Dashboard/Language_Logic/empty_state.dart';

import 'api.dart';

Future<Statistics> getStats() async {
  Assets assets = await PiecesApi.assetsApi.assetsSnapshot();




  List<Asset> asset = assets.iterable;


  Iterable<Asset> yaml = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.yaml);

  // if (yaml.isEmpty) {
  //   EmptyLanguageBuilder();
  // }

  Iterable<Asset> batch = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.bat);

  Iterable<Asset> c = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.c);



  Iterable<Asset> cPlus = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.cpp);

  Iterable<Asset> coffee = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.coffee);

  Iterable<Asset> cSharp = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.cs);

  Iterable<Asset> css = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.css);

  Iterable<Asset> dart = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.dart);

  Iterable<Asset> erlang = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.erl);

  Iterable<Asset> go = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.go);
  Iterable<Asset> haskell = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.hs);
  Iterable<Asset> html = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.html);
  Iterable<Asset> java = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.java);
  Iterable<Asset> javascript = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.js);
  Iterable<Asset> json = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.json);
  Iterable<Asset> lua = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.lua);
  Iterable<Asset> markdown = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.md);
  Iterable<Asset> matLab = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.matlab);
  Iterable<Asset> objectiveC = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.m);
  Iterable<Asset> php = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.php);
  Iterable<Asset> perl = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.pl);
  Iterable<Asset> powershell = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.ps1);
  Iterable<Asset> python = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.py);
  Iterable<Asset> r = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.r);
  Iterable<Asset> ruby = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.rb);
  Iterable<Asset> rust = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.rs);
  Iterable<Asset> scala = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.scala);
  Iterable<Asset> shell = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.ps);
  Iterable<Asset> sql = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.sql);
  Iterable<Asset> swift = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.swift);
  Iterable<Asset> typescript = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.ts);
  Iterable<Asset> tex = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.tex);
  Iterable<Asset> text = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.text);
  Iterable<Asset> toml = asset.where((element) =>
      element.original.reference?.classification.specific == ClassificationSpecificEnum.toml);


  Iterable<Asset> image = asset.where((element) =>
      element.original.reference?.classification.generic == ClassificationGenericEnum.IMAGE);

  ReturnedUserProfile user = await PiecesApi.userApi.userSnapshot();
  // ReturnedUserProfile users = await PiecesApi.;



  /// Activities Information (version, platform)
  Activities activities = await PiecesApi.activitiesApi.activitiesSnapshot();
  Activity first = activities.iterable.first;
  String activity = first.id;
  Activity activitySnapshot =
      await PiecesApi.activityApi.activitiesSpecificActivitySnapshot(activity);
  String version = activitySnapshot.application.version;
  String platform = activitySnapshot.application.platform.value;

  double snippetsSaved = 0;
  double shareableLinks = 0;
  double updatedSnippets = 0;
  double currentMonth = DateTime.now().month.toDouble();
  double totalWordsSaved = 0;
  double timeTaken = 0;

  Map<String, double> tagMap = {};

  /// person map
  Map<String, double> personMap = {};

  /// classifications map (String, double)
  Map<String, double> classifications = {};

  List<String> relatedLinks = [];

  // /// Map Classification & Assets
  // Map<String, String> classAssets = {};

  /// origin map (String  :  double)
  Map<String, double> origins = {};
  for (Asset asset in assets.iterable) {
    String? origin = asset.original.reference?.application.name.value;
    String? raw;

    if (origin != null && !origins.containsKey(origin)) {
      origins[origin] = 1;
    } else if (origin != null) {
      origins[origin] = (origins[origin]! + 1);
    }
  }

  for (Asset asset in assets.iterable) {
    String? classification = asset.original.reference?.classification.specific.value;
    String? raw;

    if (asset.original.reference?.classification.generic == ClassificationGenericEnum.CODE) {
      raw = asset.original.reference?.fragment?.string?.raw;
    }

    /// Line count
    if (raw != null) {
      totalWordsSaved = totalWordsSaved + raw.split(' ').length;
    }

    /// Snippets saved in a month
    if (asset.created.value.month == currentMonth) {
      snippetsSaved = snippetsSaved + 1;
    }

    /// Snippets modified in a month
    if (asset.updated.value.month == currentMonth && asset.updated.value != asset.created.value) {
      updatedSnippets = updatedSnippets + 1;
    }
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

    /// Origins
    for (Website website in asset.websites?.iterable ?? []) {
      relatedLinks.add(website.url);
    }
  }

  List<String> tags =
      (Map.fromEntries(tagMap.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value))))
          .keys
          .toList();

  List<String> persons =
      (Map.fromEntries(personMap.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value))))
          .keys
          .toList();

  /// Assuming average wpm is 50, we are calculating the number of seconds for total words
  timeTaken = totalWordsSaved * 1.2;
  if (classifications.isEmpty) {
    classifications[''] = 0;
  }

  Statistics statistics = Statistics(
    activity: activity,
    platform: platform,
    version: version,
    classifications: classifications,
    snippetsSaved: snippetsSaved,
    shareableLinks: shareableLinks,
    updatedSnippets: updatedSnippets,
    timeTaken: timeTaken,
    tags: tags,
    persons: persons,
    relatedLinks: relatedLinks,
    user: user.user?.name ?? user.user?.email ?? '',
    origins: origins,
    yaml: yaml,
    batch: batch,
    image: image,
    c: c,
    cPlus: cPlus,
    cSharp: cSharp,
    raw: '',
    coffee: coffee,
    css: css,
    dart: dart,
    erlang: erlang,
    matLab: matLab,
    objectiveC: objectiveC,
    php: php,
    perl: perl,
    powershell: powershell,
    python: python,
    r: r,
    ruby: ruby,
    rust: rust,
    scala: scala,
    shell: shell,
    sql: sql,
    swift: swift,
    typescript: typescript,
    tex: tex,
    text: text,
    toml: toml,
    go: go,
    haskell: haskell,
    html: html,
    java: java,
    javascript: javascript,
    json: json,
    lua: lua,
    markdown: markdown,
  );
  return statistics;
}

/// Statistics class ================================================================
class Statistics {
  final Map<String, double> classifications;
  final Map<String, double> origins;
  final double snippetsSaved;
  final double shareableLinks;
  final double updatedSnippets;
  final double timeTaken;
  final List<String> tags;
  final List<String> persons;
  final List<String> relatedLinks;
  final String user;
  final String activity;
  final String platform;
  final String version;
  final String raw;

  final Iterable<Asset> yaml;
  final Iterable<Asset> batch;
  final Iterable<Asset> c;
  final Iterable<Asset> coffee;
  final Iterable<Asset> cSharp;
  final Iterable<Asset> css;
  final Iterable<Asset> cPlus;
  final Iterable<Asset> dart;
  final Iterable<Asset> erlang;
  final Iterable<Asset> go;
  final Iterable<Asset> haskell;
  final Iterable<Asset> html;
  final Iterable<Asset> image;
  final Iterable<Asset> java;
  final Iterable<Asset> javascript;
  final Iterable<Asset> json;
  final Iterable<Asset> lua;
  final Iterable<Asset> markdown;
  final Iterable<Asset> matLab;
  final Iterable<Asset> objectiveC;
  final Iterable<Asset> php;
  final Iterable<Asset> perl;
  final Iterable<Asset> powershell;
  final Iterable<Asset> python;
  final Iterable<Asset> r;
  final Iterable<Asset> ruby;
  final Iterable<Asset> rust;
  final Iterable<Asset> scala;
  final Iterable<Asset> shell;
  final Iterable<Asset> sql;
  final Iterable<Asset> swift;
  final Iterable<Asset> typescript;
  final Iterable<Asset> tex;
  final Iterable<Asset> text;
  final Iterable<Asset> toml;

  /// Statistics class constructors ================================================================
  Statistics(
      {
      required this.batch,
      required this.c,
      required this.cPlus,
      required this.coffee,
      required this.css,
      required this.cSharp,
      required this.dart,
      required this.erlang,
      required this.go,
      required this.haskell,
      required this.html,
      required this.image,

      required this.java,
      required this.javascript,
      required this.json,
      required this.lua,
      required this.markdown,
      required this.matLab,
      required this.objectiveC,
      required this.php,
      required this.perl,
      required this.powershell,
      required this.python,
      required this.r,
      required this.ruby,
      required this.rust,
      required this.scala,
      required this.shell,
      required this.sql,
      required this.swift,
      required this.typescript,
      required this.tex,
      required this.text,
      required this.toml,
      required this.yaml,
      required this.origins,
      required this.classifications,
      required this.snippetsSaved,
      required this.shareableLinks,
      required this.updatedSnippets,
      required this.timeTaken,
      required this.tags,
      required this.persons,
      required this.relatedLinks,
      required this.user,
      required this.activity,
      required this.platform,
      required this.version,
      required this.raw});
}
