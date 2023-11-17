import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";

class ImageView extends StatefulWidget {
  final String? path;
  const ImageView({super.key, required this.path});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends BaseState<ImageView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Resimler"),
        ),
        body: FutureBuilder<MemoryImage?>(
          future: networkManager.getImage(widget.path),
          builder: (BuildContext context, AsyncSnapshot<MemoryImage?> snapshot) {
            if (snapshot.hasData) {
              return Image.memory(snapshot.data!.bytes);
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      );
}
