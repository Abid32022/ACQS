import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../model/courses_model.dart';

class VideoProvider extends ChangeNotifier {
  List<dynamic> videoUrls = [];
  List<ChewieController> chewieControllers = [];
  int currentVideoIndex = 0;
  ChewieController? chewieController;
  bool isHide = false;

  VideoProvider(List<dynamic> videoUrls) {
    this.videoUrls = videoUrls;
    initializeVideoControllers();
  }
  void updateVideoUrls(List<dynamic> newVideoUrls) {
    videoUrls = newVideoUrls;
    initializeVideoControllers(); // Reinitialize controllers with new URLs
    notifyListeners(); // Notify listeners of the change
  }

  void initializeVideoControllers() {
    chewieControllers.clear();
    for (dynamic videoUrl in videoUrls) {
      VideoPlayerController videoController =
      VideoPlayerController.network(videoUrl.videoTemp.toString());
      ChewieController controller = ChewieController(
        videoPlayerController: videoController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: false,
      );
      videoController.initialize().then((_) {
        videoController.setLooping(false);
      });
      chewieControllers.add(controller);
    }

    chewieController = chewieControllers[0];

    for (int i = 0; i < chewieControllers.length; i++) {
      chewieControllers[i].videoPlayerController.addListener(() {
        if (chewieControllers[i].videoPlayerController.value.duration.inSeconds ==
            chewieControllers[i].videoPlayerController.value.position.inSeconds) {
          if (i + 1 < chewieControllers.length) {
            chewieController = chewieControllers[i + 1];
            currentVideoIndex++;
          } else {
            if (currentVideoIndex == 1) {
              chewieController?.videoPlayerController.pause();
              chewieController?.videoPlayerController.dispose();
              chewieController?.pause();
              print("complete is ");
              isHide = true;
              notifyListeners();
            }
          }
        } else {
          print("Video not complete");
        }
      });
    }
  }

  void dispose() {
    for (var controller in chewieControllers) {
      controller.videoPlayerController.dispose();
      controller.dispose();
    }
    chewieControllers.clear();
  }
}
