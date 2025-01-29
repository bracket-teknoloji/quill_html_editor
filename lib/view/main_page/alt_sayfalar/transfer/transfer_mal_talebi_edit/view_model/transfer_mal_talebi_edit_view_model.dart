import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "transfer_mal_talebi_edit_view_model.g.dart";

final class TransferMalTalebiEditViewModel = _TransferMalTalebiEditViewModelBase with _$TransferMalTalebiEditViewModel;

abstract class _TransferMalTalebiEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  BaseSiparisEditModel? model;

  @action
  void setModel(BaseSiparisEditModel value) {
    model = value;
    BaseSiparisEditModel.setInstance(value);
  }

  Future<void> getData(int id) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getDepoTalepleri,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      data: {
        "ID": id,
        "Filtreler": [4],
        "EkranTipi": "D",
      },
    );
    if (!result.isSuccess) return;
    setModel(result.dataList.firstOrNull ?? BaseSiparisEditModel());
    await getKalemler();
  }

  Future<void> getKalemler() async {
    final kalemler = await networkManager.dioPost(
      path: ApiUrls.getDepoTalepKalemleri,
      bodyModel: KalemModel(),
      showLoading: true,
      data: {
        "TalepID": model?.id,
        "Filtreler": [4],
        "EkranTipi": "D",
      },
    );

    if (!kalemler.isSuccess) return;
    setModel(model!.copyWith(kalemler: kalemler.dataList));
  }

  @action
  Future<bool> save(bool isEkle) async {
    final newModel = BaseSiparisEditModel.instance;
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: KalemModel(),
      showLoading: true,
      data: {
        "ACIKLAMA": newModel.aciklama,
        "BELGE_NO": newModel.belgeNo,
        "BELGE_TIPI": "IE",
        "DEPO_KODU": newModel.depoKodu,
        "ID": newModel.id,
        "ISLEM_KODU": isEkle ? 1 : 2,
      }..addAll(isEkle ? {"KALEM_LIST": newModel.kalemler} : {}),
    );
    return result.isSuccess;
  }
}
