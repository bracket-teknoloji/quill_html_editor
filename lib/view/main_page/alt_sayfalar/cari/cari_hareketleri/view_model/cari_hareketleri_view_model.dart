import "package:collection/collection.dart";
import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_request_model.dart";

import "../../cari_listesi/model/cari_listesi_model.dart";
import "../model/cari_hareketleri_model.dart";

part "cari_hareketleri_view_model.g.dart";

class CariHareketleriViewModel = _CariHareketleriViewModelBase with _$CariHareketleriViewModel;

abstract class _CariHareketleriViewModelBase with Store, MobxNetworkMixin, ListableMixin<CariHareketleriModel>, SearchableMixin {
  @observable
  CariListesiModel? cariListesiModel;
  @observable
  bool isScrollDown = true;

  @action
  void changeScrollDown(bool value) {
    isScrollDown = value;
  }

  @override
  @observable
  ObservableList<CariHareketleriModel>? observableList;

  @override
  @action
  void setObservableList(List<CariHareketleriModel>? value) => observableList = value?.asObservable();

  @observable
  String siralama = "";

  @override
  @observable
  String? searchText = "";

  @action
  Future<void> setSiralama(String value) async {
    siralama = value;
  }

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @action
  void setCariListesiModel(CariListesiModel? value) => cariListesiModel = value;

  @override
  @action
  Future<void> changeSearchBarStatus() async => isSearchBarOpen = !isSearchBarOpen;

  @computed
  double get borclarToplami {
    final data = observableList?.where((element) => element.borc != null);
    if (data?.isNotEmpty ?? false) {
      if (cariListesiModel?.dovizKodu != null) {
        return data!
            .map(
              (e) => e.dovizTuru == cariListesiModel?.dovizKodu ? e.dovizBorc ?? 0 : 0.0,
            )
            .sum;
      } else {
        return data!.map((e) => e.borc ?? 0).sum;
      }
    } else {
      return 0.0;
    }
  }

  @computed
  double get alacaklarToplami {
    final data = observableList?.where((element) => element.alacak != null);
    if (data?.isNotEmpty ?? false) {
      if (cariListesiModel?.dovizKodu != null) {
        return data!
            .map(
              (e) => e.dovizTuru == cariListesiModel?.dovizKodu ? e.dovizAlacak ?? 0 : 0.0,
            )
            .sum;
      } else {
        return data!.map((e) => e.alacak ?? 0).sum;
      }
    } else {
      return 0.0;
    }
  }

  @computed
  double get toplamBakiye {
    final CariHareketleriModel? model = filteredCariHareketleriList
        ?.where(
          (element) =>
              element.tarih ==
              filteredCariHareketleriList?.map((e) => e.tarih).reduce(
                    (value, element) => value!.isAfter(element!) ? value : element,
                  ),
        )
        .firstOrNull;
    if (cariListesiModel?.dovizKodu != null) {
      return model?.dovYuruyenBakiye ?? 0.0;
    } else {
      return model?.yuruyenBakiye ?? 0.0;
    }
  }

  @computed
  double get dovizBorclarToplami {
    final data = filteredCariHareketleriList?.where((element) => element.dovizBorc != null);
    return data!.map((e) => e.dovizBorc ?? 0).sum;
  }

  @computed
  double get dovizAlacaklarToplami {
    final data = filteredCariHareketleriList?.where((element) => element.dovizAlacak != null);
    return data!.map((e) => e.dovizAlacak ?? 0).sum;
  }

  @computed
  ObservableList<CariHareketleriModel>? get filteredCariHareketleriList {
    if (searchText.ext.isNullOrEmpty) {
      return observableList;
    } else {
      return observableList?.where((element) => element.aciklama?.toLowerCase().contains(searchText?.toLowerCase() ?? "") ?? false).toList().asObservable();
    }
  }

  @override
  @action
  Future<void> getData() async {
    if (observableList.ext.isNotNullOrEmpty) {
      setObservableList(null);
      // {"SIRALAMA": siralama, "EkranTipi": "L", "CariKodu": cariListesiModel?.cariKodu ?? ""}
    }
    final result = await networkManager.dioGet<CariHareketleriModel>(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      queryParameters: CariHareketleriRequestModel(siralama: siralama, ekranTipi: "L", cariKodu: cariListesiModel?.cariKodu).toJson(),
      addSirketBilgileri: true,
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }
}
