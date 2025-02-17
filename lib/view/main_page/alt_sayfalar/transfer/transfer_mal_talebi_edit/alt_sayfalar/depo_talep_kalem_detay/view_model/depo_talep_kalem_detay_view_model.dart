import "package:mobx/mobx.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "depo_talep_kalem_detay_view_model.g.dart";

class DepoTalepKalemDetayViewModel = _DepoTalepKalemDetayViewModelBase with _$DepoTalepKalemDetayViewModel;

abstract class _DepoTalepKalemDetayViewModelBase with Store, MobxNetworkMixin {
  @observable
  KalemModel model = KalemModel();

  StokListesiModel? stokModel;

  Future<void> getStokModel() async {
    final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: model.stokKodu));
    if (result != null) {
      stokModel = result;
    }
  }

  @action
  void setModel(KalemModel value) => model = value;

  @action
  void setOlcuBirimi(OlcuBirimiRecord value) =>
      model = model.copyWith(olcuBirimKodu: value.kodu, olcuBirimiAdi: value.adi);

  @action
  void setMiktar(double? value) => model = model.copyWith(miktar: value, miktar2: value);

  @action
  void setAciklama(String value) => model = model.copyWith(aciklama: value);

  // @action
  // void setOlcuBirimiAdi(String value) => model = model.copyWith(olcuBirimKodu: value);

  @action
  Future<bool> save() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getDepoTalepKalemleri,
      bodyModel: KalemModel(),
      showLoading: true,
      data: model.copyWith(islemKodu: 4, talepId: BaseSiparisEditModel.instance.id).toJson(),
    );
    return result.isSuccess;
  }
}
