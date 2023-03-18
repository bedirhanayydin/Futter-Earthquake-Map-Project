import 'package:deprem_harita_proje/core/extension/string_extension.dart';
import 'package:dio/dio.dart';
import '../../init/lang/locale_keys.g.dart';

class EarthquakeException implements ExceptionFactory {
  final String body;
  EarthquakeException({
    required this.body,
  });

  @override
  String toString() {
    return body;
  }
}

abstract class ExceptionFactory implements Exception {
  factory ExceptionFactory({required Type exception}) {
    Map<Type, ExceptionFactory> strategyMap = {
      EarthquakeException: EarthquakeException(body: (exception as EarthquakeException).body),
      DioError: EarthquakeException(body: LocaleKeys.app.locale),
    };
    return strategyMap[exception.runtimeType]!;
  }
}
