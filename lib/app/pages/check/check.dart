import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as camera;

class FaceDetection extends StatefulWidget {
  @override
  _FaceDetectionState createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  camera.CameraController controller;

  init() async {
    List<camera.CameraDescription> cameras = await camera.availableCameras();
    controller = camera.CameraController(cameras[1], camera.ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    this.init();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: camera.CameraPreview(controller));
  }
}
