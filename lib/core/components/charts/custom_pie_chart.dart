import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";

import "../../base/state/base_state.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/duration_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";

final class CustomPieChart extends StatefulWidget {
  final List<String>? pieChartTitle;
  final List<double>? pieChartSelectedValue;
  final List<double>? pieChartValue;
  const CustomPieChart({super.key, this.pieChartValue, this.pieChartTitle, this.pieChartSelectedValue});

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

final class _CustomPieChartState extends BaseState<CustomPieChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.8,
        child: widget.pieChartValue != null
            ? (widget.pieChartValue?.fold(0.0, (double previousValue, double element) => element + previousValue) ?? 0) > 0
                ? Padding(
                    padding: UIHelper.lowPadding,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
                            if (event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                              setState(() {
                                touchedIndex = -1;
                              });
                              return;
                            }
                            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                            if (touchedIndex >= 0) {
                              dialogManager.showInfoSnackBar(
                                "${widget.pieChartTitle?[pieTouchResponse.touchedSection!.touchedSectionIndex] ?? widget.pieChartSelectedValue?[pieTouchResponse.touchedSection!.touchedSectionIndex].toString() ?? ''}\n${widget.pieChartValue?[pieTouchResponse.touchedSection!.touchedSectionIndex].commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              );
                            }
                          },
                        ),
                        sections: List.generate(widget.pieChartValue?.length ?? 0, (int index) {
                          final bool isTouched = index == touchedIndex;
                          final double? fontSize = isTouched ? 16.0 : null;
                          final double radius = isTouched ? 40.0 : 35.0;
                          return PieChartSectionData(
                            color: Colors.primaries[index],
                            titlePositionPercentageOffset: 0.5,
                            showTitle: true,
                            value: widget.pieChartValue?[index] ?? 0,
                            title:
                                "${widget.pieChartTitle?[index] ?? widget.pieChartValue?[index].toString() ?? ""}\n%${(((widget.pieChartValue?[index] ?? 0) / widget.pieChartValue.sum) * 100).round().commaSeparatedWithDecimalDigits(OndalikEnum.oran)}",
                            titleStyle: theme.textTheme.labelSmall?.copyWith(fontSize: fontSize),
                            radius: radius,
                          );
                        }),
                      ),
                      swapAnimationCurve: Curves.linear,
                      swapAnimationDuration: DurationHelper.durationLow,
                    ),
                  )
                : const Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.find_in_page_outlined, size: 50, color: ColorPalette.slateGray),
                          Text("Veri bulunamadı."),
                        ],
                      ),
                    ),
                  )
            : const Center(child: CircularProgressIndicator.adaptive()),
      );
}
