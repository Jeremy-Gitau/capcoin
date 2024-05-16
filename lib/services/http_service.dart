import 'package:capcoin/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();
  AppConfig? _appConfig;
  String? _base_url;
  String? _api_key;

  HttpService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
    _api_key = _appConfig!.API_KEY;

    dio.options.headers = {
      'accept': 'application/json',
      'x-cg-demo-api-key': _api_key
    };
  }

  Future<Response?> get(String _path) async {
    try {

      String _url = "$_base_url$_path";

      Response _response = await dio.get(_url);
      print(_response);
      return _response;
    } catch (e) {
      print('HTTPService: Unable to perform get request.');
      print(e);
    }
    return null;
  }
}
