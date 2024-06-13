import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_kayitlari/model/barkod_tanimla_kayitlari_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/save_stok_model.dart";

part "barkod_tanimla_edit_view_model.g.dart";

class BarkodTanimlaEditViewModel = _BarkodTanimlaEditViewModelBase with _$BarkodTanimlaEditViewModel;

abstract class _BarkodTanimlaEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  BarkodTanimlaKayitlariModel model = BarkodTanimlaKayitlariModel();

  @action
  void setStokKodu(String? value) => model = model.copyWith(stokKodu: value);

  @action
  void setBarkod(String? value) => model = model.copyWith(barkod: value);

  @action
  void setBarkodTipi(String? value) => model = model.copyWith(barkodTipi: value);

  @action
  void setBirim(int? value) => model = model.copyWith(birim: value);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendData() async => await networkManager.dioPost(
        path: ApiUrls.saveStok,
        bodyModel: BarkodTanimlaKayitlariModel(),
        showLoading: true,
        data: SaveStokModel()
          ..islemKodu = 4
          ..kodu = model.stokKodu
          ..requestVersion = 1
          ..stokBarkodModel = model,
      );
}
