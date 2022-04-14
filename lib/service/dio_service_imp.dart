import 'package:dio/dio.dart';
import 'package:pokemon_felipe/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio();
  }
}
