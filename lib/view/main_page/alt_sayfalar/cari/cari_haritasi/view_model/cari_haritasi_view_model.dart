import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

part "cari_haritasi_view_model.g.dart";

class CariHaritasiViewModel = _CariHaritasiViewModelBase with _$CariHaritasiViewModel;

abstract class _CariHaritasiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<CariListesiModel>? cariList;

  @observable
  bool isLocationEnabled = false;

  @observable
  LatLng? currentPosition;

  @observable
  CariListesiRequestModel requestModel = CariListesiRequestModel(filtreler: [1], menuKodu: "CARI_HARI");

  @action
  void setIsLocationEnabled(bool? value) => isLocationEnabled = value??false;

  @action
  void setCurrentPosition(LatLng? position) => currentPosition = position;

  @action
  void setCariList(List<CariListesiModel>? list) => cariList = list?.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getCariharitasi,
      bodyModel: CariListesiModel(),
      data: requestModel.toJson(),
    );
    if (result.data is List) {
      final List<CariListesiModel> newList = (result.data as List).map((e) => e as CariListesiModel).toList();
      setCariList(newList);
    }
  }
}
