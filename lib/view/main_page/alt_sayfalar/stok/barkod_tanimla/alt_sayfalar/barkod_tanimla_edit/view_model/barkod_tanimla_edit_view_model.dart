import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/constants/enum/barkod_tipi_enum.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../base_stok_edit/model/save_stok_model.dart";
import "../../../../base_stok_edit/model/stok_olcu_birimleri_model.dart";
import "../../barkod_kayitlari/model/barkod_tanimla_kayitlari_model.dart";

part "barkod_tanimla_edit_view_model.g.dart";

final class BarkodTanimlaEditViewModel = _BarkodTanimlaEditViewModelBase with _$BarkodTanimlaEditViewModel;

abstract class _BarkodTanimlaEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  BarkodTanimlaKayitlariModel model = BarkodTanimlaKayitlariModel();

  @action
  void setStokKodu(String? value) => model = model.copyWith(stokKodu: value);

  @action
  void setBarkod(String? value) => model = model.copyWith(barkod: value);

  @action
  void setBarkodTipi(BarkodTipiEnum? value) =>
      model = model.copyWith(barkodTipi: value?.barkodTipi, barkodTipiAdi: value?.barkodAdi);

  @action
  void setBirim(int? value) => model = model.copyWith(birim: value);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  Future<GenericResponseModel<BarkodTanimlaKayitlariModel>> sendData() async => await networkManager.dioPost(
    path: ApiUrls.saveStok,
    bodyModel: BarkodTanimlaKayitlariModel(),
    showLoading: true,
    data: SaveStokModel()
      ..islemKodu = 4
      ..kodu = model.stokKodu
      ..requestVersion = 1
      ..stokBarkodModel = model,
  );

  @action
  Future<GenericResponseModel<StokOlcuBirimleriModel>> getBarkod() async => await networkManager.dioPost(
    path: ApiUrls.barkodUret,
    bodyModel: StokOlcuBirimleriModel(),
    showLoading: true,
    data: {"StokKodu": model.stokKodu, "BarkodTipi": model.barkodTipi},
  );
}
