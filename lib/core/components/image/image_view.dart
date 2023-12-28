import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/image/image_widget.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:share_plus/share_plus.dart";

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: loc(context).generalStrings.view,
            subtitle: widget.title,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Share.shareXFiles([xfile].nullCheckWithGeneric, subject: "Resim Paylaşımı");
              },
              icon: const Icon(Icons.share_outlined),
            ),
          ],
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
