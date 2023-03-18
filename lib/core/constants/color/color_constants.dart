import 'package:flutter/material.dart';

import '../../extension/color_extension.dart';

class ColorConstants {
  static ColorConstants? _instace;

  static ColorConstants get instance => _instace ??= ColorConstants._init();

  ColorConstants._init();
  Color get secondary => HexColor.fromHex("#EFEFEF");
  Color get border => HexColor.fromHex("#EAEAF5");
  Color get shadow => HexColor.fromHex("#000000").withOpacity(0.29);
  Color get profile_card_shadow => HexColor.fromHex("#000000").withOpacity(0.1);
  Color get listItem => HexColor.fromHex("#333333");
  Color get primaryText => HexColor.fromHex("#333333");
  Color get clared_red => HexColor.fromHex("#40070E");
  Color get clared_red_medium => HexColor.fromHex("#511D24");
  Color get clared_red_light => HexColor.fromHex("#613138");
  Color get white => HexColor.fromHex("#FFFFFF");
  Color get primary => HexColor.fromHex("#10303E");

  Color get black => const Color.fromRGBO(51, 51, 51, 1);
  Color get blackMedium => const Color.fromRGBO(69, 69, 69, 1);
  Color get blackLight => const Color.fromRGBO(86, 86, 86, 1);
  Color get stop => const Color.fromRGBO(100, 98, 98, 1);
  Color get status_green => const Color.fromRGBO(59, 207, 94, 1);
  Color get status_white => const Color.fromRGBO(238, 238, 246, 1);
  Color get text_gray => const Color.fromRGBO(100, 98, 98, 1);
  Color get map_outside => const Color.fromRGBO(108, 146, 247, 0.5);
  Color get map_bound => const Color.fromRGBO(12, 17, 14, 1);
}
