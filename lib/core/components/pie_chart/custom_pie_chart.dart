// import 'dart:math';

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// import '../../../view/main_page/alt_sayfalar/temsilci_profil/model/temsilci_profil_model.dart';

// class CustomPieChart extends StatefulWidget {
//   final List<TemsilciProfilModel>? temsilciProfilList;
//   final int? donemKodu;
//   const CustomPieChart({super.key, this.temsilciProfilList, this.donemKodu});

//   @override
//   State<CustomPieChart> createState() => _CustomPieChartState();
// }

// class _CustomPieChartState extends State<CustomPieChart> {
//   @override
//   void initState() {
//     if (widget.temsilciProfilList != null) {
//       widget.temsilciProfilList!.sort((a, b) => a.ayKodu!.compareTo(b.ayKodu!));
//     }
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return PieChart(
//       PieChartData(
//         startDegreeOffset: 0,
//         sections: List.generate(
//           widget.temsilciProfilList!.where((element) => element.ayKodu == widget.donemKodu).map((element) => element.plasiyerAciklama).toSet().length,
//             (index) => PieChartSectionData(
//                   showTitle: false,
//                   badgeWidget: Text(
//                     viewModel.temsilciProfilList!.where((element) => element.ayKodu == viewModel.donemKodu).map((element) => element.plasiyerAciklama).toSet().elementAt(index) ?? "",
//                     style: const TextStyle(color: Colors.white, fontSize: 8),
//                   ),
//                   radius: 30,
//                   borderSide: const BorderSide(color: Colors.white, width: 1),
//                   titlePositionPercentageOffset: 0.9,
//                   color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//                   title: viewModel.temsilciProfilList!.map((element) => element.plasiyerAciklama).toSet().elementAt(index),
//                   titleStyle: const TextStyle(color: Colors.white, fontSize: 8),
//                   value: viewModel.temsilciProfilList!
//                           .where((element) => element.plasiyerAciklama == viewModel.temsilciProfilList!.map((element) => element.plasiyerAciklama).toSet().elementAt(index))
//                           .map((e) => e.tutar)
//                           .reduce((value, element) => value! + element!)
//                           ?.toDouble() ??
//                       0,
//                 )),
//       ),
//       swapAnimationCurve: Curves.bounceIn,
//       swapAnimationDuration: DurationHelper.durationLow,
//     );
//   }
// }
