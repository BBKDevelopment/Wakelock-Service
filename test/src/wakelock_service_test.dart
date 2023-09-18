// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:wakelock_service/wakelock_service.dart';

void main() {
  group('WakelockService', () {
    test('can be instantiated', () {
      expect(WakelockService(), isNotNull);
    });
  });
}
