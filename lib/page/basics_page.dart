import 'package:flutter/material.dart';
import 'package:flutter_video_player/widget/others/tabbar_widget.dart';

import '../widget/basics/asset_player_widget.dart';
import '../widget/basics/file_player_widget.dart';
import '../widget/basics/network_player_widget.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      tabs: const [
        Tab(
          icon: Icon(Icons.file_copy),
          text: 'Asset',
        ),
        Tab(
          icon: Icon(Icons.attach_file),
          text: 'File',
        ),
        Tab(
          icon: Icon(Icons.ondemand_video_outlined),
          text: 'Network',
        ),
      ],
      children: [
        buildAssets(),
        buildFiles(),
        buildNetwork(),
      ],
      onTap: (index) {}
    );
  }

  Widget buildAssets() => const AssetPlayerWidget();

  Widget buildFiles() => FilePlayerWidget();

  Widget buildNetwork() => const NetworkPlayerWidget();
}