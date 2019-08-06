import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/layout/index.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart' as camera;

final streamController = StreamController();

Future<bool> checkAndRequestCameraPermissions() async {
  final permissionHandler = PermissionHandler();
  PermissionStatus permission = await permissionHandler.checkPermissionStatus(
    PermissionGroup.camera,
  );
  if (permission != PermissionStatus.granted) {
    final permissions = await permissionHandler.requestPermissions([
      PermissionGroup.camera,
    ]);
    logger.i("permissions ${permissions.toString()}");
    return permissions[PermissionGroup.camera] == PermissionStatus.granted;
  } else {
    return true;
  }
}

class _FaceDetectionBody extends StatefulWidget {
  @override
  _FaceDetectionBodyState createState() => _FaceDetectionBodyState();
}

class _FaceDetectionBodyState extends State<_FaceDetectionBody> {
  File _image;

  init() async {
    List<camera.CameraDescription> cameras = await camera.availableCameras();
    final controller =
        camera.CameraController(cameras[1], camera.ResolutionPreset.high);
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
    // this.init();
    streamController.stream.listen((onData) {
      getImage();
    });
  }

  Future getImage() async {
    logger.i("Future getImage() async");
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _image == null
          ? Text('No image selected.')
          : Image.file(
              _image,
              fit: BoxFit.fill,
            ),
    );
  }
}

class FaceDetectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Face Detection',
        context: context,
      ),
      drawer: Navigation(),
      body: _FaceDetectionBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final granted = await checkAndRequestCameraPermissions();
          if (granted) {
            streamController.sink.add(granted);
          }
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
