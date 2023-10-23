import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:kartal/kartal.dart";

import "../../base/state/base_state.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/duration_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";

class CustomLineChart extends StatefulWidget {
  final List<double>? lineChartValue;
  const CustomLineChart({super.key, this.lineChartValue});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends BaseState<CustomLineChart> {
  final List<String> months = [
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık",
  ];

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.8,
        child: widget.lineChartValue.ext.isNotNullOrEmpty
            ? LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: UIHelper.primaryColor,
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      tooltipRoundedRadius: 8,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) => touchedBarSpots.map((barSpot) {
                        final flSpot = barSpot;
                        return LineTooltipItem(
                          flSpot.y.commaSeparatedWithDecimalDigits(
                            OndalikEnum.tutar,
                          ),
                          TextStyle(
                            color: flSpot.bar.color,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            TextSpan(
                              text: " $mainCurrency",
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      rotateAngle: 0.5,
                      tooltipPadding: const EdgeInsets.all(5),
                    ),
                  ),
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: true,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: topTitleWidgets,
                        interval: 1,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitleWidgets,
                        interval: 1,
                      ),
                    ),
                    rightTitles: const AxisTitles(axisNameWidget: Text("")),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: leftTitleWidgets,
                      ),
                    ),
                  ),
                  minX: 0,
                  maxX: (widget.lineChartValue?.length.toDouble() ?? 0) - 1,
                  minY: 0,
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.lineChartValue.ext.isNotNullOrEmpty
                          ? List.generate(
                              widget.lineChartValue?.length ?? 0,
                              (index) => FlSpot(
                                index.toDouble(),
                                widget.lineChartValue?[index] ?? 0,
                              ),
                            )
                          : [],
                      show: true,
                      preventCurveOverShooting: true,
                      isCurved: true,
                      curveSmoothness: 0.5,
                      isStrokeJoinRound: true,
                      barWidth: 2,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: Colors.primaries.sublist(0, widget.lineChartValue?.length ?? 0),
                      ),
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (
                          FlSpot spot,
                          double xPercentage,
                          LineChartBarData bar,
                          int index,
                        ) =>
                            FlDotCirclePainter(
                          radius: 4,
                          color: Colors.transparent,
                          strokeWidth: 2,
                          strokeColor: Colors.primaries[index],
                        ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight,
                          colors: Colors.primaries.sublist(0, widget.lineChartValue?.length ?? 0).map((e) => e.withOpacity(0.3)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                curve: Curves.linear,
                duration: DurationHelper.durationLow,
              )
            : const SizedBox(),
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text("Ocak", style: style);
      case 1:
        text = const Text("Şubat", style: style);
      case 2:
        text = const Text("Mart", style: style);
      case 3:
        text = const Text("Nisan", style: style);
      case 4:
        text = const Text("Mayıs", style: style);
      case 5:
        text = const Text("Haziran", style: style);
      case 6:
        text = const Text("Temmuz", style: style);
      case 7:
        text = const Text("Ağustos", style: style);
      case 8:
        text = const Text("Eylül", style: style);
      case 9:
        text = const Text("Ekim", style: style);
      case 10:
        text = const Text("Kasım", style: style);
      case 11:
        text = const Text("Aralık", style: style);
      default:
        text = const Text("", style: style);
        break;
    }
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(340 / 360),
      child: SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    return Text(
      "${(value ~/ 1000).toStringIfNotNull ?? ""}k ",
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget topTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(340 / 360),
      child: Text(
        " ${widget.lineChartValue![value.toInt()].commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
        style: style,
        textAlign: TextAlign.left,
      ),
    );
  }
}
