import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/ui_helper/duration_helper.dart';

class ResponsiveBox extends StatelessWidget {
  const ResponsiveBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: DurationHelper.durationLow, height: context.general.isKeyBoardOpen ? context.dynamicHeight(0.3) : 0);
  }
}
