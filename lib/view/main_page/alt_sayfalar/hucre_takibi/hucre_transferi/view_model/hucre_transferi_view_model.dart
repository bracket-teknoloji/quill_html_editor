import "package:mobx/mobx.dart";

import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/constants/enum/hucre_takibi_islem_turu_enum.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../stok/paketleme/paketleme_listesi/model/paketleme_listesi_model.dart";
import "../../../stok/paketleme/paketleme_listesi/model/paketleme_listesi_request_model.dart";
import "../model/hucre_transferi_model.dart";

part "hucre_transferi_view_model.g.dart";

final class HucreTransferiViewModel = _HucreTransferiViewModelBase with _$HucreTransferiViewModel;

abstract class _HucreTransferiViewModelBase with Store, MobxNetworkMixin {
  @observable
  HucreTransferiModel model = HucreTransferiModel(islemTuru: HucreTakibiIslemTuruEnum.hucreTransferi.kodu);

  @observable
  bool isStok = true;

  @observable
  PaketlemeListesiRequestModel paketRequestModel = PaketlemeListesiRequestModel(
    menuKodu: "HTAK_HUCT",
    ekranTipi: "R",
    kisitYok: "E",
  );

  @computed
  List<bool> get isStokList => [isStok, !isStok];

  @action
  void setIsStok(bool value) => isStok = value;

  @action
  void setDepoKodu(int? value) => model = model.copyWith(depoKodu: value);

  @action
  void setMiktar(double? value) => model = model.copyWith(miktar: value);

  @action
  void setStokKodu(String? value) => model = model.copyWith(stokKodu: value);

  @action
  void setHucreKodu(String? value) => model = model.copyWith(hucreKodu: value);

  @action
  void setHedefHucre(String? value) => model = model.copyWith(hedefHucre: value);

  @action
  void setPaketKodu(String? value) => model = model.copyWith(paketKodu: value);

  @action
  Future<String?> getPaket(String? paketKodu) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getPaketler,
      bodyModel: PaketlemeListesiModel(),
      data: paketRequestModel.copyWith(depoKodu: model.depoKodu, paketKodu: paketKodu).toJson(),
      showLoading: true,
    );
    if (result.isSuccess) {
      final list = result.dataList;
      setPaketKodu(list.firstOrNull?.kodu);
      return list.firstOrNull?.kodu;
    }
    return null;
  }

  @action
  Future<bool> sendData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveHucreTakibi,
      bodyModel: PaketlemeListesiModel(),
      data: (isStok ? HucreTransferiModel.forStok(model) : HucreTransferiModel.forPaket(model)).toJson(),
      showLoading: true,
    );
    return result.isSuccess;
  }
}
