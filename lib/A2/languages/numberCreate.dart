// ignore_for_file: prefer_const_constructors

import 'dart:async';

var count = 1;
final controller = StreamController<int>();

Stream<int> get stream => controller.stream;

class NumberCreator {
  NumberCreator() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        controller.sink.add(count);
        count++;
      },
    );
  }
}
