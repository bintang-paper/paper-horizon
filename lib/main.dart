import 'dart:async' show runZonedGuarded;

import 'package:flutter/material.dart';
import 'package:paper_horizon/app.dart';
import 'package:paper_horizon/config/env/env.dart';
import 'package:paper_horizon/core/di/di.dart';
import 'package:paper_horizon/i18n/strings.g.dart';

void configureApp(EnvFlavor flavor) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    LocaleSettings.setLocale(AppLocale.id); // Force Indonesian locale

    // DI
    setUpDI(flavor);

    runApp(TranslationProvider(child: const HorizonApp()));
  }, catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object exception, StackTrace? stack) {
  // TODO(team): handle
}
