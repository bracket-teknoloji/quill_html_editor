import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../uretim_sonu_raporu/model/uretim_sonu_raporu_request_model.dart";
import "../model/uretim_sonu_kaydi_recete_model.dart";

part "uretim_sonu_kaydi_seri_listesi_view_model.g.dart";

class UretimSonuKaydiSeriListesiViewModel = _UretimSonuKaydiSeriListesiViewModelBase with _$UretimSonuKaydiSeriListesiViewModel;

abstract class _UretimSonuKaydiSeriListesiViewModelBase with Store, MobxNetworkMixin, ListableMixin<UskReceteModel> {
  @observable
  @override
  ObservableList<UskReceteModel>? observableList;

  @observable
  KalemModel? kalemModel;

  @observable
  UretimSonuRaporuRequestModel requestModel = UretimSonuRaporuRequestModel(filtreKodu: 1);

  @action
  void setKalem(KalemModel? value) {
    requestModel = requestModel.copyWith(stokKodu: value?.stokKodu);
    kalemModel = value;
  }

  @action
  @override
  void setObservableList(List<UskReceteModel>? list) => observableList = list?.asObservable();

  @override
  @action
  Future<void> resetList() async {
    super.resetList();
    await getData();
  }

  @action
  void updateCard(UskReceteModel model) {
    setObservableList(observableList?.map((e) => model.sira == e.sira ? model : e).toList());
  }

  @action
  @override
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getRecete, bodyModel: UskReceteModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      setObservableList(result.dataList.map((e) => e.copyWith(miktar: (e.miktar ?? 0) * (kalemModel?.miktar ?? 0))).toList()..insert(0, UskReceteModel.fromKalemModel(kalemModel!)));
    }
  }
}
