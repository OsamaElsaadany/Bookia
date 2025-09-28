import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/theme.dart';
import 'package:bookia/features/splash/Splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: kDebugMode,
    builder: (context)=> const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: Routes.routes,
      theme: apptheme.lighttheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
