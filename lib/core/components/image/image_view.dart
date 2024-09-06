import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";

import "../../base/state/base_state.dart";
import "../wrap/appbar_title.dart";
import "image_widget.dart";

class ImageView extends StatefulWidget {
  final String path;
  final String title;
  const ImageView({super.key, required this.path, required this.title});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends BaseState<ImageView> {
  XFile? xfile;
  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: loc.generalStrings.view,
            subtitle: widget.title,
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () async {
          //       xfile = await
          //       await Share.shareXFiles([xfile].nullCheckWithGeneric, subject: "Resim Paylaşımı");
          //     },
          //     icon: const Icon(Icons.share_outlined),
          //   ),
          // ],
        ),
        body: Column(
          children: [
            Expanded(
              child: InteractiveViewer(
                child: Center(
                  child: ImageWidget(path: widget.path),
                ),
              ),
            ),
          ],
        ),
      );
}
