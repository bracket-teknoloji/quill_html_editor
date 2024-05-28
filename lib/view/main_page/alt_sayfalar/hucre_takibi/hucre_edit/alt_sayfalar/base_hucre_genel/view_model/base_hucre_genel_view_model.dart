import "package:mobx/mobx.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

part "base_hucre_genel_view_model.g.dart";

class BaseHucreGenelViewModel = _BaseHucreGenelViewModelBase with _$BaseHucreGenelViewModel;

abstract class _BaseHucreGenelViewModelBase with Store {
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

  @action
  void setSelectedEditTipi(int? index) => selectedEditTipi = valueList[index ?? 0];
}
