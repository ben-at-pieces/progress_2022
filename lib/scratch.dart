import 'package:connector_openapi/api.dart';
import 'package:gsheets/connections/statistics_singleton.dart';

void main() {



  // List of strings
  List<String> stringList = [
    // 'Home',
    'Batchfile',
    'C',
    'Coffeescript',
    'C++',
    'C#',
    'CSS',
    'Dart',
    'Erlang',
    'Go',
    'Haskell',
    'HTML',
    'Image',
    'Java',
    'Javascript',
    'JSON',
    'Lua',
    'MarkDown',
    'Matlab',
    'ObjectiveC',
    'Perl',
    'PHP',
    'Powershell',
    'Python',
    'R',
    'Ruby',
    'Rust',
    'Scala',
    'Shell',
    'SQL',
    'Swift',
    'Tex',
    'Text',
    'Toml',
    'Typescript',
    'YAML',
  ];
print(stringList.length);
  // List of iterable assets
  // List<Iterable<Asset>>? filteredLanguage = StatisticsSingleton().statistics?.filteredLanguages.toList();

  // print(filteredLanguage);

  // Map the lists
  // Map<String, Iterable<Asset>> filterMap = Map.fromIterables(stringList, filteredLanguage!);

  // Print the result
  // print(filterMap);
}

// class Asset {
//   String name;
//
//   Asset(this.name);
//
//   @override
//   String toString() => name;
// }
