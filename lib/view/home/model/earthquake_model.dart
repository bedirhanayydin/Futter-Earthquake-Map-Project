import 'package:freezed_annotation/freezed_annotation.dart';

part 'earthquake_model.freezed.dart';
part 'earthquake_model.g.dart';

@freezed
class EarthquakeModel with _$EarthquakeModel {
  factory EarthquakeModel({
    String? ID,
    String? MapImage,
    String? Time,
    double? Magnitude,
    String? MagnitudeType,
    String? Latitude,
    String? Longitude,
    int? Depth,
    String? Region,
    String? AM,
    String? LastUpdate,
  }) = _EarthquakeModel;

  factory EarthquakeModel.fromJson(Map<String, dynamic> json) => _$EarthquakeModelFromJson(json);
}
