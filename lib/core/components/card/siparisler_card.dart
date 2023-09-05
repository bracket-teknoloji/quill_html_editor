import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/model/delete_fatura_model.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/siparis_tipi_enum.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class SiparislerCard extends StatefulWidget {
  final bool? isGetData;
  final BaseSiparisEditModel model;
  final Function? onDeleted;

  ///Eğer Bu widget Cache'den çağırılıyorsa index verilmelidir.
  final int? index;
  final SiparisTipiEnum siparisTipiEnum;
  const SiparislerCard({super.key, required this.model, this.onDeleted, required this.siparisTipiEnum, this.index, this.isGetData});

  @override
  State<SiparislerCard> createState() => _SiparislerCardState();
}

class _SiparislerCardState extends BaseState<SiparislerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onLongPress: widget.model.remoteTempBelgeEtiketi == null ? () => dialogManager.showSiparisGridViewDialog(widget.model) : null,
      onTap: widget.isGetData == true
          ? () => Get.back(result: widget.model)
          : () async {
              // var result =
              await bottomSheetDialogManager.showBottomSheetDialog(context,
                  title: widget.model.belgeNo ?? "",
                  children: [
                    BottomSheetModel(
                        title: "Görüntüle",
                        iconWidget: Icons.search_outlined,
                        onTap: () {
                          Get.back();
                          return Get.toNamed("mainPage/siparisEdit",
                              arguments:
                                  BaseEditModel(model: SiparisEditRequestModel.fromSiparislerModel(widget.model), baseEditEnum: BaseEditEnum.goruntule, siparisTipiEnum: widget.siparisTipiEnum));
                        }),
                    BottomSheetModel(
                        title: "Düzelt",
                        iconWidget: Icons.edit_outlined,
                        onTap: () {
                          if (widget.model.isNew == true) {
                            BaseSiparisEditModel.setInstance(widget.model);
                          }
                          Get.back();
                          return Get.toNamed("mainPage/siparisEdit",
                              arguments: BaseEditModel(
                                model: SiparisEditRequestModel.fromSiparislerModel(widget.model),
                                baseEditEnum: BaseEditEnum.duzenle,
                                siparisTipiEnum: widget.siparisTipiEnum,
                              ));
                        }).yetkiKontrol(yetkiController.siparisDuzelt),
                    BottomSheetModel(
                        title: "Sil",
                        iconWidget: Icons.delete_outline,
                        onTap: () {
                          Get.back();
                          return dialogManager.showAreYouSureDialog(() async {
                            if (widget.model.isNew == true) {
                              try {
                                CacheManager.removeSiparisEditList(widget.index!);
                                dialogManager.showSnackBar("Silindi");
                                widget.onDeleted?.call();
                              } catch (e) {
                                dialogManager.showAlertDialog("Hata Oluştu.\n$e");
                              }
                              return;
                            }
                            var result = await networkManager.deleteFatura(const DeleteFaturaModel().fromJson(widget.model.toJson()));
                            if (result.success == true) {
                              dialogManager.showSnackBar("Silindi");
                              widget.onDeleted?.call();
                            }
                          });
                        }).yetkiKontrol(yetkiController.siparisSil || widget.model.isNew == true),
                    BottomSheetModel(title: "Yazdır", iconWidget: Icons.print_outlined).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                    BottomSheetModel(
                        title: "İşlemler",
                        iconWidget: Icons.list_alt_outlined,
                        onTap: () {
                          Get.back();
                          dialogManager.showSiparisGridViewDialog(widget.model);
                        }).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                    BottomSheetModel(title: "Kontrol Edildi", iconWidget: Icons.check_box_outlined).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                    BottomSheetModel(
                        title: "Cari İşlemleri",
                        iconWidget: Icons.person_outline_outlined,
                        onTap: () {
                          Get.back();
                          dialogManager.showCariGridViewDialog(CariListesiModel()
                            ..cariKodu = widget.model.cariKodu
                            ..cariAdi = widget.model.cariAdi);
                        }),
                  ].nullCheck.cast<BottomSheetModel>().toList());
            },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.model.belgeNo ?? ""),
          Text(widget.model.kayittarihi?.toDateString ?? ""),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ColorfulBadge(),
              ColorfulBadge(label: Text(widget.model.remoteTempBelgeEtiketi ?? "")).yetkiVarMi(widget.model.remoteTempBelgeEtiketi != null),
              ColorfulBadge(
                label: Text("Dövizli ${widget.model.dovizAdi ?? ""}"),
                badgeColorEnum: BadgeColorEnum.dovizli,
              ).yetkiVarMi(widget.model.dovizAdi != null),
              const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis).yetkiVarMi(widget.model.isNew == true),
              ColorfulBadge(label: Text("Fatura (${widget.model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(widget.model.faturalasanSayi != null),
              const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(widget.model.tipi == 1),
              const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(widget.model.tipi == 3),
              ColorfulBadge(label: Text("İrsaliye (${widget.model.irslesenSayi ?? ""})")).yetkiVarMi(widget.model.irsaliyelesti == "E"),
            ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
          ),
          Text(widget.model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tipi: ${widget.model.yurticiMi ? "Yurtiçi" : "Yurtdışı"}"),
                  widget.model.kosulKodu != null ? Text("Koşul: ${widget.model.kosulKodu ?? ""}") : null,
                  Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}"),
                  Text("KDV: ${widget.model.kdv.commaSeparatedWithFixedDigits} TL"),
                  widget.model.dovizAdi != null ? Text("Döviz Toplamı: ${widget.model.dovizTutari ?? ""} ${widget.model.dovizAdi ?? ""}").yetkiVarMi(widget.model.dovizTutari != null) : null,
                ].nullCheckWithGeneric,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
                  Text("Ara Toplam: ${widget.model.getAraToplam.commaSeparatedWithFixedDigits} TL"),
                  Text("Genel Toplam: ${widget.model.genelToplam?.commaSeparatedWithFixedDigits ?? "0.00"} TL"),
                ].nullCheckWithGeneric,
              ),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          const Divider().paddingAll(UIHelper.midSize).yetkiVarMi(aciklamaList().ext.isNotNullOrEmpty),
          ...aciklamaList(),
        ],
      ),
    ));
  }

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text(
        "${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}",
        style: TextStyle(
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
      ).yetkiVarMi(widget.model.toJson()["ACIK$index"] != null);

  ParamModel? get paramModel => CacheManager.getAnaVeri()?.paramModel;
}
