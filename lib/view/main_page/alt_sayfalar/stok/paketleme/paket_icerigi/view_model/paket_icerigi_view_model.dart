import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/paket_islemler_enum.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paket_icerigi/model/paket_icerigi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_edit_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_request_model.dart";

part "paket_icerigi_view_model.g.dart";

class PaketIcerigiViewModel = _PaketIcerigiViewModelBase with _$PaketIcerigiViewModel;

abstract class _PaketIcerigiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<PaketIcerigiModel>? paketIcerigiListesi;

  @observable
  PaketlemeListesiRequestModel requestModel = PaketlemeListesiRequestModel(ekranTipi: "L", menuKodu: "STOK_PKET");

  @computed
  double get toplamPaketMiktari => paketIcerigiListesi?.fold(0, (sum, item) => (sum ?? 0) + (item.miktar ?? 0)) ?? 0;

  @action
  void setPaketID(int id) => requestModel = requestModel.copyWith(paketId: id);

  @action
  void setPaketIcerigiListesi(List<PaketIcerigiModel>? list) => paketIcerigiListesi = list?.asObservable();

  @action
  Future<void> getData() async {
    setPaketIcerigiListesi(null);
    final result = await networkManager.dioPost(path: ApiUrls.getPaketKalemleri, bodyModel: PaketIcerigiModel(), data: requestModel.toJson());
    if (result.isSuccess) {
      final list = (result.data as List).map((e) => e as PaketIcerigiModel).toList();
      setPaketIcerigiListesi(list);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> deleteItem({int? id, int? paketID}) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.savePaket,
      bodyModel: PaketIcerigiModel(),
      showLoading: true,
      data: PaketlemeEditRequestModel(islemKodu: PaketIslemlerEnum.paketIcerigiSil.islemKodu, kalemId: id, paketId: paketID).toJson(),
    );
    return result;
  }
}
