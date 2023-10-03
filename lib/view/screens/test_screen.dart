import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    VideoPlayerController videoPlayerController =
    VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9, // Adjust as needed
      autoInitialize: true,
      looping: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 242,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  void playNextVideo() {
    int currentIndex = videoUrls.indexOf(widget.videoUrl);
    if (currentIndex < videoUrls.length - 1) {
      String nextVideoUrl = videoUrls[currentIndex + 1];
      _chewieController.pause();
      VideoPlayerController newVideoPlayerController =
      VideoPlayerController.network(nextVideoUrl);
      _chewieController = ChewieController(
        videoPlayerController: newVideoPlayerController,
        aspectRatio: 16 / 9, // Adjust as needed
        autoInitialize: true,
        looping: false,
      );
      _chewieController.play();
      setState(() {});
    }
  }
}

List<String> videoUrls = [
  'https://ik.imagekit.io/fjkac9ivr/courses/videos/06_5.mp4?tr=q-80',
];

class VideoPlaylistApp extends StatelessWidget {
  const VideoPlaylistApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Playlist'),
      ),
      body: Container(
        height: 200,
        width: 400,
        child: Column(
          children: <Widget>[
            for (String videoUrl in videoUrls)
              Center(child: VideoPlayerWidget(videoUrl: videoUrl)),
          ],
        ),
      ),
    );
  }
}
