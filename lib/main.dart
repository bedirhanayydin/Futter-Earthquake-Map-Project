import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/color/color_constants.dart';
import 'core/init/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorConstants.instance.primaryText,
    ),
  );
  await init();
}
