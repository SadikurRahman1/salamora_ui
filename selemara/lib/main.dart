import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selemara/app.dart';
import 'package:selemara/core/helper/shared_preferences_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyApp()));
}
