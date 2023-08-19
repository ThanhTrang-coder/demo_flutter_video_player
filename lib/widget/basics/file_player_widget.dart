import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_video_player/widget/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class FilePlayerWidget extends StatefulWidget {
  const FilePlayerWidget({Key? key}) : super(key: key);

  @override
  State<FilePlayerWidget> createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  final File file = File(
      '/data/user/0/com.example.video_example/cache/file_picker/big_buck_bunny_720p_10mb.mp4');
  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (file.existsSync()) {
      controller = VideoPlayerController.file(file)
        ..addListener(() => setState(() {}))
        ..setLooping(true)
        ..initialize().then((_) => controller?.play());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayerWidget(controller: controller!,),
    );
  }

  // Future<File> pickVideoFile() async {
  //
  // }
}
