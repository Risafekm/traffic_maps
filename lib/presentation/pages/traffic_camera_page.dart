// presentation/pages/traffic_camera_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traffic_map/domain/usecases/traffic_camera_usecases.dart';
import '../../core/di/service_locator.dart';
import '../widgets/camera_info_bottom_sheet.dart';

class TrafficCameraPage extends StatefulWidget {
  const TrafficCameraPage({super.key});

  @override
  State<TrafficCameraPage> createState() => _TrafficCameraPageState();
}

class _TrafficCameraPageState extends State<TrafficCameraPage> {
  final GetTrafficCameras getCameras = sl<GetTrafficCameras>();
  final LatLng initialLatLng = const LatLng(1.3521, 103.8198);
  Set<Marker> markers = {};
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  Future<void> _loadCameras() async {
    final cameraList = await getCameras();
    setState(() {
      markers =
          cameraList.map((cam) {
            return Marker(
              markerId: MarkerId(cam.cameraId),
              position: LatLng(cam.latitude, cam.longitude),
              onTap: () {
                showModalBottomSheet(
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
                );
              },
            );
          }).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SG Traffic Cameras')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: initialLatLng, zoom: 12),
        markers: markers,
        onMapCreated: (controller) => mapController = controller,
      ),
    );
  }
}
