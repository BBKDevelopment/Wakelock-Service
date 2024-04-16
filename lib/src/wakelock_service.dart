// Copyright 2023 BBK Development. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:developer';

import 'package:wakelock_plus/wakelock_plus.dart';

/// {@template wakelock_service}
/// A service that enables and disables screen wakelock.
///
/// This service uses the `wakelock_plus` package.
///
/// ```dart
/// final wakelockService = WakelockService();
/// ```
/// {@endtemplate}
class WakelockService {
  /// {@macro wakelock_service}
  const WakelockService();

  /// Returns whether the wakelock is currently enabled or not.
  Future<bool> get isEnabled async {
    try {
      return await WakelockPlus.enabled;
    } catch (error, stackTrace) {
      log(
        'Could not get status info!',
        name: '$WakelockService',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Enables wakelock.
  Future<void> enable() async {
    try {
      await WakelockPlus.enable();
    } catch (error, stackTrace) {
      log(
        'Could not enable!',
        name: '$WakelockService',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Disables wakelock.
  Future<void> disable() async {
    try {
      await WakelockPlus.disable();
    } catch (error, stackTrace) {
      log(
        'Could not disable!',
        name: '$WakelockService',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
