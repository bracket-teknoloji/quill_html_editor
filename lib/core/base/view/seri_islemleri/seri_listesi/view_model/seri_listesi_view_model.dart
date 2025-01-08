import "package:mobx/mobx.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

import "../model/seri_uret_model.dart";

part "seri_listesi_view_model.g.dart";

final class SeriListesiViewModel = _SeriListesiViewModelBase with _$SeriListesiViewModel;

abstract class _SeriListesiViewModelBase with Store, MobxNetworkMixin {
  _SeriListesiViewModelBase(this.kalemModel);
  @observable
  late KalemModel kalemModel;

  @observable
  StokListesiModel? stokModel;

  @computed
  int get hareketMiktari => (kalemModel.miktar ?? 0).toInt();

  @computed
  int get kalanMiktar => hareketMiktari - (kalemModel.seriList?.map((e) => e.miktar).sum.toInt() ?? 0);

  @action
  void setKalemModel(KalemModel model) => kalemModel = model;

  @action
  void addSeriList(SeriList model) => kalemModel = kalemModel.copyWith(seriList: [...?kalemModel.seriList, model]);

  @action
  void updateSeriList(SeriList model, String seri1) {
    final SeriList? newSeriList = kalemModel.seriList?.firstWhere((element) => element.seri1 == seri1);
    if (newSeriList != null) {
      kalemModel = kalemModel.copyWith(seriList: kalemModel.seriList?.map((element) => element.seri1 == seri1 ? model : element).toList());
    }
  }

  @action
  void removeSeriList(String seri1) {
    kalemModel = kalemModel.copyWith(seriList: kalemModel.seriList?.where((element) => element.seri1 != seri1).toList());
  }

  @action
  Future<void> getStok() async {
    final result = await networkManager.getStokModel(StokRehberiRequestModel.fromKalemModel(kalemModel));
    if (result != null) {
      stokModel = result;
    }
  }

  @action
  Future<SeriUretModel?> seriNoUret() async {
    final result = await networkManager.dioPost(path: ApiUrls.seriNoUret, bodyModel: SeriUretModel(), queryParameters: {"StokKodu": stokModel?.stokKodu});
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }
}
