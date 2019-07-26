import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_flutter/app/layout/navigation.dart';
import 'package:learning_flutter/app/layout/toolbar.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:image_picker/image_picker.dart';

class FaceDetection extends StatefulWidget {
  @override
  _FaceDetectionState createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  File _image;

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final FirebaseVisionImage visionImage =
  //       FirebaseVisionImage.fromFile(image);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar('Meals'),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      drawer: Navigation(),
    );
  }
}
