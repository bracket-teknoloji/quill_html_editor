import "package:mobx/mobx.dart";

import "../../../../../init/network/login/api_urls.dart";
import "../../../../view_model/mobx_network_mixin.dart";
import "../../seri_hareketleri/model/seri_hareketleri_model.dart";

part "seri_girisi_view_model.g.dart";

final class SeriGirisiViewModel = _SeriGirisiViewModelBase with _$SeriGirisiViewModel;

abstract class _SeriGirisiViewModelBase with Store, MobxNetworkMixin {
  @observable
  SeriHareketleriModel seriHareketleriModel = SeriHareketleriModel(
    requestVersion: 2,
    gckod: "G",
    islemKodu: 7,
  );

  @action
  void setSeriHareketleriModel(SeriHareketleriModel model) => seriHareketleriModel = model;

  @action
  void setStokKodu(String? stokKodu) => seriHareketleriModel = seriHareketleriModel.copyWith(stokKodu: stokKodu);

  @action
  void setDepoKodu(int? depoKodu) => seriHareketleriModel = seriHareketleriModel.copyWith(depoKodu: depoKodu);

  @action
  void setSeri1(String? seri1) => seriHareketleriModel = seriHareketleriModel.copyWith(seri1: seri1);

  @action
  void setSeri2(String? seri2) => seriHareketleriModel = seriHareketleriModel.copyWith(seri2: seri2);

  @action
  void setGcKod(String? gckod) => seriHareketleriModel = seriHareketleriModel.copyWith(gckod: gckod);

  @action
  void setAciklama1(String? aciklama1) => seriHareketleriModel = seriHareketleriModel.copyWith(acik1: aciklama1);

  @action
  void setAciklama2(String? aciklama2) => seriHareketleriModel = seriHareketleriModel.copyWith(acik2: aciklama2);

  @action
  void setMiktar(double? miktar) => seriHareketleriModel = seriHareketleriModel.copyWith(miktar: miktar);

  @action
  void setHareketAciklama(String? hareketAciklama) => seriHareketleriModel = seriHareketleriModel.copyWith(haracik: hareketAciklama);

  @action
  void setBelgeNo(String? belgeNo) => seriHareketleriModel = seriHareketleriModel.copyWith(belgeNo: belgeNo);

  @action
  void increaseMiktar() => seriHareketleriModel = seriHareketleriModel.copyWith(miktar: (seriHareketleriModel.miktar ?? 0) + 1);

  @action
  void decreaseMiktar() {
    if (seriHareketleriModel.miktar == 0 || seriHareketleriModel.miktar == null) return;
    seriHareketleriModel = seriHareketleriModel.copyWith(miktar: (seriHareketleriModel.miktar ?? 0) - 1);
  }

  @action
  Future<bool> postData() async {
    final result = await networkManager.dioPost(path: ApiUrls.saveSeriHareketi, bodyModel: SeriHareketleriModel(), data: seriHareketleriModel.toJson());
    return result.isSuccess;
  }
}
