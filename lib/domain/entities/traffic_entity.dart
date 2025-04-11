// domain/entities/traffic_camera_entity.dart
class TrafficCameraEntity {
  final String cameraId;
  final String imageUrl;
  final double latitude;
  final double longitude;

  TrafficCameraEntity({
    required this.cameraId,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });
}
