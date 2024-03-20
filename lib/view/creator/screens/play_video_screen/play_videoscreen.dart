// ignore_for_file: unnecessary_null_comparison

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/utilities/colors.dart';

class play_videoscreen extends StatelessWidget {
  String videoLink;

  play_videoscreen({super.key, required this.videoLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wh,
        appBar: AppBar(
          backgroundColor: wh,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: bl,
              )),
        ),
        body:
            Obx(() => videoplayer_controll.videoController.value?.value != null
                ? AspectRatio(
                    aspectRatio: 0.8,
                    child: Center(
                        child: Chewie(
                      controller: ChewieController(
                          autoPlay: true,
                          videoPlayerController:
                              videoplayer_controll.videoController.value!),
                    )),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
