import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants/image/image_constants.dart';
import '../../utility/locator.dart';
import '../navigation/navigation_manager.dart';

class ConstantManager {
  final navigationManager = locator<NavigationManager>();
  late BitmapDescriptor markerSvg;

  Future<void> loadConstants() async {
    await Future.wait([BuildSvgOfMarkers()]);
  }

  Future<void> BuildSvgOfMarkers() async {
    markerSvg = await fromSvg(navigationManager.rootContext, ImageConstants.instance.map_marker, 40);
  }

  Future<BitmapDescriptor> fromSvg(
    BuildContext context,
    String assetName,
    double size,
  ) async {
    var svgString = await DefaultAssetBundle.of(context).loadString(assetName);
    var svgDrawableRoot = await svg.fromSvgString(svgString, "svg");

    var width = size * MediaQuery.of(context).devicePixelRatio;
    // where 32 is your SVG's original width
    var height = size * MediaQuery.of(context).devicePixelRatio; // same thing

    var picture = svgDrawableRoot.toPicture(size: Size(width, height));
    var image = await picture.toImage(width.toInt(), height.toInt());
    var bytes = await image.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }
}
