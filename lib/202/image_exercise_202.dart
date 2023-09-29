import 'package:flutter/material.dart';

class ImageExercise202 extends StatefulWidget {
  const ImageExercise202({Key? key}) : super(key: key);

  @override
  _ImageExercise202State createState() => _ImageExercise202State();
}

class _ImageExercise202State extends State<ImageExercise202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.asset(
        ImagePaths.img_barrett_jpg.path(),
        scale: 0.75,
      ),
      //body: Image.asset("assets/images/img_barrett.jpg"),
    );
  }
}

enum ImagePaths { img_barrett_jpg, logo_png }

extension ImagePathExtension on ImagePaths {
  String path() {
    if (name.contains("png")) {
      return "assets/images/$name.png";
    } else if (name.contains("jpg")) {
      return "assets/images/$name.jpg";
    } else {
      return "";
    }
  }
}
