// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class image_picker_controller extends GetxController {
  Rx<Uint8List?> img = Rx<Uint8List?>(null);
  var video_url = "".obs;


  Rx<String?> media = Rx<String?>(null);
  late VideoPlayerController videoPlayerController;
  var isPlaying = true.obs;

  pickimages() async {
    ///ImagePicker pi = ImagePicker();
    XFile? data = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (data != null) {
      final Uint8List bytes = await data.readAsBytes();
      img.value = bytes;
      update();
    }
    update();
  }
  ////////////////////////////////////////

  ///pickvideo() {}
  pickMedia() async {
    XFile? videoFile;
    try {
      videoFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (videoFile != null) {
        video_url.value = videoFile.path;
        initalizevideo();
      }
    } catch (e) {
      print(e.toString());
    }
  }


  initalizevideo() {
      if (video_url.value.isNotEmpty) { // Check if video_url is not empty
    videoPlayerController = VideoPlayerController.file(File(video_url.value))
      ..initialize().then((_) {
        update();
        videoPlayerController.play();
        update();
      });
  } else {
    print("Video URL is empty or null");
  }

  }



  playtoggele() {
    if (isPlaying.value) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    isPlaying.toggle();
  }
  /////////////////////////////////////////appiono video player ////////////////////////////////////////////////////////////////
  

  @override
  void onInit() {
   pickMedia();
    super.onInit();
  }

  @override
  void dispose() {
 if (videoPlayerController != null) { // Check if videoPlayerController is not null
    videoPlayerController.dispose();
  }
    super.dispose();
  }
}
