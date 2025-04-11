// main.dart
import 'package:flutter/material.dart';
import 'core/di/service_locator.dart' as di;
import 'presentation/pages/traffic_camera_page.dart';

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
      home: const TrafficCameraPage(),
    );
  }
}
