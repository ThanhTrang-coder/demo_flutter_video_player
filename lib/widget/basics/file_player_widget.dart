import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_player/widget/video_player_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:video_player/video_player.dart';

class FilePlayerWidget extends StatefulWidget {
  const FilePlayerWidget({Key? key}) : super(key: key);

  @override
  State<FilePlayerWidget> createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  final File file = File('/data/user/0/com.example.demo_flutter_chewie_video_player/cache/490cb166-120b-4539-bba6-1ab7fe9629b0/video1.mpeg');
  late VideoPlayerController controller;
  // late File _video;
  // final picker = ImagePicker();
  // _pickVideo() async {
  //   final video = await picker.pickVideo(source: ImageSource.gallery);
  //   _video = File(video!.path);
  //   controller = VideoPlayerController.file(_video)..initialize().then( (value) {
  //     setState(() {
  //
  //     });
  //     controller.play();
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.file(file)
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
      body: Column(
        children: [
          VideoPlayerWidget(controller: controller),
          // if(_video != null)
          //   controller.value.isInitialized
          //     ? AspectRatio(
          //       aspectRatio: controller.value.aspectRatio,
          //       child: VideoPlayer(controller),
          //     ) : Container()
          // else
          //   TextButton(
          //       onPressed: () {
          //         pickFiles();
          //       },
          //       child: const Text('Select video'),
          //   ),
        ],
      )
    );
  }

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result == null) return;

    PlatformFile? file = result!.files.first;

    viewFile(file);
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  // Future<File> pickVideoFile() async {
  //
  // }
}
