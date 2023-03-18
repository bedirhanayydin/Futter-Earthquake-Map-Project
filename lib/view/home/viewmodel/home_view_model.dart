import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../../../../core/base/model/base_view_model.dart';
import '../../../core/init/location/location_manager.dart';
import '../model/earthquake_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => ctx = context;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  bool isFirstInit = true;
  @observable
  int limit = 20;
  @observable
  List<EarthquakeModel> earthquakes = [];
  @observable
  var polygons = ObservableList<Polygon>.of([]);

  @observable
  var markers = ObservableList<Marker>.of([]);

  List<EarthquakeModel> mapLists = [];

  void setMapLists({required List<EarthquakeModel> mapLists}) {
    this.mapLists = mapLists;
  }

  @override
  init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  Future<void> controlAppState() async {
    await _networkInit();
    await setMapFromConfiguration();
  }

  void setMarkers() {
    for (var o in mapLists) {
      final _marker = CreateMarker.getMarker(
          o: o, icon: constantManager.markerSvg, customInfoWindowController: customInfoWindowController);

      markers.add(_marker);
    }
  }

  Future<void> _networkInit() async {
    // await getHome(limit);
  }

  @action
  Future<void> setMapFromConfiguration() async {
    //harita etrafında sınır belirlemek için deneme
    // List<LatLng> polygonLatLongs = [];
    // polygonLatLongs.add(LatLng(4.57496548534022, 4.980907408948053));
    // polygonLatLongs.add(LatLng(11.2775966995164, 78.0698253629262));
    // polygonLatLongs.add(LatLng(64.47852694361694, 98.31865707101269));
    // polygonLatLongs.add(LatLng(59.76907921332497, -17.30890790693981));
    // polygonLatLongs.add(LatLng(4.57496548534022, 4.980907408948053));

    // polygons.clear();
    // final turkiye_geos = TurkiyeGeos.fromJson(turkey_json);
    // polygons.add(
    //   Polygon(
    //     polygonId: PolygonId("0"),
    //     points: polygonLatLongs,
    //     fillColor: ColorConstants.instance.primary.withOpacity(0.8),
    //     strokeWidth: 0,
    //     holes: [turkiye_geos.coordinates],
    //   ),
    // );
  }

  CameraPosition initalCameraPosition = CameraPosition(
    target: LatLng(39.7971339, 34.99610735),
    zoom: 2,
  );

  @observable
  Completer<GoogleMapController> controller = Completer();

  final CustomInfoWindowController customInfoWindowController = CustomInfoWindowController();

  final bounds = LatLngBounds(
    southwest: LatLng(36.737232, 3.086472),
    northeast: LatLng(47.22860860011326, 65.20931969999998),
  );
}
