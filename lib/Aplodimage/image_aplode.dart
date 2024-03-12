import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image_picker_controller.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.pickImage();
                },
                child: Text('Pick your Image'),
              ),
            ),
            ElevatedButton(onPressed: (){
              controller.uploadImageToFirebase();
            }, child: Text("Upload image")),
            Obx(() {
              return Container(
                child: controller.image.value.path == ''
                    ? Icon(Icons.camera, size: 50)
                    : Image.file(
                  File(controller.image.value.path),
                ),
              );
            }),
            ElevatedButton(
              onPressed: () {
                controller.uploadImageToFirebase();
              },
              child: Text('Upload to Firebase Storage'),
            ),
            Image.network(controller.networkImage.value.toString()),
          ],
        ),
      ),
    );
  }
}


