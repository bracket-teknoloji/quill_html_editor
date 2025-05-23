// ignore_for_file: use_build_context_synchronously

import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_grup_kodu_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../core/base/state/base_state.dart";
import "../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../core/init/network/login/api_urls.dart";
import "../model/serbest_rapor_response_model.dart";
import "../view_model/serbest_raporlar_view_model.dart";

final class SerbestRaporlarView extends StatefulWidget {
  const SerbestRaporlarView({super.key, this.dizaynList, this.cariListesiModel, this.stokListesiModel});
  final NetFectDizaynList? dizaynList;
  final CariListesiModel? cariListesiModel;
  final StokListesiModel? stokListesiModel;

  @override
  State<SerbestRaporlarView> createState() => _SerbestRaporlarViewState();
}

final class _SerbestRaporlarViewState extends BaseState<SerbestRaporlarView> {
  SerbestRaporlarViewModel viewModel = SerbestRaporlarViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    viewModel.setDizaynId(widget.dizaynList?.id);
    // ..setEtiketSayisi(widget.dizaynList?.kopyaSayisi);

    super.initState();
  }

  @override
  void dispose() {
    StaticVariables.instance.serbestDicParams.clear();
    viewModel.textEditingControllerList?.forEach((e) {
      e.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
    builder: (_) => PDFViewerView(
      filterBottomSheet: filterBottomSheet,
      filtreVarMi: !viewModel.serbestRaporResponseModelList.isEmptyOrNull,
      title: widget.dizaynList?.dizaynAdi ?? "Serbest Raporlar",
      serbestMi: true,
      pdfData: viewModel.pdfModel,
    ),
  );

  Future<bool> filterBottomSheet() async {
    if (viewModel.dicParams.isEmpty) {
      await getData();
    }
    viewModel.resetFuture();
    if (viewModel.serbestRaporResponseModelList.isEmptyOrNull) {
      viewModel.setFuture();
    } else {
      await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: loc.generalStrings.filter,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomLayoutBuilder(
                splitCount: 2,
                lastItemExpanded: true,
                children: getCustomTextFields,
              ).paddingAll(UIHelper.lowSize),
              ElevatedButton(
                onPressed: () {
                  //😳 Düzelt kanki
                  if (_formKey.currentState?.validate() ?? false) {
                    log(viewModel.pdfModel.toJsonWithDicParamsMap().toString());
                    StaticVariables.instance.serbestDicParams = viewModel.dicParams;
                    Get.back();
                    viewModel.setFuture();
                  }
                },
                child: Text(loc.generalStrings.apply),
              ).paddingAll(UIHelper.midSize),
            ],
          ),
        ),
      );
    }
    return Future.value(viewModel.futureController.value);
  }

  List<Widget> get getCustomTextFields =>
      viewModel.serbestRaporResponseModelList?.map((e) {
        if (e.tipi == "Date") {
          return CustomTextField(
            labelText: e.aciklama ?? e.adi ?? "",
            controller: viewModel.textEditingControllerList?[viewModel.serbestRaporResponseModelList?.indexOf(e) ?? 0],
            isMust: e.bosGecilebilir != true,
            readOnly: true,
            isDateTime: true,
            // suffix: const Icon(Icons.calendar_today),
            onTap: () async {
              final DateTime? result = await dialogManager.showDateTimePicker(
                initialDate: viewModel
                    .textEditingControllerList?[viewModel.serbestRaporResponseModelList?.indexOf(e) ?? 0]
                    .text
                    .toDateTimeDDMMYYYY(),
              );
              if (result != null) {
                viewModel.changeDicParams(e.adi ?? "", result.toDateString);
              }
            },
          );
        } else if (e.rehberTipi != null) {
          if (e.secmeliPlasiyerMi) {
            viewModel.changeDicParams(
              e.adi ?? "",
              parametreModel.plasiyerList?.map((e) => e.plasiyerKodu).join("; ") ?? "",
            );
          }
          return CustomTextField(
            labelText: e.aciklama ?? e.adi ?? "",
            controller: viewModel.textEditingControllerList?[viewModel.serbestRaporResponseModelList?.indexOf(e) ?? 0],
            valueWidget: e.cokluMu ? null : Observer(builder: (_) => Text(viewModel.dicParams[e.adi ?? ""] ?? "")),
            isMust: e.bosGecilebilir != true,
            readOnly: true,
            suffixMore: true,
            onTap: () => getRehber(e),
          );
        } else {
          return CustomTextField(
            labelText: e.aciklama ?? e.adi ?? "",
            readOnly: e.paramMap != null ? true : null,
            controller: viewModel.textEditingControllerList?[viewModel.serbestRaporResponseModelList!.indexOf(e)],
            valueWidget: e.paramMap == null
                ? null
                : Observer(builder: (_) => Text(viewModel.dicParams[e.adi ?? ""] ?? "")),
            isMust: e.bosGecilebilir != true,
            suffixMore: e.paramMap != null,
            onTap: e.paramMap == null
                ? null
                : () async {
                    final List<BottomSheetModel<MapEntry>> bottomSheetModels = [];
                    e.paramMap?.forEach(
                      (key, value) => bottomSheetModels.add(
                        BottomSheetModel(title: value, value: MapEntry(key, value), description: key),
                      ),
                    );
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog<MapEntry>(
                      context,
                      title: "Seçiniz",
                      groupValue: viewModel.dicParams[e.adi ?? ""],
                      children: bottomSheetModels,
                    );
                    if (result != null) {
                      viewModel.changeDicParams(e.adi ?? "", result.key, controllerValue: result.value);
                    }
                  },
            onChanged: (value) {
              viewModel.changeDicParams(e.adi ?? "", value);
            },
          );
        }
      }).toList() ??
      [];

  Future<void> getRehber(SerbestRaporResponseModel model) async {
    if (model.stokKoduMu || model.cariKoduMu) {
      final String route = "/mainPage/${model.rehberTipi?.toLowerCase()}ListesiOzel";
      final result = await Get.toNamed(route);
      if (result != null) {
        viewModel.changeDicParams(
          model.adi ?? "",
          model.stokKoduMu ? result.stokKodu : result.cariKodu,
          controllerValue: model.stokKoduMu ? result.stokAdi : result.cariAdi,
        );
      }
    } else if (model.plasiyerKoduMu) {
      final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
        context,
        viewModel.pdfModel.dicParams?.plasiyerKodu,
      );
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.plasiyerKodu ?? "", controllerValue: result.plasiyerAciklama);
      }
    } else if (model.secmeliPlasiyerMi) {
      if (viewModel.dicParams[model.adi] == null) {
        viewModel.changeDicParams(
          model.adi ?? "",
          parametreModel.plasiyerList?.map((e) => e.plasiyerKodu).join("; ") ?? "",
        );
      }
      final result = await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(
        context,
        groupValues: (viewModel.dicParams[model.adi] as String?)?.split("; "),
      );
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.map((e) => e.plasiyerKodu).join("; "));
      }
    } else if (model.projeKoduMu) {
      final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
        context,
        viewModel.dicParams[model.adi ?? ""],
      );
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.projeKodu ?? "", controllerValue: result.projeAciklama);
      }
    } else if (model.grupKoduMu) {
      final grupKodList = await networkManager.getGrupKod(
        name: GrupKoduEnum.getByName(model.rehberTipi?.split("_").first ?? ""),
        grupNo: 0,
      );
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog<BaseGrupKoduModel>(
        context,
        title: "Grup Kodu Seçiniz",
        groupValue: viewModel.dicParams["KOD${model.adi?.split("").last}"] ?? "",
        children: grupKodList
            .map(
              (e) =>
                  BottomSheetModel(title: e.grupAdi ?? "", description: e.grupKodu, value: e, groupValue: e.grupKodu),
            )
            .toList(),
      );
      if (result != null) {
        viewModel
          ..changeDicParams(model.adi ?? "", result.grupKodu ?? "")
          ..changeControllerText(model.adi ?? "", result.grupAdi ?? "");
      }
    } else if (model.numaraliGrupKoduMu) {
      final grupKodList = await networkManager.getGrupKod(
        name: GrupKoduEnum.getByName(model.rehberTipi?.split("_").first ?? ""),
        grupNo: int.tryParse(model.rehberTipi!.split("").last) ?? 0,
      );
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog<BaseGrupKoduModel>(
        context,
        title: "Grup Kodu Seçiniz",
        groupValue: viewModel.dicParams["KOD${model.adi?.split("").last}"] ?? "",
        children: grupKodList
            .map(
              (e) =>
                  BottomSheetModel(title: e.grupAdi ?? "", description: e.grupKodu, value: e, groupValue: e.grupKodu),
            )
            .toList(),
      );
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.grupKodu ?? "");
      }
    } else if (model.dovizTipiMi) {
      // var dovizList = CacheManager.getAnaVeri?.paramModel?.dovizList ?? [];
      //  = await bottomSheetDialogManager.showBottomSheetDialog(context,
      //     title: "Döviz Seçiniz", children: dovizList.map((e) => BottomSheetModel(title: e.dovizKodu.toStringIfNotNull ?? "", onTap: () => Get.back(result: e))).toList());
      final result = await bottomSheetDialogManager.showDovizBottomSheetDialog(
        context,
        int.tryParse(viewModel.pdfModel.dicParams?.dovizTipi ?? ""),
      );
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.dovizKodu.toString(), controllerValue: result.isim);
      }
    } else if (model.muhasebeKoduMu) {
      final muhasebeList = await networkManager.dioGet<StokMuhasebeKoduModel>(
        path: ApiUrls.getStokMuhasebeKodlari,
        bodyModel: StokMuhasebeKoduModel(),
      );
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog<StokMuhasebeKoduModel>(
        context,
        title: "Muhasebe Kodu Seçiniz",
        groupValue: viewModel.dicParams[model.adi] ?? "",
        children: muhasebeList.dataList
            .map(
              (e) =>
                  BottomSheetModel(title: e.muhKodu.toString(), groupValue: viewModel.dicParams[e.adi ?? ""], value: e),
            )
            .toList()
            .cast<BottomSheetModel<StokMuhasebeKoduModel>>(),
      );
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.muhKodu.toString());
      }
    } else if (model.cariVKNMi) {
      final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.vergiNumarasi);
      }
    }
  }

  Future<void> getData() async {
    // dialogManager.showLoadingDialog("Lütfen Bekleyiniz");
    final result = await networkManager.dioGet<SerbestRaporResponseModel>(
      path: ApiUrls.getDizaynParametreleri,
      showLoading: true,
      bodyModel: SerbestRaporResponseModel(),
      queryParameters: {"ID": widget.dizaynList?.id},
    );
    if (result.isSuccess) {
      viewModel.changeSerbestRaporResponseModelList(result.dataList);
    }
    // dialogManager.hideAlertDialog;
  }
}
