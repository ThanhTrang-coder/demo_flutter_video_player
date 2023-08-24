import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_player/main.dart';
import 'package:flutter_video_player/widget/orientation/video_player_fullscreen_widget.dart';
import 'package:video_player/video_player.dart';

class LandscapePlayerPage extends StatefulWidget {
  const LandscapePlayerPage({Key? key}) : super(key: key);

  @override
  State<LandscapePlayerPage> createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.asset('videos/vid2.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());

    setLandscape();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    setAllOrientations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerFullscreenWidget(controller: controller);
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  
  Future setAllOrientations() async {
    await SystemChrome.setPreferredOrientations(
      DeviceOrientation.values
    );
  }
}
