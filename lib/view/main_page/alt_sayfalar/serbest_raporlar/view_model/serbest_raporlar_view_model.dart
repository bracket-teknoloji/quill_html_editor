import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";

import "../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../model/serbest_rapor_response_model.dart";

part "serbest_raporlar_view_model.g.dart";

final class SerbestRaporlarViewModel = _SerbestRaporlarViewModelBase with _$SerbestRaporlarViewModel;

abstract class _SerbestRaporlarViewModelBase with Store {
  @observable
  List<SerbestRaporResponseModel>? serbestRaporResponseModelList;

  @action
  void changeSerbestRaporResponseModelList(List<SerbestRaporResponseModel> value) {
    if (StaticVariables.instance.serbestDicParams.isNotEmpty) {
      dicParams = StaticVariables.instance.serbestDicParams.asObservable();
    }
    serbestRaporResponseModelList = value;
    textEditingControllerList ??= List.generate(
      serbestRaporResponseModelList?.length ?? 0,
      (index) => TextEditingController(
        text: StaticVariables.instance.serbestDicParams.keys.contains(serbestRaporResponseModelList?[index].adi ?? "")
            ? StaticVariables.instance.serbestDicParams.entries
                  .firstWhere((element) => element.key == serbestRaporResponseModelList![index].adi)
                  .value
                  .toString()
            : serbestRaporResponseModelList?[index].deger ?? "",
      ),
    );
    value.where((element) => element.deger != null).forEach((element) {
      changeDicParams(element.adi!, element.deger!, changeController: false);
    });
  }

  @observable
  List<TextEditingController>? textEditingControllerList;

  @action
  void changeControllerText(String name, String value) {
    if (kIsWeb) {
      textEditingControllerList![serbestRaporResponseModelList!.indexWhere((element) => element.adi == name)].value =
          TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );
    } else {
      textEditingControllerList![serbestRaporResponseModelList!.indexWhere((element) => element.adi == name)].text =
          value;
    }
  }

  @action
  void dispose() {
    textEditingControllerList?.forEach((element) {
      element.dispose();
    });
  }

  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Serbest", dicParamsMap: {});

  @observable
  ObservableMap<String, dynamic> dicParams = <String, dynamic>{}.asObservable();

  @computed
  DicParams get dicParamsComputed => DicParams.fromJson(dicParams);

  @action
  void changeDicParams(String key, String value, {bool changeController = true, String? controllerValue}) {
    if (int.tryParse(key.split("").last) != null) {
      dicParams = dicParams..["KOD${key.split("").last}"] = value;
    } else {
      dicParams = dicParams..[key] = value;
    }
    if (changeController) {
      changeControllerText(key, controllerValue ?? value);
    }
    pdfModel = pdfModel.copyWith(dicParamsMap: dicParams);
    StaticVariables.instance.serbestDicParams = dicParams;
  }

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() {
    pdfModel = pdfModel.copyWith(dicParamsMap: dicParams);
    futureController = ObservableFuture.value(true);
  }

  @action
  void setEtiketSayisi(int? sayi) => pdfModel = pdfModel.copyWith(etiketSayisi: sayi);
  @action
  void setDizaynId(int? sayi) => pdfModel = pdfModel.copyWith(dizaynId: sayi);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
