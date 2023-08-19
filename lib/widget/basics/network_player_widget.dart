import 'package:flutter/material.dart';
import 'package:flutter_video_player/widget/others/floating_action_button_widget.dart';
import 'package:flutter_video_player/widget/others/textfield_widget.dart';
import 'package:flutter_video_player/widget/video_player_widget.dart';
import 'package:video_player/video_player.dart';

import '../../main.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({Key? key}) : super(key: key);

  @override
  State<NetworkPlayerWidget> createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  static const urlNetwork = 'https://www.youtube.com/watch?v=QouidTqzeTE';
  final textController = TextEditingController(text: urlNetwork);
  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.networkUrl(Uri.parse(textController.text))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller?.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          VideoPlayerWidget(controller: controller!),
          buildTextField(),
        ],
      ),
    );
  }

  Widget buildTextField() => Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: TextFieldWidget(
              controller: textController,
              hintText: 'Enter Video Url',
            ),
        ),
        const SizedBox(width: 12,),
        FloatingActionButtonWidget(
          onPressed: () {
            if(textController.text.trim().isEmpty) return;

            controller = VideoPlayerController.networkUrl(Uri.parse(textController.text))
              ..addListener(() => setState(() {}))
              ..setLooping(true)
              ..initialize().then((_) => controller?.play());
          }
        ),
      ],
    ),
  );
}
