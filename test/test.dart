
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("description ", () async {
    var today = DateTime.now();
    var dentistAppointment = new DateTime(2021, 1, 18);
    print(dentistAppointment);
    print(today.isBefore(dentistAppointment)); // 在之前
    print(today.isAfter(dentistAppointment));
    print(today.difference(dentistAppointment).inDays);
  });
}

class TestB{

}
