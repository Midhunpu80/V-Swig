import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class videoplayer_controller extends GetxController {
  final Rx<VideoPlayerController?> videoController = Rx(null);
  late ChewieController chewieController;
  RxString urlLink = "".obs;

  geturl({required var url}) async {
    if (Uri.tryParse(url) == null) {
      print("nvalid URL format. Please provide a valid video URL.");
      return;
    }
    urlLink.value = url;
    videoinitilalize(url: urlLink.value);
    update();
    print(
        "${urlLink.value.toString()}----------------------------------------------------------------->");
  }

  videoinitilalize({required var url}) async {
    try {
      // if (url.toString().isNotEmpty) {
      final controller = VideoPlayerController.networkUrl(Uri.parse(url));
      await videoController.value?.initialize();
      //  chewieController.autoInitialize;
      videoController.value = controller;

      // chewieController = ChewieController(
      //     videoPlayerController: videoController.value!,
      //     autoPlay: true,
      //     looping: false);
      update();
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() async {
    await geturl(url: "");
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    videoController.value?.dispose();
    chewieController.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
