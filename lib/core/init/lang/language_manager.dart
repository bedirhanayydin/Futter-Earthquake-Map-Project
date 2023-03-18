import 'package:flutter/material.dart';

/// Show All Texts in editor(vscode): "(.*)"|'(.*)' with select regex
/// generate: flutter pub run easy_localization:generate -S assets/lang -f keys -O lib/core/init/lang -o locale_keys.g.dart
class LanguageManager {
  final localeChanged = ValueNotifier<bool>(false);

  List<Locale> get supportedLocales => FactoryOfMyLocale.langMap.values.toList();

  void updateLocaleChanged() {
    localeChanged.value = !localeChanged.value;
  }
}

enum MyLanguage { en, tr }

Map<String, MyLanguage> langMap = {"English": MyLanguage.en, "Turkish": MyLanguage.tr};

class FactoryOfMyLocale {
  static Map<MyLanguage, Locale> langMap = {
    MyLanguage.en: const Locale('en', 'US'),
    MyLanguage.tr: const Locale('tr', 'TR'),
  };
  static Locale create(MyLanguage? language) {
    return langMap[language] ?? const Locale('en', 'US');
  }
}
