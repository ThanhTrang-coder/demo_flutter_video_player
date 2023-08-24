import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  const PortraitLandscapePlayerPage({Key? key}) : super(key: key);

  @override
  State<PortraitLandscapePlayerPage> createState() => _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState extends State<PortraitLandscapePlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.asset('videos/vid2.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: VideoPlayerBothWidget(controller: controller),
    );
  }
}
