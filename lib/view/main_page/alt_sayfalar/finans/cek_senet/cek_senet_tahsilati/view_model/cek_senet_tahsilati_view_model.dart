import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

import "../model/save_cek_senet_model.dart";

part "cek_senet_tahsilati_view_model.g.dart";

class CekSenetTahsilatiViewModel = _CekSenetTahsilatiViewModelBase with _$CekSenetTahsilatiViewModel;

abstract class _CekSenetTahsilatiViewModelBase with Store, MobxNetworkMixin {
  @observable
  SaveCekSenetModel model = SaveCekSenetModel(islemKodu: 3, yeniKayit: true, tag: "CekSenetBordroModel");

  @observable
  CariListesiModel? cariListesiModel;

  @action
  void setGirisTarihi(DateTime? value) => model = model.copyWith(tarih: value);

  @action
  void setCariKodu(CariListesiModel? value) {
    cariListesiModel = value;
    final List<CekSenetKalemlerModel> list = [];
    for (CekSenetKalemlerModel item in model.kalemler ?? []) {
      list.add(item.copyWith(plasiyerAdi: value?.plasiyerAciklama, plasiyerKodu: value?.plasiyerKodu));
    }
    model = model.copyWith(cariKodu: value?.cariKodu, cariAdi: value?.cariAdi, kalemler: list);
  }

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);

  @action
  void setProjeKodu(BaseProjeModel? value) {
    final List<CekSenetKalemlerModel> list = [];
    for (CekSenetKalemlerModel item in model.kalemler ?? []) {
      list.add(item.copyWith(projeAdi: value?.projeAciklama, projeKodu: value?.projeKodu));
    }
    model = model.copyWith(projeKodu: value?.projeKodu, kalemler: list);
  }

  @action
  void addCekSenetKalemlerModel(CekSenetKalemlerModel? value) {
    if (value != null) {
      model = model.copyWith(kalemler: [...model.kalemler ?? [], value..sira = (model.kalemler?.length ?? 0) + 1]);
    }
  }

  @action
  void removeCekSenetKalemlerModel(CekSenetKalemlerModel? value) {
    if (value != null) {
      model = model.copyWith(kalemler: model.kalemler?.where((element) => element != value).toList());
    }
  }

  @action
  void replaceCekSenetKalemlerModel(CekSenetKalemlerModel? oldValue, CekSenetKalemlerModel? newValue) {
    if (oldValue != null && newValue != null) {
      model = model.copyWith(kalemler: model.kalemler?.map((e) => e == oldValue ? newValue : e).toList());
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<SaveCekSenetModel>(path: ApiUrls.saveCekSenetler, bodyModel: SaveCekSenetModel(), data: model.toJson(), showLoading: true);
}
