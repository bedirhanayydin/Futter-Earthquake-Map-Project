import 'package:deprem_harita_proje/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../core/init/theme/light/text_theme_light.dart';
import '../../../core/utility/locator.dart';
import '../../_product/_widgets/snackbar/snackbar.dart';
import '../model/earthquake_model.dart';

class HomeRepository {
  List<EarthquakeModel> earthquakes = [];
  int limit = 50;

  Future<void> fetchEarthquakes() async {
    final result = await locator<NetworkManager>().apiClient.getEarthquakes(limit);
    if (result.isNotEmpty) {
      earthquakes = result;
      CustomSnackBar(
        locator<NavigationManager>().rootContext,
        Text(
            "${LocaleKeys.app_last_earthquake.locale}  = ${earthquakes.first.Region.toString()} ${earthquakes.first.Time.toString()}",
            style: TextThemeLight.instance!.headline5),
        assetName: ImageConstants.instance.icn_warning,
      );
    }
  }
}
