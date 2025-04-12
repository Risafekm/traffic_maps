// ignore_for_file: use_super_parameters
import 'package:traffic_map/domain/entities/traffic_entity.dart';

class TrafficCameraModel extends TrafficCameraEntity {
  TrafficCameraModel({
    required String cameraId,
    required String imageUrl,
    required double latitude,
    required double longitude,
  }) : super(
         cameraId: cameraId,
         imageUrl: imageUrl,
         latitude: latitude,
         longitude: longitude,
       );

  factory TrafficCameraModel.fromJson(Map<String, dynamic> json) {
    return TrafficCameraModel(
      cameraId: json['camera_id'],
      imageUrl: json['image'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
    );
  }
}
