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
      children: <Widget>[
        Text(title ?? ""),
        if (subtitle != null) SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  subtitle ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: (isSubTitleSmall != null && (isSubTitleSmall ?? false)) ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14),
                ),
              ) else const SizedBox(),
      ],
    );
}
