import 'dart:async' show runZonedGuarded;

import 'package:flutter/material.dart';
import 'package:paper_horizon/app.dart';
import 'package:paper_horizon/config/env/env.dart';

void configureApp(EnvFlavor flavor) {
  runZonedGuarded(() async {
    runApp(const HorizonApp());
  }, catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object exception, StackTrace? stack) {
  // TODO(team): handle
}
