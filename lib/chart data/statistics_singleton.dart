import 'package:gsheets/chart%20data/statistics.dart';

class StatisticsSingleton {
  static final StatisticsSingleton _singleton = StatisticsSingleton._internal();

  factory StatisticsSingleton() {
    return _singleton;
  }

  StatisticsSingleton._internal();

  Statistics? statistics;
}
