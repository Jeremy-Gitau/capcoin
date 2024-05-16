import 'dart:convert';
import 'package:capcoin/models/app_config.dart';
import 'package:capcoin/pages/home_page.dart';
import 'package:capcoin/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHttpService();
  GetIt.instance.get<HttpService>().get("/coins/bitcoin");
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets/config/main.json");

  Map _configData = jsonDecode(_configContent);
  print(_configData);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
        COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"],
        API_KEY: _configData['API_KEY']),
  );
}

void registerHttpService() {
  GetIt.instance.registerSingleton<HttpService>(HttpService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CapCoin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(
          88,
          60,
          197,
          1,
        ),
      ),
      home: const HomePage(),
    );
  }
}
