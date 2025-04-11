// data/repositories/traffic_camera_repository_impl.dart
import 'package:traffic_map/core/network/api_service.dart';
import 'package:traffic_map/data/models/traffic_model.dart';
import 'package:traffic_map/domain/entities/traffic_entity.dart';
import 'package:traffic_map/domain/repositories/traffic_repository.dart';

class TrafficCameraRepositoryImpl implements TrafficCameraRepository {
  final ApiService apiService;

  TrafficCameraRepositoryImpl(this.apiService);

  @override
  Future<List<TrafficCameraEntity>> fetchTrafficCamera() async {
    final cameraJsonList = await apiService.getTrafficCameras();
    return cameraJsonList
        .map((json) => TrafficCameraModel.fromJson(json))
        .toList();
  }
}
