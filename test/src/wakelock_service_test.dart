// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wakelock_plus_platform_interface/wakelock_plus_platform_interface.dart';
import 'package:wakelock_service/wakelock_service.dart';

class _WakelockPlusPlatformMock extends Mock
    implements WakelockPlusPlatformInterface {}

void main() {
  late WakelockService sut;

  setUp(() {
    wakelockPlusPlatformInstance = _WakelockPlusPlatformMock();
    sut = WakelockService();
  });

  group('WakelockService', () {
    group('WakelockService', () {
      test('can be instantiated', () {
        expect(WakelockService(), isNotNull);
      });

      test('can return whether wakelock is enabled', () async {
        expect(await sut.isEnabled, isA<bool>());
      });

      test('can enable wakelock', () async {
        expect(await sut.isEnabled, isFalse);

        when(() => wakelockPlusPlatformInstance.enabled)
            .thenAnswer((_) async => true);
        when(() => wakelockPlusPlatformInstance.toggle(enable: true))
            .thenAnswer((_) async {});

        await sut.enable();

        expect(await sut.isEnabled, isTrue);
      });

      test('may not enable wakelock', () async {
        when(() => wakelockPlusPlatformInstance.toggle(enable: true))
            .thenThrow((_) async => Exception());

        await sut.enable();

        expect(await sut.isEnabled, isFalse);
      });

      test('can disable wakelock', () async {
        when(() => wakelockPlusPlatformInstance.toggle(enable: false))
            .thenAnswer((_) async {});

        await sut.disable();

        expect(sut.isEnabled, completion(isFalse));
      });

      test('may not disable wakelock', () async {
        when(() => wakelockPlusPlatformInstance.toggle(enable: false))
            .thenThrow((_) async => Exception());

        await sut.disable();

        expect(sut.isEnabled, completion(isFalse));
      });
    });
  });
}
