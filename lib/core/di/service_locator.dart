import 'package:get_it/get_it.dart';
import 'package:traffic_map/core/network/api_service.dart';
import 'package:traffic_map/data/repositories/traffic_repository_imp.dart';
import 'package:traffic_map/domain/repositories/traffic_repository.dart';
import 'package:traffic_map/domain/usecases/traffic_camera_usecases.dart';

final sl = GetIt.instance;

void init() {
  //api service
  sl.registerLazySingleton<ApiService>(() => ApiService());

  //traffic repository
  sl.registerLazySingleton<TrafficCameraRepository>(
    () => TrafficCameraRepositoryImpl(sl()),
  );

  //usecase
  sl.registerLazySingleton(() => GetTrafficCameras(sl()));
}
