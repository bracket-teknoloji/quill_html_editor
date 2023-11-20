import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:share_plus/share_plus.dart";

class ImageView extends StatefulWidget {
  final String? path;
  const ImageView({super.key, required this.path});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends BaseState<ImageView> {
  XFile? xfile;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Resimler"),
          actions: [
            IconButton(
              onPressed: () async {
                //share image

                await Share.shareXFiles([xfile].nullCheckWithGeneric, subject: "Resim Paylaşımı");
              },
              icon: const Icon(Icons.share_outlined),
            ),
          ],
        ),
        body: FutureBuilder<MemoryImage?>(
          future: networkManager.getImage(widget.path),
          builder: (BuildContext context, AsyncSnapshot<MemoryImage?> snapshot) {
            if (snapshot.hasData) {
              xfile = XFile.fromData(snapshot.data!.bytes);
              return InteractiveViewer(child: Image.memory(snapshot.data!.bytes));
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      );
}
