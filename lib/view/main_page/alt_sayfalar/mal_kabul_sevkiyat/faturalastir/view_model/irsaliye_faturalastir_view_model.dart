import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/edit_fatura_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "irsaliye_faturalastir_view_model.g.dart";

class IrsaliyeFaturalastirViewModel = _IrsaliyeFaturalastirViewModelBase with _$IrsaliyeFaturalastirViewModel;

abstract class _IrsaliyeFaturalastirViewModelBase with Store, MobxNetworkMixin {
  @observable
  EditFaturaModel requestModel = EditFaturaModel(irsaliyedenFatura: true);

  @observable
  BaseSiparisEditModel? model;

  @action
  void setBasiSiparisEditModel(BaseSiparisEditModel? value) {
    model = value;
    requestModel = EditFaturaModel.forIrsaliyelestir(value);
  }

  @action
  void setCari(String? value) => requestModel = requestModel.copyWith(cariKodu: value);

  @action
  void setIrsaliyeNo(String? value) => requestModel = requestModel.copyWith(belgeNo: value);

  @action
  void setFaturaTarihi(DateTime? value) => requestModel = requestModel.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  void setFaturaNo(String? value) => requestModel = requestModel.copyWith(yeniBelgeNo: value);

  @action
  void setResmiFaturaNo(String? value) => requestModel = requestModel.copyWith(resmiBelgeNo: value);

  @action
  Future<String?> getSiradakiBelgeNo(EditTipiEnum value) async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {
        "Seri": null,
        "BelgeTipi": value.rawValue,
        "EIrsaliye": value.irsaliyeMi ? "E" : "H",
        "CariKodu": model?.cariKodu ?? "",
      },
      showLoading: true,
    );
    if (result.success == true) {
      final List<BaseSiparisEditModel> list = (result.data as List).map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
      setFaturaNo(list.firstOrNull?.belgeNo);
      return list.firstOrNull?.belgeNo ?? "";
    }
    return null;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendFatura() async => await networkManager.dioPost(
        path: ApiUrls.saveIrsaliyedenFatura,
        bodyModel: requestModel,
        data: requestModel.toJson(),
        showLoading: true,
      );
}
