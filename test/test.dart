import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("description ", () async {
    List<String> arrs = ["18349295925", "13699432965", "13845296840"];

    var indexStr = "7";
    Stream.fromIterable(arrs.reversed)
        .where((event) => event.indexOf(indexStr) >= 0)
        .toList()
        .then(print);
  });
}

class TestB{

}
