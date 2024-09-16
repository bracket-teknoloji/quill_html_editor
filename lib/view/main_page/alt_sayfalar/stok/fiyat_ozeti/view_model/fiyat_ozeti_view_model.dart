import "package:mobx/mobx.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../model/stok_fiyat_ozeti_model.dart";
import "../model/stok_fiyat_ozeti_request_model.dart";

part "fiyat_ozeti_view_model.g.dart";

class FiyatOzetiViewModel = _FiyatOzetiViewModelBase with _$FiyatOzetiViewModel;

abstract class _FiyatOzetiViewModelBase with Store, MobxNetworkMixin {
  @observable
  StokFiyatOzetiRequestModel requestModel = StokFiyatOzetiRequestModel();

  @observable
  ObservableList<StokFiyatOzetiModel>? stokFiyatOzetiListesi;

  @computed
  List<String?>? get grupList => stokFiyatOzetiListesi?.map((e) => e.grup).toSet().toList();

  @computed
  Map<String, List<StokFiyatOzetiModel>> get grupMap => {for (final group in grupList ?? []) group: stokFiyatOzetiListesi!.where((e) => e.grup == group).toList()};

  @action
  void setStokFiyatOzetiListesi(List<StokFiyatOzetiModel>? list) => stokFiyatOzetiListesi = list?.asObservable();

  @action
  void setRequestModel(StokFiyatOzetiRequestModel model) => requestModel = model;

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getStokFiyatOzeti, bodyModel: const StokFiyatOzetiModel(), queryParameters: requestModel.toJson());
    if (!result.isSuccess) return;
    setStokFiyatOzetiListesi(result.dataList);
  }
}
