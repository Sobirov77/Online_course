import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:real_project/core/di/service_locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("authBox");
  await setupServiceLocator();
  runApp(const MyApp());
}
