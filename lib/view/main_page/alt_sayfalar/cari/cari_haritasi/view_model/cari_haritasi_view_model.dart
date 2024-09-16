import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:mobx/mobx.dart";
import "../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";

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
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @observable
  ObservableSet<Marker> markerSet = ObservableSet();

  @observable
  CariListesiRequestModel requestModel = CariListesiRequestModel(filtreler: [1], menuKodu: "CARI_HARI");

  @action
  void setIsLocationEnabled(bool? value) => isLocationEnabled = value ?? false;

  @action
  void setCurrentPosition(LatLng? position) => currentPosition = position;

  @action
  void addMarker(Marker marker) {
    markerSet.add(marker);
  }

  // @action
  // Future<void> setMarker(CariListesiModel model) async {
  //   markerIcon = await Column(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Card(
  //         child: Text(
  //           model.cariAdi ?? "",
  //         ),
  //       ),
  //       Assets.splash.mapMarker.image(height: 30),
  //     ],
  //   ).toBitmapDescriptor();
  // }

  @action
  void setCariList(List<CariListesiModel>? list) => cariList = list?.asObservable();

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getCariharitasi,
      bodyModel: CariListesiModel(),
      data: requestModel.toJson(),
    );
    if (result.isSuccess) {
      setCariList(result.dataList);
    }
  }
}
