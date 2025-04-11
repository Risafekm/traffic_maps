// domain/usecases/get_traffic_cameras.dart

import 'package:traffic_map/domain/entities/traffic_entity.dart';
import 'package:traffic_map/domain/repositories/traffic_repository.dart';

class GetTrafficCameras {
  final TrafficCameraRepository repository;

  GetTrafficCameras(this.repository);

  Future<List<TrafficCameraEntity>> call() {
    return repository.fetchTrafficCamera();
  }
}
