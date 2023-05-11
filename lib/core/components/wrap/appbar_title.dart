import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? isSubTitleSmall;
  const AppBarTitle({super.key, this.title, this.subtitle, this.isSubTitleSmall});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(title ?? ""),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            subtitle ?? "",
            overflow: TextOverflow.ellipsis,
            style:
                (isSubTitleSmall != null && (isSubTitleSmall ?? false)) ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14),
          ),
        )
      ],
    );
  }
}
