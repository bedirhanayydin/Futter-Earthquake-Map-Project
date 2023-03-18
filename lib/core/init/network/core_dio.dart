import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class CoreDio with DioMixin implements Dio {
  @override
  final BaseOptions options;
  CoreDio({
    required this.options,
  }) {
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}
