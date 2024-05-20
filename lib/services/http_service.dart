import 'package:capcoin/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();
  AppConfig? _appConfig;
  String? baseUrl;
  String? apiKey;

  HttpService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    baseUrl = _appConfig!.COIN_API_BASE_URL;
    apiKey = _appConfig!.API_KEY;

    dio.options.headers = {
      'accept': 'application/json',
      'x-cg-demo-api-key': apiKey
    };
  }

  Future<Response?> get(String path) async {
    try {

      String url = "$baseUrl$path";

      Response response = await dio.get(url);
      return response;
    } catch (e) {
      print('HTTPService: Unable to perform get request.');
      print(e);
    }
    return null;
  }
}
