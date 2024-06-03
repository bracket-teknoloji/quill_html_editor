import "package:mobx/mobx.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "base_hucre_genel_view_model.g.dart";

class BaseHucreGenelViewModel = _BaseHucreGenelViewModelBase with _$BaseHucreGenelViewModel;

abstract class _BaseHucreGenelViewModelBase with Store {
  @observable
  HucreTransferiModel model = SingletonModels.hucreTransferiModel;
  List<EditTipiEnum> valueList = [
    EditTipiEnum.depoTransferi,
    EditTipiEnum.uretim,
    EditTipiEnum.alisIrsaliye,
    EditTipiEnum.alisFatura,
    EditTipiEnum.ambarGirisi,
    EditTipiEnum.paket,
    EditTipiEnum.belgesizIslem,
  ];

  @observable
  EditTipiEnum? selectedEditTipi;

  @computed
  bool get isBelgeVisible => model.belgeGorunsunMu;

  @action
  void setSelectedEditTipi(int? index) {
    selectedEditTipi = valueList[index ?? 0];
    model = model.copyWith(belgeTuru: selectedEditTipi?.rawValue, belgeNo: null);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  void setDepo(DepoList? depo) {
    model = model.copyWith(depoKodu: depo?.depoKodu, depoTanimi: depo?.depoTanimi);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  void setBelge(BelgeRehberiModel? belge) {
    model = model.copyWith(belgeNo: belge?.belgeNo, belgeModel: belge, cariKodu: belge?.cariKodu);
    SingletonModels.hucreTransferiModel = model;
  }
}
