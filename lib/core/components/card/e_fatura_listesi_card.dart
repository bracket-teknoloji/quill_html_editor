// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/e_belge_enum.dart";
import "package:picker/core/constants/enum/e_belge_islem_kodu_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_islem_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../base/model/base_edit_model.dart";
import "../../base/state/base_state.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../textfield/custom_text_field.dart";

class EFaturaListesiCard extends StatefulWidget {
  const EFaturaListesiCard({required this.eBelgeListesiModel, required this.eBelgeEnum, required this.onRefresh, super.key});
  final EBelgeListesiModel eBelgeListesiModel;
  final ValueChanged<bool> onRefresh;
  final EBelgeEnum eBelgeEnum;

  @override
  State<EFaturaListesiCard> createState() => _EFaturaListesiCardState();
}

class _EFaturaListesiCardState extends BaseState<EFaturaListesiCard> {
  EBelgeListesiModel get model => widget.eBelgeListesiModel;

  @override
  Widget build(BuildContext context) => Card(
        color: model.belgeIslendiMi ? ColorPalette.mantisWithOpacity : null,
        child: ListTile(
          onTap: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: model.cariAdi ?? "",
              children: [
                //TODO yetkileri ekle
                eBelgeGoruntule,
                faturaGoruntule.yetkiKontrol((model.belgeIslendiMi || !model.gelenMi) && !model.iptalEdildiMi),
                cariOlustur.yetkiKontrol(!model.cariKayitliMi && yetkiController.cariKartiYeniKayit),
                alisFaturasiOlustur.yetkiKontrol(!model.yanitBekliyorMu && !model.belgeIslendiMi),
                if (model.gelenMi) yanitGonder.yetkiKontrol(model.yanitBekliyorMu),
                dekontOlustur.yetkiKontrol(!model.yanitBekliyorMu && !model.belgeIslendiMi),
                eBelgeEslestir.yetkiKontrol(model.gelenMi && !model.belgeIslendiMi && model.eFaturaMi && !model.yanitBekliyorMu),
                eBelgeEslestirmeIptali.yetkiKontrol(model.gelenMi && model.belgeIslendiMi && model.eFaturaMi),
                kontrolDegistir.yetkiKontrol(model.gelenMi && model.eFaturaMi),
                faturaIptali.yetkiKontrol(!model.gelenMi && !model.iptalEdildiMi && model.eFaturaMi && !model.taslakMi),
                zarfiSil.yetkiKontrol(model.zarfSilinebilirMi),
                cariIslemleri.yetkiKontrol(((!model.gelenMi && model.eArsivMi) || (model.cariKayitliMi && model.eFaturaMi) || (!model.gelenMi && model.eFaturaMi)) && model.cariKayitliMi),
                yazdir.yetkiKontrol(!(model.gelenMi && model.eArsivMi)),
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
                  if (model.basariylaGonderildiMi) InkWell(onTap: showCevapAciklamaSnackBar, child: const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili)),
                  if (model.dovizliMi) const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli),
                  if (model.taslakMi) const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.hata),
                  if (model.uyariMi) ColorfulBadge(label: Text(loc.generalStrings.warning), badgeColorEnum: BadgeColorEnum.uyari),
                  if (model.reddedildiMi) const ColorfulBadge(label: Text("Reddedildi"), badgeColorEnum: BadgeColorEnum.hata),
                  if (model.iptalEdildiMi) ColorfulBadge(label: Text("İptal (${model.iptalTarihi.toDateString})"), badgeColorEnum: BadgeColorEnum.hata),
                  if (model.basimYapildiMi) const Icon(Icons.print_outlined, size: UIHelper.highSize),
                  if (model.basariylaGonderildi != "E" && !model.gelenMi)
                    ColorfulBadge(
                      label: const Text("Hata"),
                      badgeColorEnum: BadgeColorEnum.hata,
                      onTap: () {
                        dialogManager.showAlertDialog("${model.cevapKodu}\n${model.cevapAciklama}");
                      },
                    ),
                ].map((e) => e is! SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ).paddingSymmetric(vertical: UIHelper.lowSize),
              if (model.belgeIslendiMi) Text(model.faturaAciklama),
              LayoutBuilder(
                builder: (context, constraints) {
                  final efaturaList = [
                    Text("Vergi No: ${model.vergiNo ?? ""}"),
                    Text("Kayıt Tarihi: ${model.kayittarihi.toDateString}"),
                    Text("Onay: ${model.onayAciklama ?? ""}", style: TextStyle(color: model.yanitBekliyorMu ? UIHelper.primaryColor : null)),
                    if (!model.gelenMi)
                      InkWell(
                        onTap: showCevapAciklamaSnackBar,
                        child: Row(
                          children: [
                            Icon(Icons.open_in_new_outlined, size: theme.textTheme.titleSmall?.fontSize, color: UIHelper.primaryColor),
                            Text(" Senaryo: ${model.senaryo ?? ""}"),
                          ],
                        ),
                      ),
                    if (model.gelenMi) Text("Senaryo: ${model.senaryo ?? ""}"),
                    Text("Tipi: ${model.faturaTipi ?? ""}"),
                    Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    if (model.dovizliMi) Text("Genel Döv. Toplam: ${model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.dovizAdi}"),
                  ];
                  final eArsivList = [
                    Text("Kayıt Tarihi: ${model.kayittarihi.toDateString}"),
                    Text("Cevap Kodu: ${model.cevapKodu ?? ""}"),
                    if (!model.gelenMi)
                      InkWell(
                        onTap: showCevapAciklamaSnackBar,
                        child: Row(
                          children: [
                            Icon(Icons.open_in_new_outlined, size: theme.textTheme.titleSmall?.fontSize, color: UIHelper.primaryColor),
                            Text(" Cevap Kodu: ${model.cevapKodu ?? ""}"),
                          ],
                        ),
                      ),
                    Text("Tipi: ${model.faturaTipi ?? ""}"),
                    Text("Gönderme Şekli: ${model.gondermeDurumu ?? ""}"),
                    if (!model.dovizliMi) Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    if (model.dovizliMi) Text("Genel Döv. Toplam: ${model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.dovizAdi}"),
                  ];
                  final eIrsaliyeList = [
                    Text("Vergi No: ${model.vergiNo ?? ""}"),
                    Text("Kayıt Tarihi: ${model.kayittarihi.toDateString}"),
                    Text("Onay: ${model.onayAciklama ?? ""}"),
                    if (!model.gelenMi)
                      InkWell(
                        onTap: showCevapAciklamaSnackBar,
                        child: Row(
                          children: [
                            Icon(Icons.open_in_new_outlined, size: theme.textTheme.titleSmall?.fontSize, color: UIHelper.primaryColor),
                            Text(" Cevap Kodu: ${model.cevapKodu ?? ""}"),
                          ],
                        ),
                      ),
                  ];

                  final List<Widget> selectedList = model.eFaturaMi
                      ? efaturaList
                      : model.eArsivMi
                          ? eArsivList
                          : eIrsaliyeList;
                  return Wrap(
                    children: selectedList.map((e) => e is! SizedBox ? SizedBox(width: constraints.maxWidth / 2, child: e) : null).toList().nullCheckWithGeneric,
                  );
                },
              ),
              Row(
                children: [
                  Text(
                    "Kontrol: ${model.kontrolEdildi == "E" ? model.kontrolAciklama : "Hayır"}",
                    style: TextStyle(color: model.kontrolEdildi == "E" ? ColorPalette.mantis : null),
                  ).paddingSymmetric(vertical: UIHelper.lowSize),
                  if (model.kontrolEdildi == "E") const Icon(Icons.check_circle_outline_outlined, size: UIHelper.midSize * 2, color: ColorPalette.mantis).paddingOnly(right: UIHelper.lowSize),
                ],
              ),
            ],
          ),
        ),
      );

  BottomSheetModel get eBelgeGoruntule => BottomSheetModel(
        title: "E-Belge Görüntüle",
        iconWidget: Icons.preview_outlined,
        onTap: () {
          Get
            ..back()
            ..toNamed("/mainPage/eBelgePdf", arguments: model);
        },
      );

  BottomSheetModel get kontrolDegistir => BottomSheetModel(
        title: "Kontrol Durumunu Değiştir",
        iconWidget: Icons.rule_outlined,
        onTap: () async {
          Get.back();
          final TextEditingController controller = TextEditingController(text: model.kontrolAciklama ?? "KONTROL EDİLDİ");
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Kontrol Durumunu Değiştir",
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (model.kontrolAciklama != null) Text("* Kontrolü kaldırmak için açıklamayı boş bırakın.", style: theme.textTheme.bodyLarge?.copyWith(color: UIHelper.primaryColor)),
                CustomTextField(
                  labelText: "Kontrol Açıklaması",
                  controller: controller,
                  suffix: IconButton(
                    onPressed: controller.clear,
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.text == "") {
                      model
                        ..kontrolEdildi = "H"
                        ..kontrolAciklama = null;
                    } else {
                      model
                        ..kontrolEdildi = "E"
                        ..kontrolAciklama = controller.text;
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

                    widget.onRefresh.call(result.isSuccess);
                    if (result.isSuccess) {
                      Get.back();
                      controller.dispose();
                      dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                    }
                  },
                  child: const Text("Kaydet"),
                ).paddingAll(UIHelper.lowSize),
              ],
            ),
          );
        },
      );

  BottomSheetModel get yanitGonder => BottomSheetModel(
        title: "Yanıt Gönder",
        iconWidget: Icons.reply_all_outlined,
        onTap: () async {
          Get.back();
          final TextEditingController controller = TextEditingController();
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Yanıt Gönder",
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: "Açıklama",
                  controller: controller,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (controller.text.ext.isNullOrEmpty) {
                            dialogManager.showAlertDialog("Açıklama boş olamaz.");
                            return;
                          }
                          final result = await networkManager.dioPost(
                            path: ApiUrls.eBelgeIslemi,
                            bodyModel: EBelgeListesiModel(),
                            showLoading: true,
                            data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                                  ..kabul = "H"
                                  ..aciklama = controller.text.ext.isNullOrEmpty ? null : controller.text
                                  ..islemKodu = EBelgeIslemKoduEnum.eBelgeYanit.value
                                  ..kutuTuru = "GET")
                                .toJson(),
                          );
                          widget.onRefresh.call(result.isSuccess);
                          if (result.isSuccess) {
                            Get.back();
                            controller.dispose();
                            dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(ColorPalette.persianRed),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        child: const Text("Red"),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 20,
                      child: ElevatedButton(
                        onPressed: () async {
                          final result = await networkManager.dioPost(
                            path: ApiUrls.eBelgeIslemi,
                            bodyModel: EBelgeListesiModel(),
                            showLoading: true,
                            data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                                  ..kabul = "E"
                                  ..aciklama = controller.text.ext.isNullOrEmpty ? null : controller.text
                                  ..islemKodu = EBelgeIslemKoduEnum.eBelgeYanit.value
                                  ..kutuTuru = "GET")
                                .toJson(),
                          );
                          widget.onRefresh.call(result.isSuccess);
                          if (result.isSuccess) {
                            Get.back();
                            controller.dispose();
                            dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(ColorPalette.mantis),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        child: const Text("Kabul"),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: UIHelper.lowSize),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withValues(alpha: 0.1))),
                  onPressed: () async {
                    Get.back();
                  },
                  child: const Text("İptal"),
                ).paddingAll(UIHelper.lowSize),
              ],
            ),
          );
        },
      );

  BottomSheetModel get eBelgeEslestir => BottomSheetModel(
        title: "E-Belge Eşleştir",
        iconWidget: Icons.link_outlined,
        onTap: () async {
          Get.back();
          await dialogManager.showAreYouSureDialog(
            () async {
              final result = await networkManager.dioPost(
                path: ApiUrls.eBelgeIslemi,
                bodyModel: EBelgeListesiModel(),
                showLoading: true,
                data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                      ..islemKodu = EBelgeIslemKoduEnum.eBelgeBirlestir.value
                      ..kutuTuru = "GET")
                    .toJson(),
              );
              widget.onRefresh.call(result.isSuccess);
              if (result.isSuccess) {
                dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
              }
            },
            title: "E-Belge Eşleştirilsin mi?",
          );
        },
      );
  BottomSheetModel get eBelgeEslestirmeIptali => BottomSheetModel(
        title: "E-Belge Eşleştirme İptali",
        iconWidget: Icons.close_outlined,
        onTap: () async {
          Get.back();
          await dialogManager.showAreYouSureDialog(
            () async {
              final result = await networkManager.dioPost(
                path: ApiUrls.eBelgeIslemi,
                bodyModel: EBelgeListesiModel(),
                showLoading: true,
                data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                      ..islemKodu = EBelgeIslemKoduEnum.eBelgeEslestirmeIptali.value
                      ..kutuTuru = "GET")
                    .toJson(),
              );
              widget.onRefresh.call(result.isSuccess);
              if (result.isSuccess) {
                dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
              }
            },
            title: "E-Belge Eşleştirme İptal Edilsin mi?",
          );
        },
      );

  BottomSheetModel get yazdir => BottomSheetModel(
        title: loc.generalStrings.print,
        iconWidget: Icons.print_outlined,
        onTap: () async {
          Get.back();
          YaziciList? yaziciList;
          final TextEditingController yaziciController = TextEditingController();
          final TextEditingController kopyaSayisiController = TextEditingController(text: "1");
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.print,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: "Yazıcı",
                  controller: yaziciController,
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  onTap: () async {
                    final List<YaziciList?> yaziciListe = CacheManager.getAnaVeri?.paramModel?.yaziciList ?? <YaziciList?>[];
                    if (yaziciListe.length == 1) {
                      yaziciList = yaziciListe.first;
                    } else if (yaziciListe.length > 1) {
                      yaziciList = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: "Yazıcı Seçiniz",
                        children: yaziciListe.map((e) => BottomSheetModel(title: e?.yaziciAdi ?? "", value: e)).toList(),
                      );
                    }
                    yaziciController.text = yaziciList?.yaziciAdi ?? "";
                  },
                ),
                CustomTextField(
                  labelText: "Kopya Sayısı",
                  controller: kopyaSayisiController,
                  readOnly: true,
                  isMust: true,
                  suffix: Row(
                    children: [
                      IconButton(
                        onPressed: () => int.tryParse(kopyaSayisiController.text) == 1 ? null : kopyaSayisiController.text = ((int.tryParse(kopyaSayisiController.text) ?? 1) - 1).toString(),
                        icon: const Icon(Icons.remove_outlined),
                      ),
                      IconButton(
                        onPressed: () => kopyaSayisiController.text = ((int.tryParse(kopyaSayisiController.text) ?? 1) + 1).toString(),
                        icon: const Icon(Icons.add_outlined),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (yaziciController.text.isEmpty) {
                      dialogManager.showInfoDialog("Yazıcı seçiniz");
                      return;
                    }
                    final result = await networkManager.dioPost(
                      path: ApiUrls.eBelgeIslemi,
                      bodyModel: EBelgeListesiModel(),
                      showLoading: true,
                      data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                            ..islemKodu = EBelgeIslemKoduEnum.eBelgeYazdir.value
                            ..kopyaSayisi = int.tryParse(kopyaSayisiController.text) ?? 1
                            ..yaziciAdi = yaziciList?.yaziciAdi)
                          .toJson(),
                    );
                    if (result.isSuccess) {
                      Get.back();
                      dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                    }
                  },
                  child: Text(loc.generalStrings.print),
                ).paddingAll(UIHelper.lowSize),
              ],
            ).paddingAll(UIHelper.lowSize),
          );
        },
      );

  BottomSheetModel get cariIslemleri => BottomSheetModel(
        title: "Cari İşlemleri",
        iconWidget: Icons.person_outline_outlined,
        onTap: () async {
          Get.back();
          final result = await networkManager.dioGet(
            path: ApiUrls.getCariler,
            bodyModel: CariListesiModel(),
            showLoading: true,
            queryParameters: {"filterText": "", "Kod": model.seciliCariKodu, "EFaturaGoster": true, "KisitYok": true, "BelgeTuru": model.belgeTuru, "PlasiyerKisitiYok": true},
          );
          if (result.isSuccess) {
            dialogManager.showCariGridViewDialog(result.dataList.first);
          }
        },
      );

  BottomSheetModel get cariOlustur => BottomSheetModel(
        title: "Cari Oluştur",
        iconWidget: Icons.person_add_outlined,
        onTap: () async {
          Get.back();
          final result = await Get.toNamed(
            "/mainPage/cariEdit",
            arguments: BaseEditModel<CariListesiModel>(
              model: CariListesiModel.fromEBelgeListesiModel(widget.eBelgeListesiModel)
                ..hesaptutmasekli = "Y"
                ..vadeGunu = 0,
              editTipiEnum: EditTipiEnum.cari,
              baseEditEnum: BaseEditEnum.kopyala,
            ),
          );
          if (result != null) {
            widget.onRefresh.call(true);
          }
        },
      );

  BottomSheetModel get zarfiSil => BottomSheetModel(
        title: "Zarfı Sil",
        iconWidget: Icons.delete_outline_outlined,
        onTap: () async {
          Get.back();
          await dialogManager.showAreYouSureDialog(() async {
            final result = await networkManager.dioPost(
              path: ApiUrls.eBelgeIslemi,
              bodyModel: EBelgeListesiModel(),
              showLoading: true,
              data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                    ..islemKodu = EBelgeIslemKoduEnum.eBelgeZarfSil.value
                    ..kutuTuru = "GIK")
                  .toJson(),
            );
            widget.onRefresh.call(result.isSuccess);
            if (result.isSuccess) {
              dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
            }
          });
        },
      );

  BottomSheetModel get faturaIptali => BottomSheetModel(
        title: "Harici Yolla Fatura İptali",
        iconWidget: Icons.delete_outline_outlined,
        onTap: () async {
          Get.back();
          final DateTime? result = await dialogManager.showDateTimePicker(initialDate: model.iptalTarihi);
          if (result == null) {
            return;
          } else {
            model.iptalTarihi = result;
          }
          await dialogManager.showAreYouSureDialog(
            () async {
              final result = await networkManager.dioPost(
                path: ApiUrls.eBelgeIslemi,
                bodyModel: EBelgeListesiModel(),
                showLoading: true,
                data: (EBelgeIslemModel.fromEBelgeListesiModel(model)
                      ..islemKodu = EBelgeIslemKoduEnum.eBelgeHariciYollaFaturaIptali.value
                      ..kutuTuru = "GIK")
                    .toJson(),
              );
              widget.onRefresh.call(result.isSuccess);
              if (result.isSuccess) {
                dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
              }
            },
            title: "İptal Tarihi: ${result.toDateString}\nFatura harici yolla iptal edilsin mi?",
          );
        },
      );

  BottomSheetModel get alisFaturasiOlustur => BottomSheetModel(
        title: "Alış Faturası Oluştur",
        iconWidget: Icons.add_outlined,
        onTap: () async {
          Get.back();
          if (widget.eBelgeListesiModel.seciliCariKodu == null) {
            final result = await dialogManager.showAreYouSureDialog(
              () async {
                final result = await Get.toNamed(
                  "/mainPage/cariEdit",
                  arguments: BaseEditModel<CariListesiModel>(
                    model: CariListesiModel.fromEBelgeListesiModel(widget.eBelgeListesiModel)
                      ..hesaptutmasekli = "Y"
                      ..vadeGunu = 0,
                    baseEditEnum: BaseEditEnum.kopyala,
                  ),
                );
                if (result != null) {
                  widget.onRefresh.call(true);
                }
              },
              title: "Cari Kodu Bulunamadı. Oluşturulsun Mu?",
            );
            if (result == null) {
              return;
            }
          }
          final cariModel = await networkManager.getCariModel(CariRequestModel(kod: [""], vergiNo: widget.eBelgeListesiModel.vergiNo, eFaturaGoster: true, plasiyerKisitiYok: true));

          if (cariModel == null) {
            return;
          }
          final depoModel = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, null);
          if (depoModel == null) {
            return;
          }
          final siparisModel = await networkManager.getFatura(
            context,
            (SiparisEditRequestModel.fromEBelgeListesiModel(widget.eBelgeListesiModel))
              ..depoKodu = depoModel.depoKodu
              ..belgeTipi = null
              ..kisitYok = null
              ..iadeMi = false
              ..belgeTuru = null
              ..cariKodu = cariModel.cariKodu,
          );
          if (siparisModel == null) {
            return;
          } else {
            siparisModel
              ..genIsk1t = widget.eBelgeListesiModel.iskontoTutari
              ..genIsk1o = siparisModel.tutarToIskonto1;
          }
          final result = await Get.toNamed(
            "/mainPage/faturaEdit",
            arguments: BaseEditModel<BaseSiparisEditModel>(
              // model: siparisModel..cariAdi = cariModel?.cariAdi..cariEfaturami = "E",
              model: siparisModel.copyWith(
                cariAdi: cariModel.cariAdi,
                cariEfaturami: "E",
                plasiyerAciklama: cariModel.plasiyerAciklama,
                plasiyerKodu: cariModel.plasiyerKodu,
                depoTanimi: depoModel.depoTanimi,
                dovizAdi: cariModel.dovizAdi,
                dovizTipi: cariModel.dovizKodu,
                efaturaInckeyno: widget.eBelgeListesiModel.inckeyno,
                tarih: widget.eBelgeListesiModel.tarih,
                efattanAlisFat: true,
                ebelgeZarfid: widget.eBelgeListesiModel.zarfid,
                belgeTipi: 2,
                tipi: 2,
                genIsk1t: widget.eBelgeListesiModel.iskontoTutari,
                // genIsk1O: widget.eBelgeListesiModel.isk,
                efattanTutar: widget.eBelgeListesiModel.genelToplam,
                efattanDovizAdi: widget.eBelgeListesiModel.dovizAdi,
                efattanDoviz: widget.eBelgeListesiModel.dovizTutari,
                efaturaMi: "E",
              ),
              baseEditEnum: BaseEditEnum.taslak,
              editTipiEnum: EditTipiEnum.alisFatura,
            ),
          );
          if (result != null) {
            widget.onRefresh.call(true);
          }
        },
      );

  BottomSheetModel get dekontOlustur => BottomSheetModel(
        title: "Dekont Oluştur",
        iconWidget: Icons.add_outlined,
        onTap: () async {
          Get.back();
          final result = await Get.toNamed(
            "/mainPage/dekontEBelgedenEkle",
            arguments: model,
          );
          if (result != null) {
            widget.onRefresh.call(true);
          }
        },
      );

  BottomSheetModel get faturaGoruntule => BottomSheetModel(
        title: "${EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == model.belgeTuru)?.getName} Görüntüle",
        iconWidget: Icons.preview_outlined,
        onTap: () async {
          Get.back();
          await Get.toNamed(
            "/mainPage/faturaEdit",
            arguments: BaseEditModel<SiparisEditRequestModel>(
              model: SiparisEditRequestModel.fromEBelgeListesiModel(widget.eBelgeListesiModel),
              baseEditEnum: BaseEditEnum.goruntule,
              editTipiEnum: EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == widget.eBelgeListesiModel.belgeTuru),
            ),
          );
        },
      );

  void showCevapAciklamaSnackBar() => dialogManager.showInfoSnackBar("Cevap Kodu : ${model.cevapKodu.toStringIfNotNull ?? "0"}\n${model.cevapAciklama ?? ""}");
}
