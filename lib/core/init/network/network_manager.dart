import 'package:dio/dio.dart';

import '../../constants/app/app_constants.dart';
import 'client.dart';
import 'core_dio.dart';

class NetworkManager {
  late APIClient apiClient;
  late Dio coreDio;
  static const _timeout = 60000;

  NetworkManager() {
    final baseOptions = BaseOptions(
      baseUrl: ApplicationConstants.BASE_URL,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
    );

    coreDio = CoreDio(options: baseOptions);
    apiClient = APIClient(coreDio);
  }
}
