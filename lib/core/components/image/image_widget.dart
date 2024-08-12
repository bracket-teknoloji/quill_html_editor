import "package:flutter/material.dart";

import "../../base/state/base_state.dart";
import "../../constants/ui_helper/ui_helper.dart";

class ImageWidget extends StatefulWidget {
  final String? path;
  final void Function()? onTap;
  const ImageWidget({super.key, required this.path, this.onTap});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends BaseState<ImageWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<MemoryImage?>(
      future: networkManager.getImage(widget.path),
      builder: (BuildContext context, AsyncSnapshot<MemoryImage?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasData) {
          return InkWell(
            borderRadius: UIHelper.lowBorderRadius,
            onTap: widget.onTap,
            child: ClipRRect(
              borderRadius: UIHelper.lowBorderRadius,
              child: Image.memory(
                snapshot.data!.bytes,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          );
        } else {
          return const Card(
            child: Icon(Icons.camera_alt_outlined),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
