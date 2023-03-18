// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EarthquakeModel _$$_EarthquakeModelFromJson(Map<String, dynamic> json) =>
    _$_EarthquakeModel(
      ID: json['ID'] as String?,
      MapImage: json['MapImage'] as String?,
      Time: json['Time'] as String?,
      Magnitude: (json['Magnitude'] as num?)?.toDouble(),
      MagnitudeType: json['MagnitudeType'] as String?,
      Latitude: json['Latitude'] as String?,
      Longitude: json['Longitude'] as String?,
      Depth: json['Depth'] as int?,
      Region: json['Region'] as String?,
      AM: json['AM'] as String?,
      LastUpdate: json['LastUpdate'] as String?,
    );

Map<String, dynamic> _$$_EarthquakeModelToJson(_$_EarthquakeModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'MapImage': instance.MapImage,
      'Time': instance.Time,
      'Magnitude': instance.Magnitude,
      'MagnitudeType': instance.MagnitudeType,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Depth': instance.Depth,
      'Region': instance.Region,
      'AM': instance.AM,
      'LastUpdate': instance.LastUpdate,
    };
