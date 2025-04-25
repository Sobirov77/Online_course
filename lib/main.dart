import 'package:flutter/material.dart';
import 'package:real_project/core/di/service_locator.dart';

import 'app.dart';

void main() async {
  await setupServiceLocator();
  runApp(const MyApp());
}
