import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

final class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.title,
    this.subtitle,
    this.isSubTitleSmall,
    this.titleStyle,
    this.changeTitle = true,
  });
  final bool changeTitle;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final bool? isSubTitleSmall;

  @override
  Widget build(BuildContext context) {
    if (title case null || "") {
      return const SizedBox.shrink();
    }
    if (changeTitle) {
      return Title(color: UIHelper.primaryColor, title: "${title ?? ""} - Picker", child: titleWidget(context));
    }
    return titleWidget(context);
  }

  Wrap titleWidget(BuildContext context) => Wrap(
    direction: Axis.vertical,
    runAlignment: WrapAlignment.center,
    children: [
      AnimatedTextKit(
        key: Key(title ?? ""),
        animatedTexts: [TypewriterAnimatedText(title ?? "", cursor: "", textStyle: titleStyle)],
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
      ),
      if (subtitle != null)
        SizedBox(
          width:
              context.device.isLargeScreen
                  ? MediaQuery.sizeOf(context).width * 0.35
                  : MediaQuery.sizeOf(context).width * 0.65,
          child: Text(
            subtitle ?? "",
            overflow: TextOverflow.ellipsis,
            style:
                (isSubTitleSmall != null && (isSubTitleSmall ?? false))
                    ? Theme.of(context).textTheme.labelSmall
                    : Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14),
          ),
        ),
    ],
  );
}
