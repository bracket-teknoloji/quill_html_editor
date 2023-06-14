import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';

import '../../base/state/base_state.dart';

class CustomPieChart extends StatefulWidget {
  final List<String>? pieChartTitle;
  final List<double>? pieChartValue;
  const CustomPieChart({super.key, this.pieChartValue, this.pieChartTitle});

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends BaseState<CustomPieChart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: UIHelper.lowPadding,
        child: Container(
          constraints: BoxConstraints(
            minHeight: height * 0.3,
            maxHeight: height * 0.3,
          ),
          child: widget.pieChartValue.isNotNullOrEmpty
              ? PieChart(PieChartData(
                  sections: List.generate(
                      widget.pieChartValue?.length ?? 0,
                      (index) => PieChartSectionData(
                            color: Colors.primaries[index],
                            value: widget.pieChartValue?[index] ?? 0,
                            title: widget.pieChartTitle?[index] ?? widget.pieChartValue?[index].toString() ?? '',
                            radius: 50,
                          ))))
              : const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
