import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";

import "../../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_detay_model.dart";

part "base_stok_edit_genel_view_model.g.dart";

class BaseStokEditGenelViewModel = _BaseStokEditGenelViewModelBase with _$BaseStokEditGenelViewModel;

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
  Future<void> setStokDetayModel(StokDetayModel? value) async {
    if (value != null) {
      stokDetayModel = value;
      StokDetayModel.setInstance(stokDetayModel);
    }
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
  void setMuhasebeKodu(StokMuhasebeKoduModel? model) {
    stokListesiModel = stokListesiModel.copyWith(muhdetayAdi: model?.adi, muhdetayKodu: model?.muhKodu);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet<StokDetayModel>(
      path: ApiUrls.getStokDetay,
      bodyModel: StokDetayModel(),
      addCKey: true,
      addSirketBilgileri: true,
      showLoading: true,
      queryParameters: {
        "stokKodu": stokListesiModel.stokKodu ?? "",
      },
    );
    if (result.isSuccess) {
      stokDetayModel = result.dataList.first;
    }
  }
}
