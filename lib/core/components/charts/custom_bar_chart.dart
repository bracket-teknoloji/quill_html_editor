

import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

import "../../base/state/base_state.dart";

class CustomBarWidget extends StatefulWidget {
  const CustomBarWidget({super.key});

  @override
  State<CustomBarWidget> createState() => _CustomBarWidgetState();
}

class _CustomBarWidgetState extends BaseState<CustomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          
        ]
      )
    );
  }
}