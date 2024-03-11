import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io' as io;

class image_picker_controller extends GetxController {
  Rx<Uint8List?> img = Rx<Uint8List?>(null);
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
    XFile? mediaFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (mediaFile != null) {
      final String path = await saveVideoToTempDirectory(mediaFile);
      media.value = path;
      videoPlayerController = VideoPlayerController.file(io.File(path));
      videoPlayerController.initialize().then((_) {
        videoPlayerController.play();
        update();
      });
    }
  }

  Future<String> saveVideoToTempDirectory(XFile mediaFile) async {
    final io.Directory systemTempDir = io.Directory.systemTemp;
    final io.File file = io.File(
        '${systemTempDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4');
    await file.writeAsBytes(await mediaFile.readAsBytes());
    return file.path;
  }

  playtoggele() {
    if (isPlaying.value) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    isPlaying.toggle();
    
  }

  @override
  void onInit() {
    if (media.value != null) {
      videoPlayerController = VideoPlayerController.file(io.File(media.value!));
      videoPlayerController.initialize().then((value) => update());
    }
    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();

    super.dispose();
  }
}
