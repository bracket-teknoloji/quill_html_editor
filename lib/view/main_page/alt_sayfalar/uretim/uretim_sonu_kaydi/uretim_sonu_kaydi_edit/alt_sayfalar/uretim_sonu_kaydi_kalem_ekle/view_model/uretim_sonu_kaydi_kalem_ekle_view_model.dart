import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "uretim_sonu_kaydi_kalem_ekle_view_model.g.dart";

final class UretimSonuKaydiKalemEkleViewModel = _UretimSonuKaydiKalemEkleViewModelBase
    with _$UretimSonuKaydiKalemEkleViewModel;

abstract class _UretimSonuKaydiKalemEkleViewModelBase with Store {
  @observable
  KalemModel model = KalemModel();

  @action
  void setModel(KalemModel value) => model = value;

  @action
  void setIsEmri(String value) => model.isemriNo = value;

  @action
  void setMamul(StokListesiModel? value) => model = model.copyWith(stokKodu: value?.stokKodu, stokAdi: value?.stokAdi);

  @action
  void setMiktar(double? miktar) => model.miktar = miktar;

  @action
  void setHurdaMiktar(double? hurdaMiktar) => model.miktar2 = hurdaMiktar;

  @action
  void setAciklama(String value) => model.aciklama = value;

  @action
  void setEkAlan1(String value) => model.ekalan1 = value;

  @action
  void setEkAlan2(String value) => model.ekalan2 = value;
}
