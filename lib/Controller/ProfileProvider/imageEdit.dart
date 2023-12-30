import 'dart:io';

import 'package:diary/util/appCustam.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfilePoto extends ChangeNotifier {
  File? imagesscover;

  Future<void> coverpic(ImageSource source) async {
    XFile? picfile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 90,
    );

    if (picfile != null) {
      await cropImages(picfile);
    }
  }

  Future<void> cropImages(XFile fileData) async {
    CroppedFile? _croppedImage = await ImageCropper()
        .cropImage(sourcePath: fileData.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: yellow,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    ]);
    if (_croppedImage != null) {
      imagesscover = File(_croppedImage.path);
      _uploadStoragecover(imagesscover!);
    }
  }

  _uploadStoragecover(File image) async {
    try {
      // Generate a unique file name or use the user's UID
      //String filename = Uuid().v1();
      String fileName = 'ProileImage/${auth.currentUser!.uid}.jpg';

      // Upload the image to Firebase Storage
      await FirebaseStorage.instance.ref(fileName).putFile(image);

      // Get the download URL
      String downloadUrl =
          await FirebaseStorage.instance.ref(fileName).getDownloadURL();
      firestore
          .doc(auth.currentUser!.uid)
          .update({'profilePhoto': downloadUrl});
    } catch (e) {
      // throw Exception('Error uploading image: $e');
    }
  }
}
