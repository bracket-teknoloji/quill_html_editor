import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view/kullanici_haritasi/model/kullanici_haritasi_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

part "kullanici_haritasi_view_model.g.dart";

final class KullaniciHaritasiViewModel = _KullaniciHaritasiViewModelBase with _$KullaniciHaritasiViewModel;

abstract class _KullaniciHaritasiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<KullaniciHaritasiModel>? kullaniciHaritasiList;

  @observable
  ObservableSet<Marker> markerSet = ObservableSet();

  @action
  void addMarker(Marker marker) {
    markerSet.add(marker);
  }

  @action
  void setKullaniciHaritasiList(List<KullaniciHaritasiModel> value) => kullaniciHaritasiList = value.asObservable();
  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getKullaniciHaritasi,
      bodyModel: KullaniciHaritasiModel(),
    );
    if (result.isSuccess) {
      setKullaniciHaritasiList(result.dataList);
    }
  }
}
