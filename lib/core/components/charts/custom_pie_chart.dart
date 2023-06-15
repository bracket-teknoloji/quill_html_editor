import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/constants/ui_helper/duration_helper.dart';
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
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: UIHelper.lowPadding,
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minHeight: height * 0.3,
            maxHeight: height * 0.3,
          ),
          child: widget.pieChartValue != null
              ? widget.pieChartValue.isNotNullOrEmpty
                  ? Padding(
                      padding: UIHelper.lowPadding,
                      child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback: (event, pieTouchResponse) {
                                  if (event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                    setState(() {
                                      touchedIndex = -1;
                                    });
                                    return;
                                  }
                                  dialogManager.showSnackBar(widget.pieChartTitle?[pieTouchResponse.touchedSection!.touchedSectionIndex] ??
                                      widget.pieChartValue?[pieTouchResponse.touchedSection!.touchedSectionIndex].toString() ??
                                      '');
                                  touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                                },
                              ),
                              sections: List.generate(widget.pieChartValue?.length ?? 0, (index) {
                                final isTouched = index == touchedIndex;
                                final fontSize = isTouched ? 16.0 : null;
                                final radius = isTouched ? 40.0 : 35.0;
                                return PieChartSectionData(
                                  color: Colors.primaries[index],
                                  titlePositionPercentageOffset: 0.5,
                                  value: widget.pieChartValue?[index] ?? 0,
                                  title: widget.pieChartTitle?[index] ?? widget.pieChartValue?[index].toString() ?? '',
                                  titleStyle: theme.textTheme.labelSmall?.copyWith(fontSize: fontSize),
                                  radius: radius,
                                );
                              })),
                          swapAnimationCurve: Curves.linear,
                          swapAnimationDuration: DurationHelper.durationLow),
                    )
                  : const Center(child: Text("Veri Yok"))
              : const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
