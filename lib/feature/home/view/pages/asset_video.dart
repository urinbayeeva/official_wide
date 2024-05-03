import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerVideo extends StatefulWidget {
  const AssetPlayerVideo({super.key});

  @override
  State<AssetPlayerVideo> createState() => _AssetPlayerVideoState();
}

class _AssetPlayerVideoState extends State<AssetPlayerVideo> {
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initVideoPlayer();
  }

  final assetVideo = "assets/videos/nature.mp4";

  @override
  Widget build(BuildContext context) {
    return CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController);
  }

  void initVideoPlayer() {
    VideoPlayerController _videoPlayerController;
    _videoPlayerController = VideoPlayerController.asset(assetVideo)
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController =
        CustomVideoPlayerController(context: context, videoPlayerController: _videoPlayerController);
  }
}
