import "package:mobx/mobx.dart";

import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_detay_model.dart";

part "base_stok_edit_seriler_view_model.g.dart";

class BaseStokEditSerilerViewModel = _BaseStokEditSerilerViewModelBase with _$BaseStokEditSerilerViewModel;

abstract class _BaseStokEditSerilerViewModelBase with Store {
  final List<String> labelList = [
    "Girişte Seri aktif",
    "Girişte Seri Otomatik",
    "Çıkışta Seri aktif",
    "Çıkışta Seri Otomatik",
    "Seri Bakiye Kontrolü",
    "Miktar Kadar Seri Sor",
  ];
  CariListesiModel? cariListesiModel = CariListesiModel.instance;
  @observable
  ObservableList<bool> switchValueList = [
    StokDetayModel.instance.stokList?.firstOrNull?.seriGirislerdeAcik ?? false,
    StokDetayModel.instance.stokList?.firstOrNull?.seriGiristeOtomatikMi ?? false,
    StokDetayModel.instance.stokList?.firstOrNull?.seriCikislardaAcik ?? false,
    StokDetayModel.instance.stokList?.firstOrNull?.seriCikistaOtomatikMi ?? false,
    StokDetayModel.instance.stokList?.firstOrNull?.seriBakiyeKontrolu ?? false,
    StokDetayModel.instance.stokList?.firstOrNull?.seriMiktarKadarSor ?? false,
  ].asObservable();

  @action
  void changeSwitchValue(int index) {
    switch (index) {
      case 0:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.firstOrNull?.seriGirislerdeAcik = switchValueList[index];
        StokListesiModel.instance.seriGirislerdeAcik = switchValueList[index];
      case 1:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.firstOrNull?.seriGiristeOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriGiristeOtomatikMi = switchValueList[index];
      case 2:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.firstOrNull?.seriCikislardaAcik = switchValueList[index];
        StokListesiModel.instance.seriCikislardaAcik = switchValueList[index];
      case 3:
        switchValueList[index] = !switchValueList[index];
        switchValueList[index + 1] = switchValueList[index] ? false : switchValueList[index + 1];
        StokDetayModel.instance.stokList?.firstOrNull?.seriCikistaOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index];
        StokDetayModel.instance.stokList?.firstOrNull?.seriBakiyeKontrolu = switchValueList[index + 1];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index + 1];
      case 4:
        switchValueList[index] = !switchValueList[index];
        switchValueList[index - 1] = switchValueList[index] ? false : switchValueList[index - 1];
        StokDetayModel.instance.stokList?.firstOrNull?.seriBakiyeKontrolu = switchValueList[index];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index];
        StokDetayModel.instance.stokList?.firstOrNull?.seriCikistaOtomatikMi = switchValueList[index - 1];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index - 1];
      case 5:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.firstOrNull?.seriMiktarKadarSor = switchValueList[index];
        StokListesiModel.instance.seriMiktarKadarSor = switchValueList[index];
    }
  }
}
