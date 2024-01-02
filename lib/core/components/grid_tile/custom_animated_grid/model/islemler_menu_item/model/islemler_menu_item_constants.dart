import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/yetki_controller/yetki_controller.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/kalem_list_model.dart";
import "package:share_plus/share_plus.dart";

import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../../../view/main_page/model/grid_item_model.dart";
import "../../../../../../../view/main_page/model/param_model.dart";
import "../../../../../../base/model/base_edit_model.dart";
import "../../../../../../base/model/edit_fatura_model.dart";
import "../../../../../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../constants/enum/base_edit_enum.dart";
import "../../../../../../constants/enum/islem_tipi_enum.dart";
import "../../../../../../constants/extensions/list_extensions.dart";
import "../../../../../../constants/extensions/model_extensions.dart";
import "../../../../../../constants/static_variables/static_variables.dart";
import "../../../../../../constants/ui_helper/ui_helper.dart";
import "../../../../../../init/cache/cache_manager.dart";
import "../../../../../../init/network/login/api_urls.dart";
import "../../../../../../init/network/network_manager.dart";
import "../../../../../../init/theme/app_theme_dark.dart";
import "../../../../../dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "../../../../../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../dialog/dialog_manager.dart";
import "../../../../../helper_widgets/custom_label_widget.dart";
import "../../../../../textfield/custom_text_field.dart";
import "../../kod_degistir_model.dart";
import "../view_model/islemler_menu_item_constants_view_model.dart";

class IslemlerMenuItemConstants<T> {
  IslemlerMenuItemConstantsViewModel viewModel = IslemlerMenuItemConstantsViewModel();
  IslemTipiEnum islemtipi;
  ThemeData get theme => AppThemeDark.instance?.theme ?? ThemeData();
  EditTipiEnum? siparisTipi;
  List<GridItemModel?> islemlerList = [];
  T? model;
  // T? get model2 => model;
  DialogManager get _dialogManager => DialogManager();
  NetworkManager get _networkManager => NetworkManager();
  ParamModel get _paramModel => CacheManager.getAnaVeri?.paramModel ?? ParamModel();
  YetkiController get _yetkiController => YetkiController();
  BottomSheetDialogManager get _bottomSheetDialogManager => BottomSheetDialogManager();

  IslemlerMenuItemConstants({required this.islemtipi, List<GridItemModel?>? raporlar, this.model, this.siparisTipi}) {
    if (islemtipi == IslemTipiEnum.stok) {
      islemlerList.add(stokKarti);
      islemlerList.add(kopyala);
      islemlerList.add(stokYazdir);
      islemlerList.add(fiyatGor);
      islemlerList.addAll(raporlar!);
    } else if (islemtipi == IslemTipiEnum.cari) {
      if (model is CariListesiModel) {
        final CariListesiModel newModel = model as CariListesiModel;
        islemlerList.add(bankaCariEFTHavale(model: model as CariListesiModel));
        islemlerList.add(nakitTahsilat(model));
        islemlerList.add(nakitOdeme(model));
        islemlerList.add(krediKartiTahsilati(model));
        islemlerList.add(borcCeki);
        islemlerList.add(borcSenedi);
        islemlerList.add(cekTahsilati);
        islemlerList.add(tahsilatSenedi);
        islemlerList.add(paylas);
        islemlerList.add(kopyala);
        islemlerList.add(cariHareketleri);
        islemlerList.add(cariKoduDegistir(newModel.cariKodu));
        islemlerList.addAll(raporlar!);
      }
    } else if (islemtipi == IslemTipiEnum.siparis) {
      if (model is BaseSiparisEditModel) {
        final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
        // islemlerList.add(irsaliyeOlustur);
        islemlerList.add(siparisPDFGoruntule);
        islemlerList.addIfConditionTrue(!siparisModel.onaydaMi, belgeyiKapatAc);
        islemlerList.addIfConditionTrue(!siparisModel.onaydaMi, satisIrsaliyeOlustur);
        islemlerList.addIfConditionTrue(!siparisModel.onaydaMi, siparistenFaturaOlustur);
        islemlerList.addIfConditionTrue(siparisModel.siparislestiMi || siparisModel.faturalastiMi || siparisModel.irsaliyelestiMi, belgeBaglantilari);
        islemlerList.add(siparisCariKoduDegistir);
        islemlerList.add(belgeNoDegistir);
        islemlerList.addIfConditionTrue((siparisModel.onaydaMi || siparisModel.onaylandiMi) && _yetkiController.siparisOnayIslemleri(siparisModel.belgeTuru), talTekOnayla);
        islemlerList.add(kopyala);
        islemlerList.addAll(raporlar!);
      }
    } else if (islemtipi == IslemTipiEnum.cariIslemleri) {
      islemlerList.add(cariKarti);
      islemlerList.add(cariHareketleri);
      islemlerList.addAll(raporlar!);
      islemlerList.add(cariIslemleri);
      islemlerList.add(paylas);
    } else if (islemtipi == IslemTipiEnum.kasa) {
      if (model != null) {
        islemlerList.add(kasaHareketleri);
      }
      islemlerList.add(bankaKasaTransferi);
      islemlerList.add(nakitTahsilat(null));
      islemlerList.add(nakitOdeme(null));
      islemlerList.add(krediKartiTahsilati(null));
      islemlerList.add(kasaTransferi);
      islemlerList.add(muhtelifTahsilat);
      islemlerList.add(muhtelifOdeme);
      islemlerList.addAll(raporlar ?? []);
    } else if (islemtipi == IslemTipiEnum.cariHareketleri) {
      islemlerList.add(nakitTahsilat(model));
      islemlerList.add(nakitOdeme(model));
      islemlerList.add(krediKartiTahsilati(model));
    } else if (islemtipi == IslemTipiEnum.banka) {
      if (model != null) {
        islemlerList.add(bankaHareketleri);
      }
      islemlerList.add(bankaCariEFTHavale());
      islemlerList.add(bankaKasaTransferi);
      islemlerList.add(hesaplarArasiVirman);
      islemlerList.add(hesaplarArasiEftHavale);
      islemlerList.add(bankaMuhtelifTahsilat);
      islemlerList.add(bnkaMuhtelifOdeme);
    } else if (islemtipi == IslemTipiEnum.cekSenet) {
      if ((model as CekSenetListesiModel).cekSenetListesiEnum.borcMu) {
        islemlerList.add(odemeDekontOlustur);
      } else {
        islemlerList.add(cariHesabaCirola);
        islemlerList.add(tahsilHesabaCirola);
      }
      islemlerList.add(kasaTahsilEt);
    } else if (islemtipi == IslemTipiEnum.tahsilatOdeme) {
      islemlerList.add(nakitOdeme(model));
      islemlerList.add(nakitTahsilat(model));
      islemlerList.add(krediKartiTahsilati(model));
      islemlerList.add(tahsilatSenedi);
      islemlerList.add(cekTahsilati);
      islemlerList.add(borcSenedi);
      islemlerList.add(borcCeki);
    } else if (islemtipi == IslemTipiEnum.talepTeklif) {
      if (model is BaseSiparisEditModel) {
        final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
        islemlerList.add(siparisPDFGoruntule);
        islemlerList.addIfConditionTrue(!siparisModel.kapaliMi && siparisModel.stekMi, talTekRevizeEt);
        islemlerList.addIfConditionTrue(siparisModel.atalMi && siparisModel.teklifSipariseDonerMi, saticiSiparisiOlustur);
        islemlerList.addIfConditionTrue((siparisModel.stalMi || siparisModel.stekMi) && siparisModel.teklifSipariseDonerMi, musteriSiparisiOlustur);
        islemlerList.addIfConditionTrue(siparisModel.stekMi && siparisModel.teklifIrsaliyeDonerMi, satisIrsaliyeOlustur);
        islemlerList.addIfConditionTrue(siparisModel.stekMi && siparisModel.teklifFaturayaDonerMi && !siparisModel.irsaliyelestiMi, siparistenFaturaOlustur);
        islemlerList.addIfConditionTrue(siparisModel.siparislestiMi || siparisModel.faturalastiMi || siparisModel.irsaliyelestiMi, belgeBaglantilari);
        islemlerList.addIfConditionTrue(!siparisModel.onaydaMi, belgeyiKapatAc);
        islemlerList.add(kopyala);
        islemlerList.add(siparisCariKoduDegistir);
        islemlerList.addIfConditionTrue(!siparisModel.kapaliMi, belgeNoDegistir);
        islemlerList.addIfConditionTrue((siparisModel.onaydaMi || siparisModel.onaylandiMi) && _yetkiController.taltekOnayIslemleri(siparisModel.belgeTuru), talTekOnayla);
      }
    } else if (islemtipi == IslemTipiEnum.fatura) {
      final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
      islemlerList.add(siparisPDFGoruntule);
      islemlerList.add(siparisCariKoduDegistir);
      islemlerList.add(kopyala);
      islemlerList.addIfConditionTrue(siparisModel.aFaturaMi, alistanSatisFaturasiOlustur);
    } else if (islemtipi == IslemTipiEnum.eBelge) {
      final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
      // islemlerList.add(eBelgeGoruntule);
      islemlerList.addIfConditionTrue(siparisModel.eBelgeMi, eBelgeGoruntule);
      islemlerList.addIfConditionTrue(siparisModel.taslakMi, eBelgetaslakSil);
      islemlerList.addIfConditionTrue(siparisModel.getEditTipiEnum.alisFaturasiMi && !siparisModel.eFaturaMi, eBelgeEslestir);
      islemlerList.addIfConditionTrue(siparisModel.getEditTipiEnum.alisFaturasiMi && siparisModel.eFaturaMi, eBelgeEslestirmeKaldir);
      islemlerList.addIfConditionTrue(siparisModel.uyariMi || siparisModel.basariliMi, durumSorgula);
      islemlerList.addIfConditionTrue(!siparisModel.uyariMi && !siparisModel.basariliMi && siparisModel.getEditTipiEnum.satisFaturasiMi, eFaturaGonder);
      islemlerList.addIfConditionTrue(siparisModel.eBelgeMi, eBelgeYazdir);
      // islemlerList.add(eBelgeYazdir);
    }
  }

  GridItemModel? get cariHareketleri =>
      GridItemModel.islemler(iconData: Icons.sync_alt_outlined, title: "Cari Hareketleri", onTap: () async => Get.toNamed("mainPage/cariHareketleri", arguments: model));

  //* Genel
  GridItemModel? get stokHareketleri =>
      GridItemModel.islemler(iconData: Icons.sync_alt_outlined, title: "Stok Hareketleri", onTap: () async => Get.toNamed("mainPage/stokHareketleri", arguments: model));
  GridItemModel? get kopyala => GridItemModel.islemler(
        title: "Kopyala",
        iconData: Icons.copy_outlined,
        onTap: () async => Get.toNamed(islemtipi.route, arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.kopyala)),
      );
  //* Siparis
  GridItemModel? get irsaliyeOlustur => GridItemModel.islemler(title: "İrsaliye Oluştur", iconData: Icons.conveyor_belt);
  GridItemModel? get belgeyiKapatAc {
    if (model is BaseSiparisEditModel) {
      final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
      if (siparisModel.tipi != 1) {
        return GridItemModel.islemler(
          title: "Belgeyi Kapat",
          iconData: Icons.lock_outline,
          onTap: () async {
            bool? result;
            await _dialogManager.showAreYouSureDialog(
              () async {
                result = true;
              },
              title: "Kiliti kapatmak istediğinize emin misiniz?",
            );
            if (result == true) {
              return await kilitRequest(siparisModel, 1);
            }
          },
        );
      } else {
        return GridItemModel.islemler(
          title: "Belgeyi Aç",
          iconData: Icons.lock_open_outlined,
          onTap: () async {
            bool? result;
            await _dialogManager.showAreYouSureDialog(
              () async {
                result = true;
              },
              title: "Kiliti açmak istediğinize emin misiniz?",
            );
            if (result == true) {
              return await kilitRequest(siparisModel, 2);
            }
          },
        );
      }
    }
    return null;
  }

  Future<bool> kilitRequest(BaseSiparisEditModel siparisModel, int yeniTipi) async {
    final result = await _networkManager.dioPost<SiparisEditRequestModel>(
      path: ApiUrls.belgeDurumunuDegistir,
      showLoading: true,
      bodyModel: SiparisEditRequestModel(),
      data: EditFaturaModel.fromSiparislerModel(siparisModel..tipi = yeniTipi).toJson(),
    );
    if (result.success == true) {
      _dialogManager.showSuccessSnackBar("Başarılı");
      return result.success!;
    } else {
      return false;
    }
  }

  GridItemModel? get belgeNoDegistir => GridItemModel.islemler(
        title: "Belge No Değiştir",
        iconData: Icons.edit_outlined,
        onTap: () async {
          final TextEditingController controller = TextEditingController();
          if (model is BaseSiparisEditModel) {
            controller.text = (model as BaseSiparisEditModel).belgeNo ?? "";
          }
          final BaseSiparisEditModel? siparisModel = model as BaseSiparisEditModel?;
          final formKey = GlobalKey<FormState>();
          var updatePage = false;
          await _bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Belge No Değiştir",
            body: Column(
              children: [
                const Text("15 haneli bir belge no giriniz."),
                Form(
                  key: formKey,
                  child: CustomTextField(
                    labelText: "Belge No",
                    isMust: true,
                    maxLength: 15,
                    controller: controller,
                    validator: (p0) {
                      if (p0 == null || p0.length != 15) {
                        return "Lütfen 15 haneli bir belge no giriniz.";
                      }
                      return null;
                    },
                    suffix: IconButton(
                      onPressed: () async {
                        final result = await _networkManager.dioGet<BaseSiparisEditModel>(
                          path: ApiUrls.getSiradakiBelgeNo,
                          bodyModel: BaseSiparisEditModel(),
                          queryParameters: {
                            "Seri": controller.text,
                            "BelgeTipi": StaticVariables.instance.isMusteriSiparisleri ? "MS" : "SS",
                            "EIrsaliye": "H",
                            "CariKodu": siparisModel?.cariKodu ?? "",
                          },
                        );
                        if (result.success == true) {
                          final List<BaseSiparisEditModel>? list = result.data.map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
                          controller.text = list?.firstOrNull?.belgeNo ?? "";
                        }
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: Get.back,
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                        child: const Text("İptal"),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            final result = await _networkManager.dioPost<SiparisEditRequestModel>(
                              path: ApiUrls.saveFatura,
                              showLoading: true,
                              bodyModel: SiparisEditRequestModel(),
                              data: EditFaturaModel.fromSiparislerModel(
                                siparisModel!
                                  ..yeniBelgeNo = controller.text
                                  ..islemKodu = 10
                                  ..tag = "FaturaModel"
                                  ..belgeTipi = siparisModel.tipi,
                              ).toJson(),
                            );
                            if (result.success == true) {
                              updatePage = true;
                              _dialogManager.showSuccessSnackBar("Başarılı");
                              Get.back();
                              return;
                            }
                          }
                        },
                        child: const Text("Kaydet"),
                      ),
                    ),
                  ],
                ).paddingAll(UIHelper.lowSize),
              ],
            ),
          );
          return updatePage;
        },
      );

  BuildContext get context => Get.context!;
  GridItemModel? get siparisPDFGoruntule => GridItemModel.islemler(
        title: "PDF Görüntüle",
        iconData: Icons.picture_as_pdf_outlined,
        onTap: () async {
          final BaseSiparisEditModel? siparisModel = model as BaseSiparisEditModel?;
          final List<NetFectDizaynList> dizaynList = (_paramModel.netFectDizaynList?.filteredDizaynList(siparisModel?.getEditTipiEnum) ?? [])
              .where((element) => element.ozelKod == siparisModel?.getEditTipiEnum?.getPrintValue)
              .whereType<NetFectDizaynList>()
              .toList();
          final result =
              await _bottomSheetDialogManager.showBottomSheetDialog(context, title: "PDF Görüntüle", children: dizaynList.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList());
          if (result is NetFectDizaynList) {
            // Get.back();
            Get.to(
              () => PDFViewerView(
                title: result.dizaynAdi ?? "Serbest Raporlar",
                pdfData: PdfModel(
                  dizaynId: result.id,
                  raporOzelKod: result.ozelKod,
                  etiketSayisi: result.kopyaSayisi,
                  dicParams: DicParams(belgeNo: siparisModel?.belgeNo, cariKodu: siparisModel?.cariKodu, belgeTipi: StaticVariables.instance.isMusteriSiparisleri ? "MS" : "SS"),
                ),
              ),
            );
          }
        },
      );
  GridItemModel? get belgeyiKopyala => GridItemModel.islemler(title: "Belgeyi Kopyala", iconData: Icons.copy_outlined);
  //* Stok
  GridItemModel? get stokKarti => GridItemModel.islemler(
        title: "Stok Kartı",
        iconData: Icons.info_outline,
        onTap: () async => Get.toNamed("/mainPage/stokEdit", arguments: BaseEditModel(model: model as StokListesiModel, baseEditEnum: BaseEditEnum.duzenle)),
      );
  GridItemModel? get stokYazdir => GridItemModel.islemler(title: "Yazdır", iconData: Icons.print_outlined, onTap: () async => Get.toNamed("/mainPage/stokYazdir", arguments: model));
  GridItemModel? get fiyatGor => GridItemModel.islemler(title: "Fiyat Gör", iconData: Icons.monetization_on_outlined, onTap: () async => Get.toNamed("/mainPage/stokFiyatGecmisi", arguments: model));
  //* Cari
  GridItemModel? get paylas => GridItemModel.islemler(
        title: "Paylaş",
        iconData: Icons.share_outlined,
        onTap: () async {
          final CariListesiModel newModel = model as CariListesiModel;
          final result = await _bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
            context,
            title: "Paylaş",
            groupValues: List.generate(7, (index) => true),
            children: [
              BottomSheetModel(title: "Ünvan", value: newModel.cariAdi, groupValue: true).yetkiKontrol(newModel.cariAdi != null),
              BottomSheetModel(title: "Adres", value: newModel.cariAdres, groupValue: true).yetkiKontrol(newModel.cariAdres != null),
              BottomSheetModel(title: "İl/ İlçe", value: "${newModel.cariIl ?? ""} / ${newModel.cariIlce ?? ""}", groupValue: true).yetkiKontrol(newModel.cariIl != null || newModel.cariIlce != null),
              BottomSheetModel(title: "Vergi Bilgileri", value: "${newModel.vergiDairesi ?? ""} ${newModel.vergiNumarasi ?? ""}", groupValue: true)
                  .yetkiKontrol(newModel.vergiDairesi != null || newModel.vergiNumarasi != null),
              BottomSheetModel(title: "Telefon", value: newModel.cariTel, groupValue: true).yetkiKontrol(newModel.cariTel != null),
              BottomSheetModel(title: "Web Sitesi", value: newModel.web, groupValue: true).yetkiKontrol(newModel.web != null),
              BottomSheetModel(title: "Mail", value: newModel.email, groupValue: true).yetkiKontrol(newModel.email != null),
            ].nullCheckWithGeneric,
          );
          if ((result as List?).ext.isNotNullOrEmpty) {
            Clipboard.setData(ClipboardData(text: result!.join("\n")));
            Share.share(result.join("\n"));
          }
        },
      );

  GridItemModel? cariKoduDegistir(String? cariKodu) => GridItemModel.islemler(
        title: "Cari Kodu Değiştir",
        iconData: Icons.people_alt_outlined,
        onTap: () async {
          final TextEditingController controller = TextEditingController();
          final KodDegistirModel kodDegistirModel = KodDegistirModel()
            ..kaynakSil = "H"
            ..kaynakCari = cariKodu;
          await _bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Cari Kodu Değiştir",
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  labelText: "Cari",
                  readOnly: true,
                  isMust: true,
                  controllerText: cariKodu,
                ),
                CustomTextField(
                  labelText: "Yeni Cari Kodu",
                  controller: controller,
                  isMust: true,
                  onChanged: (p0) => kodDegistirModel.hedefCari = p0,
                  suffix: Wrap(
                    children: [
                      IconButton(
                        onPressed: () async {
                          final String? kod = await CariNetworkManager.getSiradakiKod(kod: kodDegistirModel.hedefCari);
                          kodDegistirModel.hedefCari = kod;
                          controller.text = kod ?? "";
                        },
                        icon: const Icon(Icons.format_list_numbered_rtl_outlined),
                      ),
                      IconButton(
                        onPressed: () async {
                          final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                          if (result != null) {
                            kodDegistirModel.hedefCari = (result as CariListesiModel).cariKodu;
                            controller.text = result.cariKodu ?? "";
                          }
                        },
                        icon: const Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                ),
                CustomWidgetWithLabel(
                  text: "Eski Cari Kodu Silinsin mi?",
                  isVertical: true,
                  child: Observer(
                    builder: (_) => Switch.adaptive(
                      value: viewModel.cariKodDegistirSwitch,
                      onChanged: (value) {
                        viewModel.changeCariKodDegistirSwitch(value);
                        kodDegistirModel.kaynakSil = (value ? "E" : "H");
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: Get.back,
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                        child: const Text("İptal"),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.text != "") {
                            _dialogManager.showAreYouSureDialog(() async {
                              final result = await _networkManager.dioPost<KodDegistirModel>(path: ApiUrls.kodDegistir, bodyModel: KodDegistirModel(), data: kodDegistirModel.toJson());
                              if (result.success == true) {
                                Get.back();
                                _dialogManager.showSuccessSnackBar("Başarılı");
                              }
                            });
                          } else {
                            _dialogManager.showAlertDialog("Lütfen Cari Kodu Giriniz");
                          }
                        },
                        child: const Text("Kaydet"),
                      ),
                    ),
                  ],
                ).paddingAll(UIHelper.lowSize),
              ],
            ),
          );
        },
      );

  GridItemModel get siparisCariKoduDegistir => GridItemModel.islemler(
        title: "Cari Kodu Değiştir",
        iconData: Icons.people_alt_outlined,
        onTap: () async {
          final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
          final BaseSiparisEditModel newModel = BaseSiparisEditModel.cariKoduDegistir(siparisModel);
          final TextEditingController controller = TextEditingController(text: siparisModel.cariAdi);
          return await _bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Cari Kodu Değiştir",
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  labelText: "Yeni Cari",
                  readOnly: true,
                  isMust: true,
                  controller: controller,
                  suffixMore: true,
                  onTap: () async {
                    final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                    if (result is CariListesiModel) {
                      newModel.yeniCariKodu = result.cariKodu;
                      controller.text = result.cariAdi ?? "";
                    }
                  },
                ),
                CustomWidgetWithLabel(
                  text: "Teslim Cari Kodu Değişmesin",
                  isVertical: true,
                  child: Observer(
                    builder: (_) => Switch.adaptive(
                      value: viewModel.cariKodDegistirSwitch,
                      onChanged: (value) {
                        viewModel.changeCariKodDegistirSwitch(value);
                        newModel.paramMap?["TESLIM_CARI_DEGISMESIN"] = (value ? "E" : "H");
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _dialogManager.showAreYouSureDialog(() async {
                      final result = await _networkManager.dioPost<SiparisEditRequestModel>(
                        path: ApiUrls.saveFatura,
                        showLoading: true,
                        bodyModel: SiparisEditRequestModel(),
                        data: newModel,
                      );
                      if (result.success == true) {
                        Get.back(result: true);
                        _dialogManager.showSuccessSnackBar("Başarılı");
                      } else {
                        Get.back();
                      }
                    });
                  },
                  child: const Text("Kaydet"),
                ).paddingAll(UIHelper.lowSize),
              ],
            ).paddingAll(UIHelper.lowSize),
          );
        },
      );

  GridItemModel? get borcCeki => GridItemModel.islemler(title: "Borç Çeki", iconData: Icons.local_atm_outlined, onTap: () async => await Get.toNamed("/mainPage/cekBorcTahsilat", arguments: model));
  GridItemModel? get borcSenedi =>
      GridItemModel.islemler(title: "Borç Senedi", iconData: Icons.local_atm_outlined, onTap: () async => await Get.toNamed("/mainPage/senetBorcTahsilat", arguments: model));
  GridItemModel? get cekTahsilati =>
      GridItemModel.islemler(title: "Senet tahsilatı", iconData: Icons.local_atm_outlined, onTap: () async => await Get.toNamed("/mainPage/senetMusteriTahsilat", arguments: model));
  GridItemModel? get tahsilatSenedi =>
      GridItemModel.islemler(title: "Çek Tahsilatı", iconData: Icons.local_atm_outlined, onTap: () async => await Get.toNamed("/mainPage/cekMusteriTahsilat", arguments: model));

  //* Banka
  GridItemModel? bankaCariEFTHavale({CariListesiModel? model}) =>
      GridItemModel.islemler(title: "Cari EFT/Havale", iconData: Icons.local_atm_outlined, onTap: () async => await Get.toNamed("/mainPage/cariEFTHavale", arguments: model));
  GridItemModel? get bankaHareketleri =>
      GridItemModel.islemler(title: "Banka Hareketleri", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaHareketleri", arguments: model));

  GridItemModel? get bankaKasaTransferi =>
      GridItemModel.islemler(title: "Banka Kasa Transferi", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaKasaTransferi", arguments: model));
  GridItemModel? get hesaplarArasiVirman =>
      GridItemModel.islemler(title: "Hesaplar Arası Virman", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/hesaplarArasiVirman"));
  GridItemModel? get hesaplarArasiEftHavale =>
      GridItemModel.islemler(title: "Hesaplar Arası EFT/Havale", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/hesaplarArasiEftHavale"));
  GridItemModel? get bankaMuhtelifTahsilat =>
      GridItemModel.islemler(title: "Muhtelif Tahsilat", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaMuhtelifTahsilat"));
  GridItemModel? get bnkaMuhtelifOdeme => GridItemModel.islemler(title: "Muhtelif Ödeme", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaMuhtelifOdeme"));

  //* Kasa
  GridItemModel? get kasaTransferi => GridItemModel.islemler(title: "Kasalar Arası Transferi", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/kasaTransferi"));
  GridItemModel? krediKartiTahsilati(dynamic value) =>
      GridItemModel.islemler(title: "Kredi Kartı Tahsilatı", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/krediKartiTahsilati", arguments: value));
  GridItemModel? nakitTahsilat(dynamic value) =>
      GridItemModel.islemler(title: "Nakit Tahsilat", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/nakitTahsilat", arguments: value));
  GridItemModel? nakitOdeme(dynamic value) =>
      GridItemModel.islemler(title: "Nakit Ödeme", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/nakitOdeme", arguments: value));
  GridItemModel? get muhtelifTahsilat => GridItemModel.islemler(title: "Muhtelif\nTahsilat", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/muhtelifTahsilat"));
  GridItemModel? get muhtelifOdeme => GridItemModel.islemler(title: "Muhtelif\nÖdeme", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/muhtelifOdeme"));
  GridItemModel? get kasaHareketleri =>
      GridItemModel.islemler(title: "Kasa Hareketleri", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/kasaHareketleri", arguments: model));

  //* Çek Senet
  GridItemModel? get odemeDekontOlustur =>
      GridItemModel.islemler(title: "Ödeme Dekont Oluştur", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/odemeDekontOlustur", arguments: model));
  GridItemModel? get cariHesabaCirola =>
      GridItemModel.islemler(title: "Cari Hesaba Cirola", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/cariHesabaCirola", arguments: model));
  GridItemModel? get tahsilHesabaCirola =>
      GridItemModel.islemler(title: "Tahsil Hesaba Cirola", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/tahsilHesabaCirola", arguments: model));
  GridItemModel? get kasaTahsilEt => GridItemModel.islemler(
        title: (model as CekSenetListesiModel).cekSenetListesiEnum.borcMu ? "Kasadan Öde" : "Kasa Tahsil Et",
        iconData: Icons.add_outlined,
        onTap: () async => await Get.toNamed("/mainPage/kasadanTahsilEt", arguments: model),
      );

  //* Talep Teklif
  GridItemModel get belgeBaglantilari => GridItemModel.islemler(
        title: "Belge Bağlantıları",
        iconData: Icons.hub_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            final result =
                await _bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(context, cariKodu: siparisModel.cariKodu, belgeTipi: siparisModel.belgeTuru, belgeNo: siparisModel.belgeNo);
            if (result is KalemListModel) {
              final BaseSiparisEditModel newModel = BaseSiparisEditModel(belgeTuru: result.belgeTipi, belgeNo: result.belgeNo, cariKodu: result.cariKodu);
              if (result.belgeTipi == "MS") {
                Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.musteri));
              } else if (result.belgeTipi == "SS") {
                Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.satici));
              } else if (result.belgeTipi == "SF") {
                Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.satisFatura));
              } else if (result.belgeTipi == "AF") {
                Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.alisFatura));
              } else if (result.belgeTipi == "SI") {
                Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.satisIrsaliye));
              } else if (result.belgeTipi == "AI") {
                Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.alisIrsaliye));
              }
              // else if (result.belgeTipi == "") {
              //   Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: result, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.musteri));
              // } else if (result.belgeTipi == "IS") {
              //   Get.toNamed("mainPage/irsaliyeEdit", arguments: BaseEditModel(model: result, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.musteri));
              // }
            }
          }
        },
      );

  GridItemModel get cariKarti => GridItemModel.islemler(
        title: "Cari Kartı",
        iconData: Icons.person_outline_outlined,
        onTap: () async {
          if (model is CariListesiModel) {
            final cariModel = await _networkManager.getCariModel(CariRequestModel.fromCariListesiModel(model as CariListesiModel));
            if (cariModel != null) {
              Get.toNamed("mainPage/cariEdit", arguments: BaseEditModel(model: cariModel, baseEditEnum: BaseEditEnum.duzenle));
            }
          }
        },
      );

  GridItemModel get cariIslemleri => GridItemModel.islemler(
        title: "İşlemler",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          _dialogManager.showCariGridViewDialog(model as CariListesiModel);
        },
      );

  GridItemModel get saticiSiparisiOlustur => GridItemModel.islemler(
        title: "Satıcı Siparişi Oluştur",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satici));
          }
        },
      );
  GridItemModel get musteriSiparisiOlustur => GridItemModel.islemler(
        title: "Müşteri Siparişi Oluştur",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            final kalemler = await Get.toNamed("mainPage/kalemRehberi", arguments: siparisModel);
            if (kalemler != null && kalemler is List<KalemModel>) {
              final List<KalemModel> newKalemler = kalemler.map(KalemModel.forTalepTeklifSiparislestir).toList().cast<KalemModel>();
              final TextEditingController controller = TextEditingController();

              await getBelgeNo(controller, siparisModel);
              // ignore: use_build_context_synchronously
              return await _bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: "Belge No",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      labelText: "Belge No",
                      controller: controller,
                      isMust: true,
                      maxLength: 15,
                      suffix: IconButton(
                        onPressed: () async => await getBelgeNo(controller, siparisModel),
                        icon: const Icon(Icons.format_list_numbered_rtl_outlined),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final result = await _networkManager.dioPost<SiparisEditRequestModel>(
                          path: ApiUrls.talepTeklifSiparislestir,
                          showLoading: true,
                          bodyModel: SiparisEditRequestModel(),
                          data: EditFaturaModel.fromSiparislerModel(
                            siparisModel
                              ..yeniBelgeNo = controller.text
                              ..kalemList = newKalemler,
                          ).toJson(),
                        );
                        if (result.success == true) {
                          _dialogManager.showSuccessSnackBar("Başarılı");
                          Get.back(result: true);
                          controller.dispose();
                        }
                      },
                      child: const Text("Kaydet"),
                    ).paddingAll(UIHelper.lowSize),
                  ],
                ).paddingAll(UIHelper.lowSize),
              );
            }
          }
        },
      );

  Future<void> getBelgeNo(TextEditingController controller, BaseSiparisEditModel siparisModel) async {
    final result = await _networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {
        "Seri": controller.text,
        "BelgeTipi": "MS",
        "EIrsaliye": "H",
        "CariKodu": siparisModel.cariKodu ?? "",
      },
    );
    if (result.success == true) {
      final List<BaseSiparisEditModel>? list = result.data.map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
      controller.text = list?.firstOrNull?.belgeNo ?? "";
    }
  }

  GridItemModel get talTekRevizeEt => GridItemModel.islemler(
        title: "Revize Et",
        iconData: Icons.app_registration_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            return await Get.toNamed("mainPage/talTekEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.revize, editTipiEnum: siparisTipi));
          }
        },
      );
  GridItemModel get alistanSatisFaturasiOlustur => GridItemModel.islemler(
        title: "Satış Faturası Oluştur",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            return await Get.toNamed(
              "mainPage/faturaEdit",
              arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisFatura),
            );
          }
        },
      );
  GridItemModel get satisIrsaliyeOlustur => GridItemModel.islemler(
        title: "Satış İrsaliyesi Oluştur",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            if (!siparisModel.getEditTipiEnum.siparisMi) {
              final result =
                  await _bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(context, cariKodu: siparisModel.cariKodu, belgeTipi: siparisModel.belgeTuru, belgeNo: siparisModel.belgeNo);
              if (result != null) {
                final kalemList = await getKalemRehberi(siparisModel.copyWith(cariKodu: result.cariKodu, belgeNo: result.belgeNo));
                if (kalemList == null) {
                  return;
                }
                siparisModel.kalemList = kalemList;
                return await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisIrsaliye, belgeNo: result.belgeNo),
                );
              } else {
                return;
              }
            } else {
              final result = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(siparisModel));
              if (result == null) {
                return;
              } else {
                final kalemList = await getKalemRehberi(result);
                if (kalemList == null) {
                  return;
                }
                siparisModel.kalemList = kalemList;
                return await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(model: result, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisIrsaliye, belgeNo: result.belgeNo),
                );
              }
            }
          }
        },
      );
  GridItemModel get siparistenFaturaOlustur => GridItemModel.islemler(
        title: "Fatura Oluştur (Siparişten)",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            if (!siparisModel.getEditTipiEnum.siparisMi) {
              final result = await _bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(
                context,
                cariKodu: siparisModel.cariKodu,
                belgeTipi: siparisModel.belgeTuru,
                belgeNo: siparisModel.belgeNo,
                filterText: EditTipiEnum.values.where((element) => element.siparisMi).map((e) => e.rawValue).toList(),
              );
              if (result != null) {
                final kalemList = await getKalemRehberi(siparisModel.copyWith(cariKodu: result.cariKodu, belgeNo: result.belgeNo));
                if (kalemList == null) {
                  return;
                }
                siparisModel.kalemList = kalemList;
                return await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisFatura, belgeNo: result.belgeNo),
                );
              } else {
                return;
              }
            } else {
              final result = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(siparisModel));
              if (result == null) {
                return;
              } else {
                final kalemList = await getKalemRehberi(result);
                if (kalemList == null) {
                  return;
                }
                for (var element in kalemList) {
                  element.siparisNo = element.belgeNo;
                  element.siparisSira = element.sira;
                }
                result.kalemList = kalemList;
                final boolean = await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(model: result, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisFatura, belgeNo: result.belgeNo),
                );
                if (boolean == true) {
                  return true;
                }
              }
            }
          }
        },
      );
  GridItemModel get irsaliyedenFaturaOlustur => GridItemModel.islemler(
        title: "Fatura Oluştur (İrsaliyeden)",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            final result =
                await _bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(context, cariKodu: siparisModel.cariKodu, belgeTipi: siparisModel.belgeTuru, belgeNo: siparisModel.belgeNo);
            return await Get.toNamed(
              "mainPage/faturaEdit",
              arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisFatura, belgeNo: result?.belgeNo),
            );
          }
        },
      );

  GridItemModel get talTekOnayla {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: siparisModel.onaydaMi ? "Onayla" : "Onayı Kaldır",
      iconData: siparisModel.onaydaMi ? Icons.check_circle_outline : Icons.cancel_outlined,
      onTap: () async {
        final BaseSiparisEditModel newSiparisModel = BaseSiparisEditModel()
          ..belgeNo = siparisModel.belgeNo
          ..belgeTuru = siparisModel.belgeTuru
          ..pickerBelgeTuru = siparisModel.belgeTuru
          ..cariKodu = siparisModel.cariKodu
          ..islemKodu = siparisModel.onaydaMi ? 1 : 3
          ..tag = "FaturaModel";
        final result = await _networkManager.dioPost<BaseSiparisEditModel>(
          path: ApiUrls.saveFatura,
          bodyModel: BaseSiparisEditModel(),
          data: newSiparisModel.toJson(),
          showLoading: true,
        );
        if (result.success == true) {
          _dialogManager.showSuccessSnackBar("Kayıt Başarılı");
          return true;
        } else {
          return false;
        }
      },
    );
  }

  Future<List<KalemModel>?> getKalemRehberi(BaseSiparisEditModel model) async {
    final result = await Get.toNamed("/mainPage/kalemRehberi", arguments: model..belgeTuru = "MS");
    if (result is List) {
      final List<KalemModel> list = result.map((e) => e as KalemModel).toList().cast<KalemModel>();
      return list
          .map(
            (KalemModel e) => e
              ..miktar = e.kalan
              ..kalan = 0,
          )
          .toList();
    }
    return null;
  }

  //* E-Fatura

  GridItemModel get eFaturaGonder {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "${siparisModel.getTitle} Gönder",
      iconData: Icons.send_outlined,
      onTap: () async {
        final BaseSiparisEditModel? newSiparisModel = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(model as BaseSiparisEditModel));
        if (newSiparisModel == null) {
          return;
        }
        return await Get.toNamed("/mainPage/eBelgeGonder", arguments: newSiparisModel);
      },
    );
  }

  GridItemModel get eBelgeGoruntule {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "E-Belge Görüntüle",
      iconData: Icons.picture_as_pdf_outlined,
      onTap: () async => await Get.toNamed("/mainPage/eBelgePdf", arguments: EBelgeListesiModel.fromBaseSiparisEditModel(siparisModel)),
    );
  }

  GridItemModel get durumSorgula {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Durum Sorgula",
      iconData: Icons.refresh_outlined,
      onTap: () async {
        final result = await _networkManager.dioGet<EBelgeListesiModel>(
          path: ApiUrls.getEFaturalar,
          showLoading: true,
          bodyModel: EBelgeListesiModel(),
          queryParameters: {"FilterModel": jsonEncode(EBelgeListesiModel.fromBaseSiparisEditModel(siparisModel).durumSorgula.toJson())},
        );
        if (result.success == true) {
          final EBelgeListesiModel eBelgeListesiModel = result.data!.first;
          _dialogManager.showInfoSnackBar(eBelgeListesiModel.onayDurumuString);
          return true;
        }
      },
    );
  }

  GridItemModel get eBelgetaslakSil {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Taslağı Sil",
      iconData: Icons.delete_outline,
      onTap: () async {
        bool boolean = false;
        await _dialogManager.showAreYouSureDialog(() async {
          boolean = true;
        });
        if (boolean) {
          final result = await _networkManager.dioPost<EBelgeListesiModel>(
            path: ApiUrls.eBelgeIslemi,
            showLoading: true,
            bodyModel: EBelgeListesiModel(),
            data: EBelgeListesiModel.fromBaseSiparisEditModel(siparisModel).taslakSil.toJson(),
          );
          if (result.success == true) {
            _dialogManager.showSuccessSnackBar("Başarılı");
            boolean = true;
          } else {
            boolean = false;
          }
          return boolean;
        }
      },
    );
  }

  GridItemModel get eBelgeYazdir {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Yazdır",
      iconData: Icons.print_outlined,
      onTap: () async {
        final EBelgeListesiModel model = EBelgeListesiModel.fromBaseSiparisEditModel(siparisModel);
        return await _bottomSheetDialogManager.showEBelgePrintBottomSheetDialog(context, model);
      },
    );
  }

  GridItemModel get eBelgeEslestir {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "E-Belge Eşleştir",
      iconData: Icons.hub_outlined,
      onTap: () async {
        bool boolean = false;
        await _dialogManager.showAreYouSureDialog(() async {
          boolean = true;
        });
        if (boolean) {
          final result = await _networkManager.dioPost<EBelgeListesiModel>(
            path: ApiUrls.eBelgeIslemi,
            showLoading: true,
            bodyModel: EBelgeListesiModel(),
            data: EBelgeListesiModel.eBelgeEslestir(siparisModel).toJson(),
          );
          if (result.success == true) {
            _dialogManager.showSuccessSnackBar("Başarılı");
            boolean = true;
          } else {
            boolean = false;
          }
        }
        return boolean;
      },
    );
  }

  GridItemModel get eBelgeEslestirmeKaldir {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Eşleştirme İptali",
      iconData: Icons.delete_outline_outlined,
      onTap: () async {
        bool boolean = false;
        await _dialogManager.showAreYouSureDialog(() async {
          boolean = true;
        });
        if (boolean) {
          final result = await _networkManager.dioPost<EBelgeListesiModel>(
            path: ApiUrls.eBelgeIslemi,
            showLoading: true,
            bodyModel: EBelgeListesiModel(),
            data: EBelgeListesiModel.eBelgeEslestirmeKaldir(siparisModel).toJson(),
          );
          if (result.success == true) {
            _dialogManager.showSuccessSnackBar("Başarılı");
            boolean = true;
          } else {
            boolean = false;
          }
        }
        return boolean;
      },
    );
  }
}
