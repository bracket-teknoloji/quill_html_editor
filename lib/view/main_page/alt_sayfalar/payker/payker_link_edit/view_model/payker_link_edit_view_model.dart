import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_firma_bayi_listesi/model/payker_drop_down_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_link_edit/model/payker_link_edit_model.dart";

part "payker_link_edit_view_model.g.dart";

class PaykerLinkEditViewModel = _PaykerLinkEditViewModelBase with _$PaykerLinkEditViewModel;

abstract class _PaykerLinkEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  PaykerLinkEditModel paykerLinkEditModel = const PaykerLinkEditModel();

  @action
  void setBayi(PaykerFirmaModel model) =>
      paykerLinkEditModel = paykerLinkEditModel.copyWith(bayiId: int.tryParse(model.id ?? "0"));

  @action
  void setTutar(double? tutar) => paykerLinkEditModel = paykerLinkEditModel.copyWith(tutar: tutar);

  @action
  void setEmail(String? email) => paykerLinkEditModel = paykerLinkEditModel.copyWith(email: email);

  @action
  void setUnvan(String? unvan) => paykerLinkEditModel = paykerLinkEditModel.copyWith(unvan: unvan);

  @action
  void setBitTar(DateTime? bitTar) => paykerLinkEditModel = paykerLinkEditModel.copyWith(bitTar: bitTar);

  @action
  void setModel(PaykerLinkEditModel model) => paykerLinkEditModel = model;

  @action
  void setKullanimSayisi(int? kullanimSayisi) =>
      paykerLinkEditModel = paykerLinkEditModel.copyWith(kullanimSayisi: kullanimSayisi);

  @action
  Future<bool> saveLink() async {
    final response = await networkManager.addPaykerPaymentLink(paykerLinkEditModel);
    return response.isSuccess;
  }

  @action
  Future<bool> updateLink() async {
    final response = await networkManager.updatePaykerPaymentLink(paykerLinkEditModel);
    return response.isSuccess;
  }
}
