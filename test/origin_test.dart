import 'package:connector_openapi/api.dart';
import 'package:gsheets/bar%20chart/api.dart';
import 'package:test/test.dart';

void main() {
  test('Assets', () async {
    Assets assets = await PiecesApi.assetsApi.assetsSnapshot();

    List<Asset> assetList = assets.iterable;

    Iterable<Asset> jetBrainsSaved = assetList.where((element) =>
        element.original.reference?.application.name.value == ApplicationNameEnum.JETBRAINS.value);

    Iterable<Asset> chromeSaved = assetList.where((element) =>
        element.original.reference?.application.name.value ==
        ApplicationNameEnum.gOOGLECHROMEEXTENSIONMV3.value);

    Iterable<Asset> vSCodeSaved = assetList.where((element) =>
        element.original.reference?.application.name.value == ApplicationNameEnum.VS_CODE.value);

    Iterable<Asset> safari3Saved = assetList.where((element) =>
        element.original.reference?.application.name.value ==
        ApplicationNameEnum.sAFARIEXTENSIONMV3.value);

    Iterable<Asset> fireFox3Saved = assetList.where((element) =>
        element.original.reference?.application.name.value ==
        ApplicationNameEnum.fIREFOXADDONMV3.value);

    Iterable<Asset> pfdSaved = assetList.where((element) =>
        element.original.reference?.application.name.value ==
        ApplicationNameEnum.PIECES_FOR_DEVELOPERS.value);

    Iterable<Asset> osServerSaved = assetList.where((element) =>
        element.original.reference?.application.name.value == ApplicationNameEnum.OS_SERVER.value);

    Iterable<Asset> piecesCLISaved = assetList.where((element) =>
        element.original.reference?.application.name.value ==
        ApplicationNameEnum.PIECES_FOR_DEVELOPERS_CLI.value);

    List<String> origins = [];
    String jetbrains = 'JetBrains';
    String vscode = 'VS_CODE';
    String firefox = 'FIREFOX_ADDON';
    String safari_ = 'SAFARI_EXTENSION';
    String pfd = 'PIECES_FOR_DEVELOPERS';
    String pfdCli = 'CLI';
    String osServer_ = 'OS_SERVER';
    String chrome_ = 'CHROME_EXTENSION';
    origins.add(jetbrains);
    origins.add(vscode);
    origins.add(firefox);
    origins.add(safari_);
    origins.add(pfd);
    origins.add(pfdCli);
    origins.add(osServer_);
    origins.add(chrome_);
    print(origins);

    List<double> originDubs = [];
    double vsCodeDub = vSCodeSaved.length.toDouble();
    double jetBrainsDub = jetBrainsSaved.length.toDouble();
    double fireFoxDub = fireFox3Saved.length.toDouble();
    double safariDub = safari3Saved.length.toDouble();
    double piecesDub = pfdSaved.length.toDouble();
    double cliDub = piecesCLISaved.length.toDouble();
    double osServerDub = osServerSaved.length.toDouble();
    double chromeDub = chromeSaved.length.toDouble();
    originDubs.add(vsCodeDub);
    originDubs.add(jetBrainsDub);
    originDubs.add(fireFoxDub);
    originDubs.add(safariDub);
    originDubs.add(piecesDub);
    originDubs.add(cliDub);
    originDubs.add(osServerDub);
    originDubs.add(chromeDub);
    print(originDubs);

    // Map<String, double> originMap = {origins, originDubs};
    final originMap = <String, double>{
      origins.elementAt(0): originDubs.elementAt(0),
      origins.elementAt(1): originDubs.elementAt(1),
      origins.elementAt(2): originDubs.elementAt(2),
      origins.elementAt(3): originDubs.elementAt(3),
      origins.elementAt(4): originDubs.elementAt(4),
      origins.elementAt(5): originDubs.elementAt(5),
    };
    print(originMap);

    // int vsCode = vSCodeSaved.length;
    // int jetBrains = jetBrainsSaved.length;
    // int fireFox = fireFox3Saved.length;
    // int safari = safari3Saved.length;
    // int pieces = pfdSaved.length;
    // int cli = piecesCLISaved.length;
    // int osServer = osServerSaved.length;
    // int chrome = chromeSaved.length;
    //
    // print('VS_CODE: $vsCode');
    // print('JETBRAINS: $jetBrains');
    // print('FIREFOX_ADDON: $fireFox');
    // print('SAFARI_EXTENSION: $safari');
    // print('PIECES_FOR_DEVELOPERS: $pieces');
    // print('CLI: $cli');
    // print('OS_SERVER: $osServer');
    // print('CHROME_EXTENSION: $chrome');
    // var num1 = vsCode;
    // var num2 = jetBrains;
    // var zero = 0;
    //
    // zero = vsCode + jetBrains + fireFox + safari + pieces + cli + osServer + chrome;
    // print("Total: ${zero}");
    // expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });
}

//
// VS_CODE
// JETBRAINS
// FIREFOX_ADDON_MV2
// FIREFOX_ADDON_MV3
// SAFARI_EXTENSION_MV2
// SAFARI_EXTENSION_MV3
// PIECES_FOR_DEVELOPERS
// PIECES_FOR_DEVELOPERS_CLI
// OS_SERVER
// GOOGLE_CHROME_EXTENSION_MV2
// GOOGLE_CHROME_EXTENSION_MV3
// ULTRA_EDIT
// ATOM_PACKAGE
// ADOBE_ILLUSTRATOR_PIECES_COLOR_SHARE
