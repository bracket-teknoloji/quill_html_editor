import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/view/pdf_viewer/view/pdf_viewer_view.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../../../core/init/cache/cache_manager.dart';
import '../../../../model/param_model.dart';
import '../view_model/cari_ekstre_view_model.dart';

class CariEkstreView extends StatefulWidget {
  const CariEkstreView({super.key});

  @override
  State<CariEkstreView> createState() => _CariEkstreViewState();
}

class _CariEkstreViewState extends BaseState<CariEkstreView> {
  CariEkstreViewModel viewModel = CariEkstreViewModel();
  ScrollController? scrollController;
  TextEditingController? cariController;
  TextEditingController? dovizController;
  TextEditingController? baslangicTarihiController;
  TextEditingController? bitisTarihiController;

  @override
  void initState() {
    cariController = TextEditingController();
    dovizController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    scrollController = ScrollController();
    Future.delayed(const Duration(seconds: 1), () async {
      await scrollController?.animateTo(50, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      await scrollController?.animateTo(scrollController?.position.minScrollExtent ?? 0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
    dovizController?.text = "Tümü";
    viewModel.changeDovizTipi(-1);
    super.initState();
  }

  @override
  void dispose() {
    cariController?.dispose();
    dovizController?.dispose();
    baslangicTarihiController?.dispose();
    bitisTarihiController?.dispose();
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Cari Ekstre", pdfData: viewModel.pdfModel);
    });
  }

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Filtrele",
        body: Padding(
          padding: EdgeInsets.all(UIHelper.lowSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.childrenTitleList.length,
                    itemBuilder: (context, listTileIndex) => Observer(
                        builder: (_) => RadioMenuButton(
                            style: ButtonStyle(textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12))),
                            value: listTileIndex,
                            groupValue: viewModel.groupValue,
                            onChanged: (index) {
                              viewModel.changeGroupValue(index ?? 0);
                              baslangicTarihiController?.text = viewModel.dateMap[viewModel.childrenTitleList[index ?? 0]].toDateStringIfNull() ?? "";
                              viewModel.pdfModel.dicParams?.bastar = viewModel.dateMap[viewModel.childrenTitleList[index ?? 0]].toDateStringIfNull();
                              bitisTarihiController?.text = baslangicTarihiController?.text == "" ? "" : DateTime.now().toDateString();
                              viewModel.pdfModel.dicParams?.bittar = bitisTarihiController?.text == "" ? null : DateTime.now().toDateString();
                            },
                            child: Text(viewModel.childrenTitleList[listTileIndex])))),
              ),
              CustomTextField(
                  labelText: "Başlangıç Tarihi",
                  controller: baslangicTarihiController,
                  readOnly: true,
                  suffix: const Icon(Icons.date_range_outlined),
                  onTap: () async {
                    var result = await showDatePicker(
                      context: context,
                      initialDate: viewModel.pdfModel.dicParams!.bastar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bastar.toDateTimeDDMMYYYY()! : DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: viewModel.pdfModel.dicParams!.bittar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bittar.toDateTimeDDMMYYYY()! : DateTime.now(),
                      // currentDate: DateFormat("dd.MM.yyyy").parse(baslangicTarihiController?.text ?? DateTime.now().toDateString()),
                    );
                    if (result != null) {
                      baslangicTarihiController?.text = result.toDateString();
                      viewModel.pdfModel.dicParams?.bastar = result.toDateString();
                    }
                  }),
              CustomTextField(
                  labelText: "Bitiş Tarihi",
                  controller: bitisTarihiController,
                  readOnly: true,
                  suffix: const Icon(Icons.date_range_outlined),
                  onTap: () async {
                    var result = await showDatePicker(
                      context: context,
                      initialDate: viewModel.pdfModel.dicParams!.bittar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bittar.toDateTimeDDMMYYYY()! : DateTime.now(),
                      firstDate: viewModel.pdfModel.dicParams!.bastar.isNotNullOrNoEmpty ? viewModel.pdfModel.dicParams!.bastar.toDateTimeDDMMYYYY()! : DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (result != null) {
                      bitisTarihiController?.text = result.toDateString();
                      viewModel.pdfModel.dicParams?.bittar = result.toDateString();
                    }
                  }),
              CustomTextField(
                labelText: "Cari",
                controller: cariController,
                isMust: true,
                readOnly: true,
                suffix: const Icon(Icons.more_horiz_outlined),
                onTap: () async {
                  var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                  if (result != null) {
                    cariController!.text = result.cariAdi ?? "";
                    viewModel.changeCariKodu(result.cariKodu ?? "");
                  }
                },
              ),
              CustomTextField(
                labelText: "Döviz Tipi",
                valueWidget: Observer(builder: (_) => Text(viewModel.dovizValue ?? "")),
                controller: dovizController,
                isMust: true,
                readOnly: true,
                suffix: const Icon(Icons.more_horiz_outlined),
                onTap: () async {
                  List<DovizList>? dovizList = CacheManager.getAnaVeri()?.paramModel?.dovizList;
                  (dovizList?.any((element) => element.dovizKodu == -1) ?? false)
                      ? null
                      : dovizList?.insert(
                          0,
                          DovizList()
                            ..isim = "Tümü"
                            ..dovizKodu = -1);
                  DovizList? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Döviz Tipi", children: dovizList!.map((e) => BottomSheetModel(title: e.isim ?? "", onTap: () => Get.back(result: e))).toList());
                  if (result != null) {
                    dovizController!.text = result.isim ?? "";
                    viewModel.changeDovizTipi(result.isim != "TL" ? (result.dovizTipi ?? (result.dovizKodu ?? 0)) : 0);
                    viewModel.changeDovizValue((result.dovizKodu ?? -1).toString());
                  }
                },
              ),
              Observer(builder: (_) {
                return ElevatedButton(
                    onPressed: () {
                      if (viewModel.pdfModel.dicParams?.cariKodu == null || viewModel.pdfModel.dicParams?.dovizTipi == null) {
                        dialogManager.showAlertDialog("Lütfen tüm alanları doldurunuz");
                      } else {
                        viewModel.setFuture();
                        Get.back();
                      }
                    },
                    child: const Text("Uygula"));
              })
            ],
          ),
        ));
    return Future.value(viewModel.futureController.value);
  }
}
