import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/e_belge_enum.dart";
import "package:picker/core/constants/enum/e_belge_islem_kodu_enum.dart";
import "package:picker/core/constants/enum/siparis_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_islem_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

class EFaturaListesiCard extends StatefulWidget {
  final EBelgeListesiModel eBelgeListesiModel;
  final EBelgeEnum eBelgeEnum;
  const EFaturaListesiCard({super.key, required this.eBelgeListesiModel, required this.eBelgeEnum});

  @override
  State<EFaturaListesiCard> createState() => _EFaturaListesiCardState();
}

class _EFaturaListesiCardState extends BaseState<EFaturaListesiCard> {
  EBelgeListesiModel get model => widget.eBelgeListesiModel;
  @override
  Widget build(BuildContext context) => Card(
        color: model.faturaIslendi == "E" ? ColorPalette.mantis.withOpacity(0.5) : null,
        child: ListTile(
          onTap: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: model.cariAdi ?? "",
              children: [
                BottomSheetModel(
                  title: "E-Belge Görüntüle",
                  iconWidget: Icons.preview_outlined,
                  onTap: () {
                    Get.back();
                    Get.toNamed("/mainPage/eBelgePdf", arguments: model);
                  },
                ),
                BottomSheetModel(
                  title: "E-Belge Eşleştir",
                  iconWidget: Icons.preview_outlined,
                  onTap: () async {
                    Get.back();
                    await dialogManager.showAreYouSureDialog(() async {
                      final result = await networkManager.dioPost(
                        path: ApiUrls.eBelgeIslemi,
                        bodyModel: EBelgeListesiModel(),
                        showLoading: true,
                        data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                              ..islemKodu = EBelgeIslemKoduEnum.eBelgeBirlestir.value
                              ..kutuTuru = "GET")
                            .toJson(),
                      );
                      if (result.success == true) {
                        Get.back();
                        dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                      }
                    });
                  },
                ),
                BottomSheetModel(
                  title: "Kontrol Durumunu Değiştir",
                  iconWidget: Icons.preview_outlined,
                  onTap: () async {
                    Get.back();
                    final TextEditingController controller = TextEditingController(text: model.kontrolAciklama ?? "KONTROL EDİLDİ");
                    await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Kontrol Durumunu Değiştir",
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("* Kontrolü kaldırmak için açıklamayı boş bırakın.", style: theme.textTheme.bodyLarge?.copyWith(color: UIHelper.primaryColor)).yetkiVarMi(model.kontrolAciklama != null),
                          CustomTextField(labelText: "Kontrol Açıklaması", controller: controller),
                          ElevatedButton(
                            onPressed: () async {
                              if (controller.text == "") {
                                model.kontrolEdildi = "H";
                                model.kontrolAciklama = null;
                              } else {
                                model.kontrolEdildi = "E";
                                model.kontrolAciklama = controller.text;
                              }
                              final result = await networkManager.dioPost(
                                path: ApiUrls.eBelgeIslemi,
                                bodyModel: EBelgeListesiModel(),
                                showLoading: true,
                                data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                                      ..islemKodu = EBelgeIslemKoduEnum.eBelgeSil.value
                                      ..kutuTuru = "GET")
                                    .toJson(),
                              );
                              if (result.success == true) {
                                Get.back();
                                dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                              }
                            },
                            child: const Text("Kaydet"),
                          ).paddingAll(UIHelper.lowSize),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    );
                  },
                ),
                BottomSheetModel(
                  title: "${SiparisTipiEnum.values.firstWhere((element) => element.rawValue == model.belgeTuru).getName} Görüntüle",
                  iconWidget: Icons.search_outlined,
                  onTap: () async {
                    Get.back();
                    await Get.toNamed(
                      "/mainPage/faturaEdit",
                      arguments: BaseEditModel<SiparisEditRequestModel>(
                        model: SiparisEditRequestModel.fromEBelgeListesiModel(widget.eBelgeListesiModel),
                        baseEditEnum: BaseEditEnum.goruntule,
                        siparisTipiEnum: SiparisTipiEnum.values.firstWhere((element) => element.rawValue == widget.eBelgeListesiModel.belgeTuru),
                      ),
                    );
                  },
                ).yetkiKontrol(model.faturaIslendi == "E" || model.gelen != "E"),
                BottomSheetModel(
                  title: "Cari İşlemleri",
                  iconWidget: Icons.person_outline_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showCariGridViewDialog(CariListesiModel(cariKodu: model.cariKodu));
                  },
                ),
              ].nullCheckWithGeneric,
            );
          },
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(model.belgeNo ?? model.resmiBelgeNo ?? "")),
              Text(model.tarih.toDateString),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.cariAdi ?? ""),
              Row(
                children: [
                  InkWell(onTap: showCevapAciklamaSnackBar, child: const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili).yetkiVarMi(model.basariylaGonderildi == "E")),
                  const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizAdi != null),
                  const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.taslak == "E"),
                  const ColorfulBadge(label: Text("Uyarı"), badgeColorEnum: BadgeColorEnum.uyari).yetkiVarMi(model.uyariMi),
                  const ColorfulBadge(label: Text("Reddedildi"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.onayDurumKodu == "1"),
                  ColorfulBadge(label: Text("İptal (${model.iptalTarihi.toDateString})"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.iptalEdildi == "E"),
                  // const ColorfulBadge(label: Text("Hata"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.basariylaGonderildi != "E"),
                ].map((e) => e is! SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ).paddingSymmetric(vertical: UIHelper.lowSize),
              Text(model.onayAciklama ?? model.cevapAciklama ?? ""),
              LayoutBuilder(
                builder: (context, constraints) => Wrap(
                  children: [
                    Text("Vergi No: ${model.vergiNo ?? ""}"),
                    Text("Kayıt Tarihi: ${model.kayittarihi.toDateString}"),
                    Text("Onay: ${model.onayAciklama ?? ""}"),
                    InkWell(
                      onTap: showCevapAciklamaSnackBar,
                      child: Row(
                        children: [
                          Icon(Icons.open_in_new_outlined, size: theme.textTheme.titleSmall?.fontSize, color: UIHelper.primaryColor),
                          Text(" Senaryo: ${model.senaryo ?? ""}"),
                        ],
                      ),
                    ).yetkiVarMi(widget.eBelgeEnum == EBelgeEnum.giden),
                    Text("Senaryo: ${model.senaryo ?? ""}").yetkiVarMi(widget.eBelgeEnum == EBelgeEnum.gelen),
                    Text("Tipi: ${model.faturaTipi ?? ""}"),
                    Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                  ].map((e) => e is! SizedBox ? SizedBox(width: constraints.maxWidth / 2, child: e) : null).toList().nullCheckWithGeneric,
                ),
              ),
              Text(
                "Kontrol: ${model.kontrolEdildi == "E" ? model.kontrolAciklama : "Hayır"}",
                style: TextStyle(color: model.kontrolEdildi == "E" ? ColorPalette.mantis : null),
              ).paddingSymmetric(vertical: UIHelper.lowSize),
            ],
          ),
        ),
      );

  void showCevapAciklamaSnackBar() => dialogManager.showInfoSnackBar("Cevap Kodu : ${model.cevapKodu.toStringIfNotNull ?? "0"}\n${model.cevapAciklama ?? ""}");
}
