import "dart:developer";

import "package:mobx/mobx.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "../../../../../view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_network_mixin.dart";
import "../../../model/generic_response_model.dart";
import "../../../view_model/mobx_network_mixin.dart";
import "../model/model/dizayn_model.dart";

part "e_belge_gonder_view_model.g.dart";

class EBelgeGonderViewModel = _EBelgeGonderViewModelBase with _$EBelgeGonderViewModel;

abstract class _EBelgeGonderViewModelBase with Store, MobxNetworkMixin {
  _EBelgeGonderViewModelBase({required this.model, required this.siparisEditModel});

  final Map<String, String> senaryoMap = {
    "Temel": "TEM",
    "Ticari": "TIC",
  };

  @observable
  EBelgeListesiModel model;

  @observable
  CariListesiModel? cariModel;

  @observable
  BaseSiparisEditModel siparisEditModel;

  @computed
  Future<CariListesiModel?> get getCariModel async {
    if (cariModel != null) {
      return cariModel;
    } else {
      return cariModel = await getCari();
    }
  }

  @action
  void setModel(EBelgeListesiModel value) => model = value.copyWith(dizaynNo: model.dizaynNo);

  @action
  void setSenaryo(String value) => model = model.copyWith(senaryoTipi: value);

  @action
  void setDizaynNo(int value) => model = model.copyWith(dizaynNo: value);

  @action
  void setDovizOlustur(bool value) => model = model.copyWith(dovizliOlustur: value ? true : null);

  @action
  void setInternetFaturasi(bool value) => model = model.copyWith(internetFaturasi: value ? true : null);

  @action
  void setGonderimSekliEposta(bool value) => model = model.copyWith(gonderimSekliEPosta: value ? true : null);

  @action
  void setEPosta(String? value) => model = model.copyWith(ePosta: value);

  @action
  void setSiparisModel(BaseSiparisEditModel value) => siparisEditModel = value;

  @action
  Future<List<DizaynModel>> getDizayn() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getDizaynlar,
      bodyModel: DizaynModel(),
      showLoading: true,
      queryParameters: {
        "ModulID": siparisEditModel.eArsivSerisindenMi ? 100 : 99,
        "ERPDizaynlari": true,
      },
    );
    if (result.success == true) {
      return result.data.map((e) => e as DizaynModel).toList().cast<DizaynModel>();
    } else {
      return [];
    }
  }

  @action
  Future<CariListesiModel?> getCari() async => cariModel = await networkManager.getCariModel(
        CariRequestModel(
          kod: [model.cariKodu ?? ""],
          belgeTuru: model.belgeTuru,
          eFaturaGoster: true,
          plasiyerKisitiYok: true,
          filterText: "",
        ),
      );

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendTaslak() async {
    final result = await networkManager.dioPost(path: ApiUrls.eBelgeIslemi, bodyModel: model, data: model.taslakGonder.toJson(), showLoading: true);
    if (result.success == true) {
      log("EBelge gönderildi");
    } else {
      log("EBelge gönderilemedi");
    }
    return result;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendSenaryo() async {
    final result = await networkManager.dioPost(path: ApiUrls.eBelgeIslemi, bodyModel: model, data: EBelgeListesiModel.senaryoDegistir(BaseSiparisEditModel.fromEBelgeListesiModel(model)), showLoading: true);
    if (result.success == true) {
      log("EBelge gönderildi");
    } else {
      log("EBelge gönderilemedi");
    }
    return result;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendEBelge() async {
    final result = await networkManager.dioPost(path: ApiUrls.eBelgeIslemi, bodyModel: model, data: model.faturaGonder.toJson(), showLoading: true);
    if (result.success == true) {
      log("EBelge gönderildi");
    } else {
      log("EBelge gönderilemedi");
    }
    return result;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deleteTaslak() async {
    final result = await networkManager.dioPost(path: ApiUrls.eBelgeIslemi, bodyModel: model, data: model.taslakSil.toJson(), showLoading: true);
    if (result.success == true) {
      log("EBelge silindi");
    } else {
      log("EBelge silinemedi");
    }
    return result;
  }
}
