import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../view/home/model/earthquake_model.dart';

part 'client.g.dart';

// *** CLIENT *** //
@RestApi(baseUrl: "")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  // ===== GET ===== //
  @GET('kandilli/index.php?last={x}')
  Future<List<EarthquakeModel>> getEarthquakes(@Path('x') int? limit);
}
