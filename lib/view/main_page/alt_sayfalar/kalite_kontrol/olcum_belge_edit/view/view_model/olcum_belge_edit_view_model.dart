import "dart:developer";

import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_seri_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "olcum_belge_edit_view_model.g.dart";

class OlcumBelgeEditViewModel = _OlcumBelgeEditViewModelBase with _$OlcumBelgeEditViewModel;

abstract class _OlcumBelgeEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  OlcumBelgeModel? requestModel;

  @observable
  OlcumBelgeEditModel? model;

  @observable
  ObservableList<OlcumBelgeModel>? olcumDatListesi;

  @observable
  OlcumSeriRequestModel seriRequestModel = const OlcumSeriRequestModel();

  @observable
  ObservableList<SeriList>? olcumDatResponseListesi;

  @computed
  OlcumBelgeModel? get belgeModel => model?.belge?.firstOrNull;

  @computed
  bool get depolarValidation {
    if (seriRequestModel.girisDepo == null || seriRequestModel.girisDepo == seriRequestModel.cikisDepo) return false;
    return true;
  }

  @action
  void setGirisDepo(DepoList? value) => seriRequestModel = seriRequestModel.copyWith(girisDepo: value?.depoKodu);

  @action
  void setKabulGirisDepo(DepoList? value) => seriRequestModel = seriRequestModel.copyWith(kabulGirisDepo: value?.depoKodu);

  @action
  void setRedGirisDepo(DepoList? value) => seriRequestModel = seriRequestModel.copyWith(redGirisDepo: value?.depoKodu);

  @action
  void setCikisDepo(DepoList? value) => seriRequestModel = seriRequestModel.copyWith(cikisDepo: value?.depoKodu);

  void setSeriListe(List<String>? value) => seriRequestModel = seriRequestModel.copyWith(seriListe: value);

  void setStokKodu(String? value) => seriRequestModel = seriRequestModel.copyWith(stokKodu: value);

  @action
  void setOlcumDatResponseListesi(List<SeriList>? list) => olcumDatResponseListesi = list?.asObservable();

  @action
  void setRequestModel(OlcumBelgeModel reqModel) => requestModel = reqModel;

  @action
  void setOlcumDatListesi(List<OlcumBelgeModel>? list) => olcumDatListesi = list?.asObservable();

  @action
  void setOlcumlerList(List<OlcumOlcumlerModel>? list) => model = model?.copyWith(olcumler: list);

  @action
  Future<void> getDatMiktar() async {
    final result = await networkManager.dioGet(path: ApiUrls.getDatMiktar, bodyModel: SeriList(), data: seriRequestModel.toJson(), showLoading: true);
    if (result.isSuccess) {
      final List<SeriList> data = result.dataList;
      setOlcumDatResponseListesi(data.map((e) => e..seri1 = e.seriNo).toList());
    }
  }

  @action
  Future<void> getData() async {
    model = null;
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumBelgeDetaylar, bodyModel: OlcumBelgeEditModel(), data: requestModel?.forDetayRequest.toJson());
    if (result.isSuccess) {
      final List<OlcumBelgeEditModel> data = result.dataList;
      model = data.firstOrNull;
      log(model?.toJson().toString() ?? "");

      setSeriListe(data.firstOrNull?.olcumler?.map((e) => e.seriNo).toList().nullCheckWithGeneric);
      setStokKodu(data.firstOrNull?.olcumler?.firstOrNull?.stokKodu);
    }
  }

  @action
  Future<List<OlcumOlcumlerModel>?> getOlcumler() async {
    setOlcumlerList(null);
    final result = await networkManager.dioGet(path: ApiUrls.getOlcumler, bodyModel: OlcumOlcumlerModel(), data: model?.belge?.first.forOlcumlerList.toJson());
    if (result.isSuccess) {
      final List<OlcumOlcumlerModel> data = result.dataList;
      setOlcumlerList(data);
      setSeriListe(data.map((e) => e.seriNo).toList().nullCheckWithGeneric);
      setStokKodu(data.firstOrNull?.stokKodu);
    }
    return null;
  }

  @action
  Future<List<OlcumProsesModel>?> getProsesler(int? id) async {
    final result = await networkManager.dioGet(path: ApiUrls.getOlcum, bodyModel: OlcumProsesModel(), showLoading: true, queryParameters: {"id": id});
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  @action
  Future<bool> getOlcumDatListesi() async {
    final result = await networkManager.dioGet(path: ApiUrls.getDatListesi, bodyModel: OlcumBelgeModel(), showLoading: true, data: requestModel?.forDatListesi.toJson());
    if (result.isSuccess) {
      final List<OlcumBelgeModel> data = result.dataList;
      setOlcumDatListesi(data);
    }
    return result.isSuccess;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>?> deleteOlcum(int? id) async => await networkManager.dioGet(path: ApiUrls.olcumSil, bodyModel: OlcumBelgeEditModel(), queryParameters: {"id": id});
}
