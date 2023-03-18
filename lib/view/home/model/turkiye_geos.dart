import 'package:google_maps_flutter/google_maps_flutter.dart';

class TurkiyeGeos {
  String? type;
  List<LatLng> coordinates = [];

  TurkiyeGeos({
    this.type,
    required this.coordinates,
  });

  TurkiyeGeos.fromJson(Map<String, dynamic> json) {
    coordinates = [];
    final latList = (json['coordinates'][0][0]) as List<List<double>>;
    latList.forEach((lat) {
      coordinates.add(LatLng(lat[1], lat[0]));
    });
  }
}
