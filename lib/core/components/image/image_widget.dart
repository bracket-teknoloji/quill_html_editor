import "dart:developer";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";
import "package:picker/main.dart";

import "../../base/state/base_state.dart";
import "../../constants/ui_helper/ui_helper.dart";

final class ImageWidget extends StatefulWidget {
  const ImageWidget({required this.path, super.key, this.onTap, this.fit = true});
  final String? path;
  final void Function()? onTap;
  final bool fit;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

final class _ImageWidgetState extends BaseState<ImageWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<MemoryImage?>(
      future: networkManager.getImage(widget.path),
      builder: (context, snapshot) {
        Widget? child;
        if (snapshot.hasData) {
          child = InkWell(
            borderRadius: UIHelper.lowBorderRadius,
            onTap: () {
              widget.onTap?.call();
              log(snapshot.data!.bytes.toString());
              if (kDebugMode) DIManager.read<SewooPrinter>().printImage(snapshot.data!.bytes);
            },
            child: ClipRRect(
              borderRadius: UIHelper.lowBorderRadius,
              child: Container(
                color: theme.colorScheme.onSecondary,
                child: Image.memory(
                  snapshot.data!.bytes,
                  fit: widget.fit ? BoxFit.cover : null,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ),
            ),
          );
        } else {
          child = const Card(elevation: 0, child: Icon(Icons.camera_alt_outlined));
        }
        return AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: child);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
