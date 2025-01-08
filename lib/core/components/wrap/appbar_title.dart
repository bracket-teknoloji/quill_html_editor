import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:kartal/kartal.dart";

final class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, this.title, this.subtitle, this.isSubTitleSmall});
  final String? title;
  final String? subtitle;
  final bool? isSubTitleSmall;

  @override
  Widget build(BuildContext context) => Wrap(
        direction: Axis.vertical,
        runAlignment: WrapAlignment.center,
        children: [
          AnimatedTextKit(
            key: Key(title ?? ""),
            animatedTexts: [
              TypewriterAnimatedText(
                title ?? "",
                cursor: "",
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
          ),
          if (subtitle != null)
            SizedBox(
              width: context.device.isLargeScreen ? MediaQuery.sizeOf(context).width * 0.35 : MediaQuery.sizeOf(context).width * 0.65,
              child: Text(
                subtitle ?? "",
                overflow: TextOverflow.ellipsis,
                style: (isSubTitleSmall != null && (isSubTitleSmall ?? false)) ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14),
              ),
            ),
        ],
      );
}
