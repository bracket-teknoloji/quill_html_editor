import "package:mobx/mobx.dart";

import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/constants/extensions/iterable_extensions.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../model/depo_bakiye_durumu_model.dart";

part "depo_bakiye_durumu_view_model.g.dart";

class DepoBakiyeDurumuViewModel = _DepoBakiyeDurumuViewModelBase with _$DepoBakiyeDurumuViewModel;

abstract class _DepoBakiyeDurumuViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<DepoBakiyeDurumuModel>? depoBakiyeDurumuList;

  @observable
  DicParams dicParams = DicParams(belgeNo: "");

  @computed
  List<String>? get subeAdiList => depoBakiyeDurumuList?.map((e) => e.subeAdi ?? "").toSet().toList();

  @computed
  double get toplamGiris => depoBakiyeDurumuList?.where((element) => element.depoKodu == 0).map((element) => element.giris).sum ?? 0;

  @computed
  double get toplamCikis => depoBakiyeDurumuList?.where((element) => element.depoKodu == 0).map((element) => element.cikis).sum ?? 0;

  @computed
  double get toplamBakiye => depoBakiyeDurumuList?.where((element) => element.depoKodu == 0).map((element) => element.bakiye).sum ?? 0;

  @action
  void setSifirHaric(bool? sifirHaric) => dicParams = dicParams.copyWith(sifirHaric: sifirHaric == true ? "E" : "H");

  @action
  void setStokKodu(String? stokKodu) => dicParams = dicParams.copyWith(stokKodu: stokKodu);

  @action
  void setDepoBakiyeDurumuList(List<DepoBakiyeDurumuModel>? list) => depoBakiyeDurumuList = list?.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getStokDepoDurum,
      bodyModel: const DepoBakiyeDurumuModel(),
      queryParameters: {"StokKodu": dicParams.stokKodu, "SifirHaric": dicParams.sifirHaric},
      showLoading: true,
    );
    if (result.isSuccess) {
      setDepoBakiyeDurumuList(result.dataList);
    }
  }
}
