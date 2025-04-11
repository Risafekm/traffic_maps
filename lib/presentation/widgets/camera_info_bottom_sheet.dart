// presentation/widgets/camera_info_bottom_sheet.dart
import 'package:flutter/material.dart';

class CameraInfoBottomSheet extends StatelessWidget {
  final String cameraId;
  final String imageUrl;

  const CameraInfoBottomSheet({
    super.key,
    required this.cameraId,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Container(
        color: Colors.white.withOpacity(0.95),
        padding: const EdgeInsets.all(16),
        height: 300,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Camera ID: $cameraId',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
