import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../../auth/model/isletme_model.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_detay_model.dart";
import "../../../model/stok_muhasebe_kodu_model.dart";

part "base_stok_edit_genel_view_model.g.dart";

final class BaseStokEditGenelViewModel = _BaseStokEditGenelViewModelBase with _$BaseStokEditGenelViewModel;

abstract class _BaseStokEditGenelViewModelBase with Store, MobxNetworkMixin {
  @observable
  StokListesiModel stokListesiModel = StokListesiModel.instance;

  @observable
  StokDetayModel stokDetayModel = StokDetayModel.instance;

  @observable
  ObservableMap<int, List<BaseGrupKoduModel>?>? grupKodlariMap = <int, List<BaseGrupKoduModel>?>{}.asObservable();

  @action
  void changeGrupKoduListesi(int grupkodu, List<BaseGrupKoduModel>? value) {
    grupKodlariMap?[grupkodu] = value;
  }

  @action
  void setAdi(String? value) {
    stokListesiModel = stokListesiModel.copyWith(stokAdi: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void setImage(String? value) {
    stokListesiModel = stokListesiModel.copyWith(resimBase64: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void setDepoKodu(int? value) {
    stokListesiModel = stokListesiModel.copyWith(depoKodu: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void setSube(IsletmeModel? value) {
    stokListesiModel = stokListesiModel.copyWith(subeKodu: value?.subeKodu);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void setMuhasebeKodu(StokMuhasebeKoduModel? model) {
    stokListesiModel = stokListesiModel.copyWith(muhdetayAdi: model?.adi, muhdetayKodu: model?.muhKodu);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void setGrupKodu(int index, BaseGrupKoduModel model) {
    switch (index) {
      case 0:
        stokListesiModel = stokListesiModel.copyWith(grupKodu: model.grupKodu, grupTanimi: model.grupAdi);
      case 1:
        stokListesiModel = stokListesiModel.copyWith(kod1: model.grupKodu, kod1Tanimi: model.grupAdi);
      case 2:
        stokListesiModel = stokListesiModel.copyWith(kod2: model.grupKodu, kod2Tanimi: model.grupAdi);
      case 3:
        stokListesiModel = stokListesiModel.copyWith(kod3: model.grupKodu, kod3Tanimi: model.grupAdi);
      case 4:
        stokListesiModel = stokListesiModel.copyWith(kod4: model.grupKodu, kod4Tanimi: model.grupAdi);
      case 5:
        stokListesiModel = stokListesiModel.copyWith(kod5: model.grupKodu, kod5Tanimi: model.grupAdi);
    }
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<StokDetayModel>(
      path: ApiUrls.getStokDetay,
      bodyModel: StokDetayModel(),
      showLoading: true,
      queryParameters: {"stokKodu": stokListesiModel.stokKodu ?? ""},
    );
    if (result.isSuccess) {
      stokDetayModel = result.dataList.first;
    }
  }
}
