import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart';
import '../model/serbest_rapor_response_model.dart';

part 'serbest_raporlar_view_model.g.dart';

class SerbestRaporlarViewModel = _SerbestRaporlarViewModelBase with _$SerbestRaporlarViewModel;

abstract class _SerbestRaporlarViewModelBase with Store {
  @observable
  List<SerbestRaporResponseModel>? serbestRaporResponseModelList;

  @action
  void changeSerbestRaporResponseModelList(List<SerbestRaporResponseModel> value) {
    serbestRaporResponseModelList = value;
    textEditingControllerList = List.generate(serbestRaporResponseModelList!.length, (index) => TextEditingController(text: serbestRaporResponseModelList![index].deger));
    value.where((element) => element.deger != null).forEach((element) {
      changeDicParams(element.adi!, element.deger!);
    });
  }

  @observable
  List<TextEditingController>? textEditingControllerList;

  @action
  void changeControllerText(String name, String value) => textEditingControllerList![serbestRaporResponseModelList!.indexWhere((element) => element.adi == name)].text = value;

  @action
  void dispose() {
    textEditingControllerList?.forEach((element) {
      element.dispose();
    });
  }

  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Serbest");

  @observable
  Map<String, dynamic> dicParams = {};

  @computed
  DicParams get dicParamsComputed => DicParams.fromJson(dicParams);

  @action
  void changeDicParams(String key, String value) {
    dicParams[key] = value;
    changeControllerText(key, value);
  }

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() {
    pdfModel = pdfModel..dicParams = DicParams.fromJson(dicParams);
    futureController = ObservableFuture.value(true);
  }

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
