import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_detay_model.dart";

part "base_stok_edit_genel_view_model.g.dart";

class BaseStokEditGenelViewModel = _BaseStokEditGenelViewModelBase with _$BaseStokEditGenelViewModel;

abstract class _BaseStokEditGenelViewModelBase with Store {
  @observable
  StokListesiModel? stokListesiModel = StokListesiModel.instance;

  @observable
  StokDetayModel stokDetayModel = StokDetayModel.instance;

  @observable
  ObservableMap<int, List<BaseGrupKoduModel>?>? grupKodlariMap = <int, List<BaseGrupKoduModel>?>{}.asObservable();

  @action
  void changeGrupKoduListesi(int grupkodu, List<BaseGrupKoduModel>? value) {
    grupKodlariMap?[grupkodu] = value;
  }
}
