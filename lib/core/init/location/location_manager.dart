import 'package:bubble/bubble.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../view/home/model/earthquake_model.dart';
import '../../constants/color/color_constants.dart';
import '../../extension/color_extension.dart';
import '../theme/light/text_theme_light.dart';

class CreateMarker {
  static Marker getMarker(
      {required EarthquakeModel o,
      required BitmapDescriptor icon,
      required CustomInfoWindowController customInfoWindowController,
      void Function()? onTap}) {
    return Marker(
        //marker id should be uniq
        markerId: MarkerId(
            "marker-${o.ID}${o.Region}${o.Latitude?.substring(0, 6).toString()}${o.Longitude?.substring(0, 6).toString()}"),
        position: LatLng(double.parse(o.Latitude!.substring(0, 6)), double.parse(o.Longitude!.substring(0, 6))),
        onTap: () {
          Widget inkwell = InkWell(
            onTap: onTap,
            child: Bubble(
              color: ColorConstants.instance.primary,
              elevation: 5,
              radius: Radius.circular(8),
              margin: BubbleEdges.all(0),
              padding: BubbleEdges.all(0),
              shadowColor: HexColor.fromHex('#10303E6C'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      child: Text(
                    '${o.Region}/${o.Magnitude}',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextThemeLight.instance!.dropdownStyle,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    o.Time ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextThemeLight.instance!.dropdownStyle,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          );

          customInfoWindowController.addInfoWindow!(
              inkwell, LatLng(double.parse(o.Latitude!.substring(0, 6)), double.parse(o.Longitude!.substring(0, 6))));
        },
        icon: icon,
        draggable: false);
  }
}
