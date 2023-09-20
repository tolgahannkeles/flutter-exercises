import 'package:flutter/material.dart';

class ImageExercise extends StatelessWidget {
  final String amongUsPhotoLink =
      "https://assets.stickpng.com/thumbs/61d183-004c6334b.png";

  const ImageExercise({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
              child: Image.network(
            amongUsPhotoLink,
            errorBuilder: (context, error, stackTrace) => const Icon(
              // error durumunda yapılacak işleri yapıyorsun
              Icons.error_outline_outlined,
              size: 100,
            ),
          )),
        ],
      ),
    );
  }
}

/*
Image kullanırken assets klasörünü oluştur
pubspec.yaml dosyasındaki Flutter nesnesinin altında assets: onun altında da pathi ekle
Örnek kullanım-->

flutter:
  uses-material-design: true
  assets:
    -assets/logo.png

*/
