import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";

class ImageWidget extends StatefulWidget {
  final String? path;
  const ImageWidget({super.key,required this.path});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends BaseState<ImageWidget> {
  @override
  Widget build(BuildContext context) => FutureBuilder<MemoryImage?>(
        future: networkManager.getImage(widget.path),
        builder: (BuildContext context, AsyncSnapshot<MemoryImage?> snapshot) {
          if (snapshot.hasData) {
            return Image.memory(snapshot.data!.bytes);
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      );
}
