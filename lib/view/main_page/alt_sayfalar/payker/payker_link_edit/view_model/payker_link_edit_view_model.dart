import "dart:developer";

import "package:collection/collection.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_firma_bayi_listesi/model/payker_drop_down_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_link_edit/model/payker_link_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/taksit_response_model.dart";

part "payker_link_edit_view_model.g.dart";

class PaykerLinkEditViewModel = _PaykerLinkEditViewModelBase with _$PaykerLinkEditViewModel;

abstract class _PaykerLinkEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  PaykerLinkEditModel paykerLinkEditModel = const PaykerLinkEditModel();

  @observable
  ObservableList<TaksitResponseModel>? taksitResponseModel;

  @observable
  ObservableList<Taksitler> selectedTaksitler = ObservableList<Taksitler>();

  @action
  void setSelectedTaksitler(Taksitler taksit, bool isSelected) {
    if (!selectedTaksitler.any((element) => element.taksit == taksit.taksit && element.banka?.id == taksit.banka?.id)) {
      selectedTaksitler.add(taksit);
    } else {
      log(
        "Taksitler listesinde zaten mevcut: ${taksit.id}"
        "\n"
        "${selectedTaksitler.map((e) => e.id).join(", ")}",
      );
      selectedTaksitler.removeWhere(
        (element) => element.taksit == taksit.taksit && element.banka?.id == taksit.banka?.id,
      );
    }
  }

  @action
  void setTaksitler(List<TaksitResponseModel>? taksitler) => taksitResponseModel = taksitler?.asObservable();

  @action
  void setBayi(PaykerFirmaModel model) =>
      paykerLinkEditModel = paykerLinkEditModel.copyWith(bayiId: int.tryParse(model.id ?? "0"));

  @action
  void setTutar(double? tutar) {
    paykerLinkEditModel = paykerLinkEditModel.copyWith(tutar: tutar);
    getInstallments();
  }

  @action
  void setEmail(String? email) => paykerLinkEditModel = paykerLinkEditModel.copyWith(email: email);

  @action
  void setUnvan(String? unvan) => paykerLinkEditModel = paykerLinkEditModel.copyWith(unvan: unvan);

  @action
  void setBitTar(DateTime? bitTar) => paykerLinkEditModel = paykerLinkEditModel.copyWith(bittar: bitTar);

  @action
  void setModel(PaykerLinkEditModel model) {
    selectedTaksitler = ObservableList<Taksitler>.of(
      model.getTaksitlerFromJson().map(
        (e) => e.copyWith(
          id: taksitResponseModel
              ?.firstWhereOrNull((t) => t.bankaId == e.banka?.id)
              ?.taksitler
              ?.firstWhereOrNull((taksit) => taksit.taksit == e.taksit)
              ?.id,
        ),
      ),
    );
    paykerLinkEditModel = model;
  }

  @action
  void setKullanimSayisi(int? kullanimSayisi) =>
      paykerLinkEditModel = paykerLinkEditModel.copyWith(kullanimSayisi: kullanimSayisi);

  @action
  Future<void> getInstallments() async {
    final response = await networkManager.getInstallments(
      cariKodu: "120.0004",
      amount: paykerLinkEditModel.tutar,
    );
    setTaksitler(response);
  }

  @action
  Future<bool> saveLink() async {
    _setTaksilerJson();
    final response = await networkManager.addPaykerPaymentLink(paykerLinkEditModel);
    return response.isSuccess;
  }

  @action
  Future<bool> updateLink() async {
    _setTaksilerJson();
    final response = await networkManager.updatePaykerPaymentLink(paykerLinkEditModel);
    return response.isSuccess;
  }

  void _setTaksilerJson() {
    paykerLinkEditModel = paykerLinkEditModel.copyWith(
      taksitlerJson: paykerLinkEditModel.setTaksitlerJson(selectedTaksitler),
    );
  }
}
