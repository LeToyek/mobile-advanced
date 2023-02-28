import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioConf {
  @lazySingleton
  final dio = Dio(BaseOptions(baseUrl: dotenv.get("BASE_API")));
}
