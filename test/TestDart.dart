import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    print("******  counter = $counter  ******");
 
  });
}

//flutter pub  run test ../test/TestDart.dart
class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
