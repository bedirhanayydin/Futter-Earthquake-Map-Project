import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  bool get isValidEmail => RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);
}
