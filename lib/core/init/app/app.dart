import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../view/app/app_view.dart';
import '../../constants/app/app_constants.dart';
import '../../utility/locator.dart';
import '../lang/language_manager.dart';

Future<void> init() async {
  setupLocator();
  await startApp();
}

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      // Provider package for changing theme style
      EasyLocalization(
          // DevicePreview for see responsive design in multi-screens
          child: DevicePreview(
            enabled: false, // !kReleaseMode,
            builder: (mainContext) => const AppView(),
          ),
          supportedLocales: locator<LanguageManager>().supportedLocales,
          path: ApplicationConstants.LANG_ASSET_PATH,
          fallbackLocale: FactoryOfMyLocale.create(MyLanguage.en),
          startLocale: FactoryOfMyLocale.create(langMap['en'])));
}
