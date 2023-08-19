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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: const Center(
        child: Text('portrait and landscape player page'),
      ),
    );
  }
}
