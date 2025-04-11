import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_map/domain/usecases/traffic_camera_usecases.dart';
import 'package:traffic_map/presentation/bloc/traffic_camera_bloc/traffic_camera_state.dart';

class TrafficCameraCubit extends Cubit<TrafficCameraState> {
  final GetTrafficCameras getTrafficCameras;

  TrafficCameraCubit(this.getTrafficCameras)
    : super(TrafficCameraInitialState());

  Future<void> fetchCameras() async {
    emit(TrafficCameraLoadingState());
    try {
      final cameras = await getTrafficCameras();
      emit(TrafficCameraSuccessState(cameras));
    } catch (e) {
      emit(TrafficCameraErrorState(errorMessage: e.toString()));
    }
  }
}
