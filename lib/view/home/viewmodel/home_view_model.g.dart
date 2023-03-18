// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$isFirstInitAtom =
      Atom(name: '_HomeViewModelBase.isFirstInit', context: context);

  @override
  bool get isFirstInit {
    _$isFirstInitAtom.reportRead();
    return super.isFirstInit;
  }

  @override
  set isFirstInit(bool value) {
    _$isFirstInitAtom.reportWrite(value, super.isFirstInit, () {
      super.isFirstInit = value;
    });
  }

  late final _$limitAtom =
      Atom(name: '_HomeViewModelBase.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$earthquakesAtom =
      Atom(name: '_HomeViewModelBase.earthquakes', context: context);

  @override
  List<EarthquakeModel> get earthquakes {
    _$earthquakesAtom.reportRead();
    return super.earthquakes;
  }

  @override
  set earthquakes(List<EarthquakeModel> value) {
    _$earthquakesAtom.reportWrite(value, super.earthquakes, () {
      super.earthquakes = value;
    });
  }

  late final _$polygonsAtom =
      Atom(name: '_HomeViewModelBase.polygons', context: context);

  @override
  ObservableList<Polygon> get polygons {
    _$polygonsAtom.reportRead();
    return super.polygons;
  }

  @override
  set polygons(ObservableList<Polygon> value) {
    _$polygonsAtom.reportWrite(value, super.polygons, () {
      super.polygons = value;
    });
  }

  late final _$markersAtom =
      Atom(name: '_HomeViewModelBase.markers', context: context);

  @override
  ObservableList<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableList<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_HomeViewModelBase.controller', context: context);

  @override
  Completer<GoogleMapController> get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(Completer<GoogleMapController> value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$setMapFromConfigurationAsyncAction = AsyncAction(
      '_HomeViewModelBase.setMapFromConfiguration',
      context: context);

  @override
  Future<void> setMapFromConfiguration() {
    return _$setMapFromConfigurationAsyncAction
        .run(() => super.setMapFromConfiguration());
  }

  @override
  String toString() {
    return '''
isFirstInit: ${isFirstInit},
limit: ${limit},
earthquakes: ${earthquakes},
polygons: ${polygons},
markers: ${markers},
controller: ${controller}
    ''';
  }
}
