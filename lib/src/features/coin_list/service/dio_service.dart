import 'package:dio/dio.dart';
import 'i_dio_service.dart';

class DioService implements IDioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://api.coinbase.com/v2/",
      ),
    );
  }
}
