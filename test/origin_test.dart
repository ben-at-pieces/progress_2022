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

    double vsCodeDub = vSCodeSaved.length.toDouble();
    double jetBrainsDub = jetBrainsSaved.length.toDouble();
    double fireFoxDub = fireFox3Saved.length.toDouble();
    double safariDub = safari3Saved.length.toDouble();
    double piecesDub = pfdSaved.length.toDouble();
    double cliDub = piecesCLISaved.length.toDouble();
    double osServerDub = osServerSaved.length.toDouble();
    double chromeDub = chromeSaved.length.toDouble();

    int vsCode = vSCodeSaved.length;
    int jetBrains = jetBrainsSaved.length;
    int fireFox = fireFox3Saved.length;
    int safari = safari3Saved.length;
    int pieces = pfdSaved.length;
    int cli = piecesCLISaved.length;
    int osServer = osServerSaved.length;
    int chrome = chromeSaved.length;

    print('VS_CODE: $vsCode');
    print('JETBRAINS: $jetBrains');
    print('FIREFOX_ADDON: $fireFox');
    print('SAFARI_EXTENSION: $safari');
    print('PIECES_FOR_DEVELOPERS: $pieces');
    print('CLI: $cli');
    print('OS_SERVER: $osServer');
    print('CHROME_EXTENSION: $chrome');
    var num1 = vsCode;
    var num2 = jetBrains;
    var zero = 0;

    zero = vsCode + jetBrains + fireFox + safari + pieces + cli + osServer + chrome;
    print("Total: ${zero}");
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
