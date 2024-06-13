import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_kayitlari/model/barkod_tanimla_kayitlari_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_kayitlari/model/barkod_tanimla_kayitlari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/save_stok_model.dart";

part "barkod_tanimla_kayitlari_view_model.g.dart";

class BarkodTanimlaKayitlariViewModel = _BarkodTanimlaKayitlariViewModelBase with _$BarkodTanimlaKayitlariViewModel;

abstract class _BarkodTanimlaKayitlariViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<BarkodTanimlaKayitlariModel>? barkodTanimlaKayitlari;

  @observable
  BarkodTanimlaKayitlariRequestModel requestModel = BarkodTanimlaKayitlariRequestModel(kayitTipi: "L");

  @action
  void setStokKodu(String? stokKodu) => requestModel = requestModel.copyWith(stokKodu: stokKodu);

  @action
  void setBarkodTanimlaKayitlari(List<BarkodTanimlaKayitlariModel>? list) => barkodTanimlaKayitlari = list?.asObservable();

  @action
  Future<bool> deleteItem(BarkodTanimlaKayitlariModel model) async {
    final result = await networkManager.dioPost(path: ApiUrls.saveStok, showLoading: true, bodyModel: BarkodTanimlaKayitlariModel(), data: SaveStokModel.forDeleteBarkodModel(model));
    return result.isSuccess;
  }

  @action
  Future<void> getData() async {
    setBarkodTanimlaKayitlari(null);
    final result = await networkManager.dioGet(path: ApiUrls.getBarkodlar, bodyModel: BarkodTanimlaKayitlariModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      setBarkodTanimlaKayitlari(result.dataList);
    }
  }
}
