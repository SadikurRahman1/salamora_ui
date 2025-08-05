import 'package:flutter/material.dart';
import 'package:selemara/app.dart';
import 'package:selemara/core/helper/shared_preferences_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();

  runApp(const MyApp());
}
