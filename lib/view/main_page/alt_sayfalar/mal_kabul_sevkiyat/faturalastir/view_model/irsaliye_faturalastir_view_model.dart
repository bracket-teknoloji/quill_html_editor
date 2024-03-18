import "package:mobx/mobx.dart";
import "package:picker/core/base/model/edit_fatura_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "irsaliye_faturalastir_view_model.g.dart";

class IrsaliyeFaturalastirViewModel = _IrsaliyeFaturalastirViewModelBase with _$IrsaliyeFaturalastirViewModel;

abstract class _IrsaliyeFaturalastirViewModelBase with Store, MobxNetworkMixin {
  @observable
  EditFaturaModel requestModel = EditFaturaModel(irsaliyedenFatura: true);

  @observable
  BaseSiparisEditModel? model;

  @action
  void setBasiSiparisEditModel(BaseSiparisEditModel? value) => model = value;

  @action
  void setCari(String? value) => requestModel = requestModel.copyWith(cariKodu: value);

  @action
  void setIrsaliyeNo(String? value) => requestModel = requestModel.copyWith(belgeNo: value);

  @action
  void setFaturaTarihi(DateTime? value) => requestModel = requestModel.copyWith(tarih: value);

  @action
  void setFaturaNo(String? value) => requestModel = requestModel.copyWith(yeniBelgeNo: value);

  @action
  void setResmiFaturaNo(String? value) => requestModel = requestModel.copyWith(resmiBelgeNo: value);

  // @action
  // Future<String> getSiradakiBelgeNo() async {
  //   final result = await networkManager.dioGet<BaseSiparisEditModel>(
  //     path: ApiUrls.getSiradakiBelgeNo,
  //     bodyModel: BaseSiparisEditModel(),
  //     queryParameters: {
  //       "Seri": null,
  //       "BelgeTipi": model.editTipiEnum?.rawValue,
  //       "EIrsaliye": model.editTipiEnum.irsaliyeMi ? "E" : "H",
  //       "CariKodu": model.cariKodu ?? "",
  //     },
  //     showLoading: true,
  //   );
  //   if (result.success == true) {
  //     final List<BaseSiparisEditModel> list = (result.data as List).map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
  //     // BaseSiparisEditModel.instance.belgeNo = list.firstOrNull?.belgeNo;
  //     viewModel.setBelgeNo(list.firstOrNull?.belgeNo);
  //     _belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
  //   }
  // }
}
