import "package:mobx/mobx.dart";

import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";

part "base_stok_edit_seriler_view_model.g.dart";

final class BaseStokEditSerilerViewModel = _BaseStokEditSerilerViewModelBase with _$BaseStokEditSerilerViewModel;

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
  ObservableList<bool> switchValueList =
      [
        StokListesiModel.instance.seriGirislerdeAcik ?? false,
        StokListesiModel.instance.seriGiristeOtomatikMi ?? false,
        StokListesiModel.instance.seriCikislardaAcik ?? false,
        StokListesiModel.instance.seriCikistaOtomatikMi ?? false,
        StokListesiModel.instance.seriBakiyeKontrolu ?? false,
        StokListesiModel.instance.seriMiktarKadarSor ?? false,
      ].asObservable();

  @action
  void changeSwitchValue(int index) {
    switch (index) {
      case 0:
        switchValueList[index] = !switchValueList[index];
        StokListesiModel.instance.seriGirislerdeAcik = switchValueList[index];
        StokListesiModel.instance.seriGirislerdeAcik = switchValueList[index];
      case 1:
        switchValueList[index] = !switchValueList[index];
        StokListesiModel.instance.seriGiristeOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriGiristeOtomatikMi = switchValueList[index];
      case 2:
        switchValueList[index] = !switchValueList[index];
        StokListesiModel.instance.seriCikislardaAcik = switchValueList[index];
        StokListesiModel.instance.seriCikislardaAcik = switchValueList[index];
      case 3:
        switchValueList[index] = !switchValueList[index];
        switchValueList[index + 1] = switchValueList[index] ? false : switchValueList[index + 1];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index + 1];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index + 1];
      case 4:
        switchValueList[index] = !switchValueList[index];
        switchValueList[index - 1] = switchValueList[index] ? false : switchValueList[index - 1];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index];
        StokListesiModel.instance.seriBakiyeKontrolu = switchValueList[index];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index - 1];
        StokListesiModel.instance.seriCikistaOtomatikMi = switchValueList[index - 1];
      case 5:
        switchValueList[index] = !switchValueList[index];
        StokListesiModel.instance.seriMiktarKadarSor = switchValueList[index];
        StokListesiModel.instance.seriMiktarKadarSor = switchValueList[index];
    }
  }
}
