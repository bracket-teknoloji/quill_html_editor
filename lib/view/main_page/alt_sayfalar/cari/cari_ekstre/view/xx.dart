// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:get/get.dart';
// import 'package:kartal/kartal.dart';
// import 'package:mobx/mobx.dart';
// import 'package:picker/core/base/view/pdf_viewer/view/pdf_viewer_view.dart';
// import 'package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart';
// import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
// import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
// import 'package:picker/core/constants/extensions/date_time_extensions.dart';
// import 'package:picker/core/constants/ui_helper/ui_helper.dart';
// import 'package:picker/core/init/cache/cache_manager.dart';
// import 'package:picker/view/main_page/alt_sayfalar/cari/cari_ekstre/view_model/cari_ekstre_view_model.dart';
// import 'package:picker/view/main_page/model/param_model.dart';
// import 'package:share_plus/share_plus.dart';

// import '../../../../../../core/base/state/base_state.dart';
// import '../../../../../../core/components/textfield/custom_text_field.dart';

// class CariEks extends StatefulWidget {
//   const CariEks({super.key});

//   @override
//   State<CariEks> createState() => _CariEksState();
// }

// class _CariEksState extends BaseState<CariEks> {
//   CariEkstreViewModel viewModel = CariEkstreViewModel();
//   TextEditingController? cariController;
//   TextEditingController? dovizController;
//   TextEditingController? baslangicTarihiController;
//   TextEditingController? bitisTarihiController;

//   @override
//   void initState() {
//     cariController = TextEditingController();
//     dovizController = TextEditingController();
//     baslangicTarihiController = TextEditingController();
//     bitisTarihiController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration.zero, () => filterBottomSheet());
//     return Scaffold(appBar: appBar(), body: body());
//   }

//   AppBar appBar() {
//     return AppBar(
//       title: const Text("Cari Ekstre"),
//       actions: [
//         IconButton(
//             onPressed: () {
//               //! EKLENECEK
//               Share.share('Armut', subject: 'Daha eklemedim ama eklenecek');
//             },
//             icon: const Icon(Icons.share_outlined)),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
//       ],
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBarPreferedSizedBottom(
//           children: [
//             AppBarButton(key: const Key("filtrele"), icon: Icons.filter_alt_outlined, onPressed: filterBottomSheet, child: const Text("Filtrele")),
//             AppBarButton(
//                 icon: Icons.print_outlined,
//                 child: const Text("Yazdır"),
//                 onPressed: () async {
//                   List<YaziciList>? yaziciList = CacheManager.getAnaVeri()?.paramModel?.yaziciList;
//                   await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Yazıcı", children: yaziciList!.map((e) => BottomSheetModel(title: e.yaziciAdi ?? "", onTap: () {})).toList());
//                 }),
//             AppBarButton(icon: Icons.picture_as_pdf_outlined, child: const Text("PDF Görüntüle"), onPressed: () {}),
//             AppBarButton(
//                 icon: Icons.mail_outline_outlined,
//                 child: const Text("Mail Gönder"),
//                 onPressed: () {
//                   //! EKLENECEK
//                   Share.share("Armut2", subject: "Burayı da dolduracağız");
//                 }),
//           ],
//         ),
//       ),
//     );
//   }

//   Observer body() {
//     return Observer(builder: (_) {
//       if (viewModel.futureController.status == FutureStatus.rejected) {
//         return const Center(child: CircularProgressIndicator());
//       } else {
//         if (viewModel.futureController.status == FutureStatus.fulfilled) {
//           return PDFViewerView(pdfData: viewModel.pdfModel);
//         } else {
//           return Center(child: Text("Hata \n${viewModel.futureController.error}"));
//         }
//       }
//     });
//   }

//   void filterBottomSheet() {
//     viewModel.resetFuture();
//     bottomSheetDialogManager.showBottomSheetDialog(context,
//         title: "Filtrele",
//         body: Padding(
//           padding: EdgeInsets.all(UIHelper.lowSize),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 50,
//                 width: double.infinity,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: viewModel.childrenTitleList.length,
//                     itemBuilder: (context, listTileIndex) => Observer(
//                         builder: (_) => RadioMenuButton(
//                             style: ButtonStyle(textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12))),
//                             value: listTileIndex,
//                             groupValue: viewModel.groupValue,
//                             onChanged: (index) {
//                               viewModel.changeGroupValue(index ?? 0);
//                               baslangicTarihiController?.text = viewModel.dateMap[viewModel.childrenTitleList[index ?? 0]].toDateStringIfNull() ?? "";
//                               viewModel.pdfModel.dicParams?.bastar = viewModel.dateMap[viewModel.childrenTitleList[index ?? 0]].toDateStringIfNull();
//                               bitisTarihiController?.text = baslangicTarihiController?.text == "" ? "" : DateTime.now().toDateString();
//                               viewModel.pdfModel.dicParams?.bittar = bitisTarihiController?.text == "" ? null : DateTime.now().toDateString();
//                             },
//                             child: Text(viewModel.childrenTitleList[listTileIndex])))),
//               ),
//               CustomTextField(
//                   labelText: "Başlangıç Tarihi",
//                   controller: baslangicTarihiController,
//                   readOnly: true,
//                   suffix: const Icon(Icons.date_range_outlined),
//                   onTap: () async {
//                     var result = await showDatePicker(
//                       context: context,
//                       initialDate: viewModel.pdfModel.dicParams!.bastar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bastar.toDateTimeDDMMYYYY()! : DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: viewModel.pdfModel.dicParams!.bittar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bittar.toDateTimeDDMMYYYY()! : DateTime.now(),
//                       // currentDate: DateFormat("dd.MM.yyyy").parse(baslangicTarihiController?.text ?? DateTime.now().toDateString()),
//                     );
//                     if (result != null) {
//                       baslangicTarihiController?.text = result.toDateString();
//                       viewModel.pdfModel.dicParams?.bastar = result.toDateString();
//                     }
//                   }),
//               CustomTextField(
//                   labelText: "Bitiş Tarihi",
//                   controller: bitisTarihiController,
//                   readOnly: true,
//                   suffix: const Icon(Icons.date_range_outlined),
//                   onTap: () async {
//                     var result = await showDatePicker(
//                       context: context,
//                       initialDate: viewModel.pdfModel.dicParams!.bittar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bittar.toDateTimeDDMMYYYY()! : DateTime.now(),
//                       firstDate: viewModel.pdfModel.dicParams!.bastar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bastar.toDateTimeDDMMYYYY()! : DateTime(2000),
//                       lastDate: DateTime.now(),
//                     );
//                     if (result != null) {
//                       bitisTarihiController?.text = result.toDateString();
//                       viewModel.pdfModel.dicParams?.bittar = result.toDateString();
//                     }
//                   }),
//               CustomTextField(
//                 labelText: "Cari",
//                 controller: cariController,
//                 isMust: true,
//                 readOnly: true,
//                 suffix: const Icon(Icons.more_horiz_outlined),
//                 onTap: () async {
//                   var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
//                   if (result != null) {
//                     cariController!.text = result.cariAdi ?? "";
//                     viewModel.changeCariKodu(result.cariKodu ?? "");
//                   }
//                 },
//               ),
//               CustomTextField(
//                 labelText: "Döviz Tipi",
//                 valueWidget: Observer(builder: (_) => Text(viewModel.dovizValue ?? "")),
//                 controller: dovizController,
//                 isMust: true,
//                 readOnly: true,
//                 suffix: const Icon(Icons.more_horiz_outlined),
//                 onTap: () async {
//                   List<DovizList>? dovizList = CacheManager.getAnaVeri()?.paramModel?.dovizList;
//                   (dovizList?.any((element) => element.dovizKodu == -1) ?? false)
//                       ? null
//                       : dovizList?.insert(
//                           0,
//                           DovizList()
//                             ..isim = "Tümü"
//                             ..dovizKodu = -1);
//                   DovizList? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
//                       title: "Döviz Tipi", children: dovizList!.map((e) => BottomSheetModel(title: e.isim ?? "", onTap: () => Get.back(result: e))).toList());
//                   if (result != null) {
//                     dovizController!.text = result.isim ?? "";
//                     viewModel.changeDovizTipi(result.isim != "TL" ? (result.dovizTipi ?? (result.dovizKodu ?? 0)) : 0);
//                     viewModel.changeDovizValue((result.dovizKodu ?? -1).toString());
//                   }
//                 },
//               ),
//               Observer(builder: (_) {
//                 return ElevatedButton(
//                     onPressed: () {
//                       if (viewModel.pdfModel.dicParams?.cariKodu == null || viewModel.pdfModel.dicParams?.dovizTipi == null) {
//                         dialogManager.showAlertDialog("Lütfen tüm alanları doldurunuz");
//                       } else {
//                         viewModel.setFuture();
//                         Get.back();
//                       }
//                     },
//                     child: const Text("Uygula"));
//               })
//             ],
//           ),
//         ));
//   }
// }
