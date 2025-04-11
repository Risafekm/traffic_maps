// main.dart
import 'package:flutter/material.dart';
import 'package:traffic_map/presentation/pages/splash_screen.dart';
import 'core/di/service_locator.dart' as di;

void main() {
  di.init();
  runApp(const TrafficCameraApp());
}

class TrafficCameraApp extends StatelessWidget {
  const TrafficCameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Camera Viewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const SplashScreen(),
    );
  }
}
