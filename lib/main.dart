import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'main_app.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(const CloneInstagramApp());
}

