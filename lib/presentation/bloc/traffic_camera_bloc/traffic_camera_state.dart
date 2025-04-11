import 'package:traffic_map/domain/entities/traffic_entity.dart';

abstract class TrafficCameraState {}

class TrafficCameraInitialState extends TrafficCameraState {}

class TrafficCameraLoadingState extends TrafficCameraState {}

class TrafficCameraSuccessState extends TrafficCameraState {
  final List<TrafficCameraEntity> cameras;
  TrafficCameraSuccessState(this.cameras);
}

class TrafficCameraErrorState extends TrafficCameraState {
  final String errorMessage;
  TrafficCameraErrorState({required this.errorMessage});
}
