// presentation/pages/traffic_camera_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traffic_map/domain/entities/traffic_entity.dart';
import 'package:traffic_map/presentation/bloc/traffic_camera_bloc/traffic_camera_cubit.dart';
import 'package:traffic_map/presentation/bloc/traffic_camera_bloc/traffic_camera_state.dart';
import '../../core/di/service_locator.dart';
import '../widgets/camera_info_bottom_sheet.dart';

class TrafficCameraPage extends StatelessWidget {
  const TrafficCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrafficCameraCubit(sl())..fetchCameras(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Traffic Cameras'),
          backgroundColor: Colors.teal,
        ),
        body: BlocBuilder<TrafficCameraCubit, TrafficCameraState>(
          builder: (context, state) {
            if (state is TrafficCameraLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TrafficCameraSuccessState) {
              return CameraMapWidget(cameras: state.cameras);
            } else if (state is TrafficCameraErrorState) {
              return Center(child: Text(state.errorMessage));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class CameraMapWidget extends StatefulWidget {
  final List<TrafficCameraEntity> cameras;
  const CameraMapWidget({super.key, required this.cameras});

  @override
  State<CameraMapWidget> createState() => _CameraMapWidgetState();
}

class _CameraMapWidgetState extends State<CameraMapWidget> {
  final LatLng initialLatLng = const LatLng(1.3521, 103.8198);
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers =
        widget.cameras.map((cam) {
          return Marker(
            markerId: MarkerId(cam.cameraId),
            position: LatLng(cam.latitude, cam.longitude),
            onTap:
                () => showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder:
                      (_) => CameraInfoBottomSheet(
                        cameraId: cam.cameraId,
                        imageUrl: cam.imageUrl,
                      ),
                ),
          );
        }).toSet();

    return GoogleMap(
      initialCameraPosition: CameraPosition(target: initialLatLng, zoom: 12),
      markers: markers,
      onMapCreated: (controller) => mapController = controller,
    );
  }
}
