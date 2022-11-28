import 'package:core_openapi/api.dart';

import '../bar chart/api.dart';

Future<Statistics> getStats() async {
  Assets assets = await PiecesApi.assetsApi.assetsSnapshot();
  ReturnedUserProfile user = await PiecesApi.userApi.userSnapshot();

  List<Asset> assetList = assets.iterable;

  Iterable<Asset> jetBrainsSaved = assetList.where((element) =>
      element.original.reference?.application.name.value == ApplicationNameEnum.JETBRAINS.value);
  double jetBrainsDub = jetBrainsSaved.length.toDouble();

  ///
  Iterable<Asset> chromeSaved = assetList.where((element) =>
      element.original.reference?.application.name.value ==
      ApplicationNameEnum.gOOGLECHROMEEXTENSIONMV3.value);
  double chromeDub = chromeSaved.length.toDouble();

  ///
  Iterable<Asset> vSCodeSaved = assetList.where((element) =>
      element.original.reference?.application.name.value == ApplicationNameEnum.VS_CODE.value);
  double vsCodeDub = vSCodeSaved.length.toDouble();

  ///
  Iterable<Asset> safari3Saved = assetList.where((element) =>
      element.original.reference?.application.name.value ==
      ApplicationNameEnum.sAFARIEXTENSIONMV3.value);
  double safariDub = safari3Saved.length.toDouble();

  ///
  Iterable<Asset> fireFox3Saved = assetList.where((element) =>
      element.original.reference?.application.name.value ==
      ApplicationNameEnum.fIREFOXADDONMV3.value);
  double fireFoxDub = fireFox3Saved.length.toDouble();

  ///
  Iterable<Asset> pfdSaved = assetList.where((element) =>
      element.original.reference?.application.name.value ==
      ApplicationNameEnum.PIECES_FOR_DEVELOPERS.value);
  double pfdDub = pfdSaved.length.toDouble();

  ///
  Iterable<Asset> osServerSaved = assetList.where((element) =>
      element.original.reference?.application.name.value == ApplicationNameEnum.OS_SERVER.value);
  double osServerDub = osServerSaved.length.toDouble();

  ///
  Iterable<Asset> piecesCLISaved = assetList.where((element) =>
      element.original.reference?.application.name.value ==
      ApplicationNameEnum.PIECES_FOR_DEVELOPERS_CLI.value);
  double cliDub = piecesCLISaved.length.toDouble();

  double snippetsSaved = 0;
  double shareableLinks = 0;
  double updatedSnippets = 0;
  double currentMonth = DateTime.now().month.toDouble();
  double totalWordsSaved = 0;
  Map<String, double> tagMap = {};
  Map<String, double> personMap = {};
  List<String> relatedLinks = [];
  double timeTaken = 0;

  /// classifications map (String, double)

  Map<String, double> classifications = {};
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

    /// JETBRAINS
    List<String?> jetBrainsSaved = [];
    for (Asset jetBrain in assets.iterable ?? []) {
      if (asset.original.reference?.application != null &&
          asset.original.reference?.application.name.value == ApplicationNameEnum.JETBRAINS.value) {
        jetBrainsSaved.add(jetBrain.original.reference?.application.name.value);
      } else if (jetBrainsSaved.isEmpty) {
        jetBrainsSaved.add('1');
      }
    }

    /// Related Links
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
  List<String> origins = [];
  String jetbrains = 'JetBrains';
  String vscode = 'VS_CODE';

  String firefox = 'FIREFOX_ADDON';
  String safari_ = 'SAFARI_EXTENSION';
  String pfd = 'PIECES_FOR_DEVELOPERS';
  String pfdCli = 'CLI';
  String osServer_ = 'OS_SERVER';
  String chrome_ = 'CHROME_EXTENSION';

  origins.add(vscode);
  origins.add(jetbrains);
  origins.add(firefox);
  origins.add(safari_);
  origins.add(pfd);
  origins.add(pfdCli);
  origins.add(osServer_);
  origins.add(chrome_);
  print(origins);

  List<double> originDubs = [];
  originDubs.add(vsCodeDub);
  originDubs.add(jetBrainsDub);
  originDubs.add(fireFoxDub);
  originDubs.add(safariDub);
  originDubs.add(pfdDub);
  originDubs.add(cliDub);
  originDubs.add(osServerDub);
  originDubs.add(chromeDub);
  print(originDubs);
  Statistics statistics = Statistics(
    jetBrains: jetBrainsSaved,
    pfd: pfdSaved,
    vsCode: vSCodeSaved,
    chrome: chromeSaved,
    classifications: classifications,
    snippetsSaved: snippetsSaved,
    shareableLinks: shareableLinks,
    updatedSnippets: updatedSnippets,
    timeTaken: timeTaken,
    tags: tags,
    persons: persons,
    relatedLinks: relatedLinks,
    user: user.user?.name ?? user.user?.email ?? '',
    jetBrainsDub: jetBrainsDub,
    vsCodeDub: vsCodeDub,
    fireFoxDub: fireFoxDub,
    safariDub: safariDub,
    cliDub: cliDub,
    chromeDub: chromeDub,
    pfdDub: pfdDub,
    osServerDub: osServerDub,
    origins: {
      origins.elementAt(0) ?? '': originDubs.elementAt(0),
      origins.elementAt(1) ?? '': originDubs.elementAt(1),
      origins.elementAt(2) ?? '': originDubs.elementAt(2),
      origins.elementAt(3) ?? '': originDubs.elementAt(3),
      origins.elementAt(4) ?? '': originDubs.elementAt(4),
      origins.elementAt(5) ?? '': originDubs.elementAt(5),
      origins.elementAt(6) ?? '': originDubs.elementAt(6),
      origins.elementAt(7) ?? '': originDubs.elementAt(7),
    },
  );
  return statistics;
}

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
  final double jetBrainsDub;
  final double vsCodeDub;
  final double fireFoxDub;
  final double safariDub;
  final double cliDub;
  final double chromeDub;
  final double pfdDub;
  final double osServerDub;

  /// TODO these will be our assets according to origin
  final Iterable<Asset> jetBrains;
  final Iterable<Asset> vsCode;
  final Iterable<Asset> pfd;
  final Iterable<Asset> chrome;
  final String user;

  Statistics({
    required this.classifications,
    required this.snippetsSaved,
    required this.shareableLinks,
    required this.updatedSnippets,
    required this.timeTaken,
    required this.tags,
    required this.persons,
    required this.relatedLinks,
    required this.user,
    required this.jetBrains,
    required this.vsCode,
    required this.pfd,
    required this.chrome,
    required this.jetBrainsDub,
    required this.vsCodeDub,
    required this.fireFoxDub,
    required this.safariDub,
    required this.cliDub,
    required this.chromeDub,
    required this.pfdDub,
    required this.osServerDub,
    required this.origins,
  });
}
