import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";

import "../../base/state/base_state.dart";
import "../wrap/appbar_title.dart";
import "image_widget.dart";

final class ImageView extends StatefulWidget {
  const ImageView({required this.path, required this.title, super.key});
  final String path;
  final String title;

  @override
  State<ImageView> createState() => _ImageViewState();
}

final class _ImageViewState extends BaseState<ImageView> {
  XFile? xfile;
  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: loc.generalStrings.view, subtitle: widget.title),
      // actions: [
      //   IconButton(
      //     onPressed: () async {
      //       xfile = await
      //       await Share.shareXFiles([xfile].nullCheckWithGeneric, subject: "Resim Paylaşımı");
      //     },
      //     icon: const Icon(Icons.adaptive.share_outlined),
      //   ),
      // ],
    ),
    body: Column(
      children: [
        Expanded(
          child: InteractiveViewer(
            child: Center(child: ImageWidget(path: widget.path)),
          ),
        ),
      ],
    ),
  );
}
