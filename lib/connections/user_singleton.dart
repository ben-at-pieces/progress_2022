
import 'class_strut.dart';

class DataSingleton {
  static final DataSingleton _singleton = DataSingleton._internal();

  factory DataSingleton() {
    return _singleton;
  }

  DataSingleton._internal();

  StatisticsData? statisticsData;
}