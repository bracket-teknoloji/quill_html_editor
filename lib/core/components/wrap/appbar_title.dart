import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";

class AppBarTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? isCentered;
  final bool? isSubTitleSmall;
  const AppBarTitle({super.key, this.title, this.subtitle, this.isSubTitleSmall, this.isCentered});

  @override
  Widget build(BuildContext context) => Wrap(
        direction: Axis.vertical,
        alignment: isCentered != null && (isCentered ?? false) ? WrapAlignment.center : WrapAlignment.start,
        runAlignment: WrapAlignment.center,
        children: [
          AnimatedTextKit(
            key: Key(title ?? ""),
            animatedTexts: [
              TypewriterAnimatedText(
                title ?? "",
                speed: const Duration(milliseconds: 30),
                curve: Curves.linear,
                cursor: "",
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
          ),
          if (subtitle != null)
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Text(
                subtitle ?? "",
                overflow: TextOverflow.ellipsis,
                style: (isSubTitleSmall != null && (isSubTitleSmall ?? false)) ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14),
              ),
            ),
        ],
      );
}
