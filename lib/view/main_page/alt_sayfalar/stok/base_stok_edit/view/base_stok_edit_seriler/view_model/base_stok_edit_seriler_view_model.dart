import "package:mobx/mobx.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";

import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../model/stok_detay_model.dart";

part "base_stok_edit_seriler_view_model.g.dart";

class BaseStokEditSerilerViewModel = _BaseStokEditSerilerViewModelBase with _$BaseStokEditSerilerViewModel;

abstract class _BaseStokEditSerilerViewModelBase with Store {
  List<String> labelList = [
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
    StokDetayModel.instance.stokList?.first.seriGirislerdeAcik ?? false,
    StokDetayModel.instance.stokList?.first.seriGiristeOtomatikMi ?? false,
    StokDetayModel.instance.stokList?.first.seriCikislardaAcik ?? false,
    StokDetayModel.instance.stokList?.first.seriCikistaOtomatikMi ?? false,
    StokDetayModel.instance.stokList?.first.seriBakiyeKontrolu ?? false,
    StokDetayModel.instance.stokList?.first.seriMiktarKadarSor ?? false,
  ].asObservable();

  @action
  void changeSwitchValue(int index) {
    switch (index) {
      case 0:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.first.seriGirislerdeAcik = switchValueList[index];
        StokListesiModel.instance.seriGirislerdeAcik = switchValueList[index];
        break;
      case 1:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.first.seriGiristeOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriGiristeOtomatikMi = switchValueList[index];
        break;
      case 2:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.first.seriCikislardaAcik = switchValueList[index];
        StokListesiModel.instance.seriCikislardaAcik = switchValueList[index];
        break;
      case 3:
        switchValueList[index] = !switchValueList[index];
        switchValueList[index + 1] = switchValueList[index] ? false : switchValueList[index + 1];
        StokDetayModel.instance.stokList?.first.seriCikistaOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index];
        break;
      case 4:
        switchValueList[index] = !switchValueList[index];
        switchValueList[index - 1] = switchValueList[index] ? false : switchValueList[index - 1];
        StokDetayModel.instance.stokList?.first.seriBakiyeKontrolu = switchValueList[index];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index];
        break;
      case 5:
        switchValueList[index] = !switchValueList[index];
        StokDetayModel.instance.stokList?.first.seriMiktarKadarSor = switchValueList[index];
        StokListesiModel.instance.seriMiktarKadarSor = switchValueList[index];
        break;
    }
  }
}
