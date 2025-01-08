import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

import "../../base/state/base_state.dart";

final class CustomBarWidget extends StatefulWidget {
  const CustomBarWidget({super.key});

  @override
  State<CustomBarWidget> createState() => _CustomBarWidgetState();
}

final class _CustomBarWidgetState extends BaseState<CustomBarWidget> {
  @override
  Widget build(BuildContext context) => BarChart(BarChartData(barGroups: []));
}
