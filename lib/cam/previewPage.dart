import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/report/report.dart';

class PreviewPage extends StatelessWidget {
  PreviewPage({Key? key, required this.picture}) : super(key: key);
  XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.colorGreen,
          title: const Text('Preview Page')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),

          const SizedBox(height: 24),
          Text(picture.name),
          OutlinedButton(onPressed: () {
            GallerySaver.saveImage(picture.path);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Report(picture),
              ),
            );
          },
            child:Text("save",style: TextStyle(
              color: AppColor.colorGreen
            ),),)
        ]),
      ),
    );

  }
}