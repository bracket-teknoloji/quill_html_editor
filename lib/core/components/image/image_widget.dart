import "package:flutter/material.dart";

import "../../base/state/base_state.dart";
import "../../constants/ui_helper/ui_helper.dart";

class ImageWidget extends StatefulWidget {
  final String? path;
  const ImageWidget({super.key, required this.path});

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
          return ClipRRect(
            borderRadius: UIHelper.lowBorderRadius,
            child: Image.memory(
              snapshot.data!.bytes,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Icon(Icons.camera_alt_outlined, color: theme.iconTheme.color?.withOpacity(0.5), size: UIHelper.midSize * 2));
        } else {
          return Center(child: Icon(Icons.camera_alt_outlined, color: theme.iconTheme.color?.withOpacity(0.5), size: UIHelper.midSize * 2));
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
