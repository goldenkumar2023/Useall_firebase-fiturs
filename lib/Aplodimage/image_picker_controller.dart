import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  Rx<File> image = File('').obs;
  Rx<String> networkImage = ''.obs;

  Future<void> pickImage() async {
    try {
      final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagePick == null) {
        return;
      }

      final imageTemp = File(imagePick.path);
      image.value = imageTemp;
    } on PlatformException catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<String> uploadImageToFirebase() async {
    if (image.value == null || !image.value.existsSync()) {
      print('Image file is null or does not exist.');
      return '';
    }

    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      Reference reference = FirebaseStorage.instance.ref().child('mypictures/$fileName.png');
      await reference.putFile(image.value);

      String downloadURL = await reference.getDownloadURL();
      networkImage.value = downloadURL;

      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  Future<void> uploadImage() async {
    if (image.value == null || !image.value.existsSync()) {
      print('Image file is null or does not exist.');
      return;
    }

    try {
      String imagePath = image.value.path;
      String imageType = imagePath.split(".").last;
      String endPath = imagePath.split("/").last;

      SettableMetadata metaData = SettableMetadata(
        contentType: "image/$imageType",
      );

      await FirebaseStorage.instance.ref("image").child(endPath).putFile(image.value, metaData);
      print('Upload complete: $endPath');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
