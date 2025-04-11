import 'package:traffic_map/domain/entities/traffic_entity.dart';

abstract class TrafficCameraRepository {
  Future<List<TrafficCameraEntity>> fetchTrafficCamera();
}
