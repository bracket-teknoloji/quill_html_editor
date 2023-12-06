import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
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
import "../../../../../../base/model/delete_fatura_model.dart";
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
  BottomSheetDialogManager bottomSheetDialogManager = BottomSheetDialogManager();
  IslemTipiEnum islemtipi;
  ThemeData get theme => AppThemeDark.instance?.theme ?? ThemeData();
  EditTipiEnum? siparisTipi;
  List<GridItemModel?> islemlerList = [];
  T? model;
  // T? get model2 => model;
  DialogManager get _dialogManager => DialogManager();
  NetworkManager get _networkManager => NetworkManager();
  IslemlerMenuItemConstants({required this.islemtipi, List<GridItemModel?>? raporlar, this.model, this.siparisTipi}) {
    if (islemtipi == IslemTipiEnum.stok) {
      islemlerList.add(stokKarti);
      islemlerList.add(kopyala);
      islemlerList.add(stokYazdir);
      islemlerList.add(fiyatGor);
      islemlerList.addAll(raporlar!);
    } else if (islemtipi == IslemTipiEnum.cari) {
      if (model is CariListesiModel) {
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
        islemlerList.add(cariKoduDegistir);
        islemlerList.addAll(raporlar!);
      }
    } else if (islemtipi == IslemTipiEnum.siparis) {
      // islemlerList.add(irsaliyeOlustur);
      // islemlerList.add(faturaOlustur);
      islemlerList.add(belgeyiKapat);
      islemlerList.add(siparisPDFGoruntule);
      islemlerList.add(cariKoduDegistir);
      islemlerList.add(belgeNoDegistir);
      islemlerList.add(kopyala);
      islemlerList.addAll(raporlar!);
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
        islemlerList.add(saticiSiparisiOlustur);
        islemlerList.add(musteriSiparisiOlustur);
        islemlerList.add(satisIrsaliyeOlustur);
        if (siparisModel.siparislesti == "E" || siparisModel.faturalasti == "E") {
          islemlerList.add(belgeBaglantilari);
        }
        islemlerList.add(belgeyiKapat);
        islemlerList.add(kopyala);
        islemlerList.add(cariKoduDegistir);
        if (siparisModel.tipi != 1) {
          islemlerList.add(belgeNoDegistir);
        }
      }
    } else if (islemtipi == IslemTipiEnum.fatura) {
      islemlerList.add(belgeyiKapat);
      islemlerList.add(siparisPDFGoruntule);
      islemlerList.add(cariKoduDegistir);
      islemlerList.add(kopyala);
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
  GridItemModel? get belgeyiKapat {
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
      DialogManager().showSuccessSnackBar("Başarılı");
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
          await bottomSheetDialogManager.showBottomSheetDialog(
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
                          controller.text = result.data?.first.belgeNo ?? "";
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
                            final result = await NetworkManager().dioPost<SiparisEditRequestModel>(
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
                              DialogManager().showSuccessSnackBar("Başarılı");
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
          final List<NetFectDizaynList> dizaynList =
              (CacheManager.getAnaVeri?.paramModel?.netFectDizaynList?.filteredDizaynList(siparisTipi) ?? []).where((element) => element.ozelKod == siparisTipi?.getPrintValue).whereType<NetFectDizaynList>().toList();
          final result =
              await bottomSheetDialogManager.showBottomSheetDialog(context, title: "PDF Görüntüle", children: dizaynList.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList());
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
          final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
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

  GridItemModel? get cariKoduDegistir => GridItemModel.islemler(
        title: "Cari Kodu Değiştir",
        iconData: Icons.people_alt_outlined,
        onTap: () async {
          final TextEditingController controller = TextEditingController();
          final KodDegistirModel kodDegistirModel = KodDegistirModel()
            ..kaynakSil = "H"
            ..kaynakCari = model is CariListesiModel ? (model as CariListesiModel).cariKodu : (model is BaseSiparisEditModel ? (model as BaseSiparisEditModel).cariKodu : null);
          await bottomSheetDialogManager.showBottomSheetDialog(
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
                  controllerText: model is CariListesiModel ? (model as CariListesiModel).cariAdi : null,
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
                            DialogManager().showAreYouSureDialog(() async {
                              final result = await NetworkManager().dioPost<KodDegistirModel>(path: ApiUrls.kodDegistir, bodyModel: KodDegistirModel(), data: kodDegistirModel.toJson());
                              if (result.success == true) {
                                Get.back();
                                DialogManager().showSuccessSnackBar("Başarılı");
                              }
                            });
                          } else {
                            DialogManager().showAlertDialog("Lütfen Cari Kodu Giriniz");
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
                await BottomSheetDialogManager().showBelgeBaglantilariBottomSheetDialog(context, cariKodu: siparisModel.cariKodu, belgeTipi: siparisModel.belgeTuru, belgeNo: siparisModel.belgeNo);
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
            Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.musteri));
          }
        },
      );

  GridItemModel get satisIrsaliyeOlustur => GridItemModel.islemler(
        title: "${siparisTipi?.getName} Oluştur",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;

            final result =
                await BottomSheetDialogManager().showBelgeBaglantilariBottomSheetDialog(context, cariKodu: siparisModel.cariKodu, belgeTipi: siparisModel.belgeTuru, belgeNo: siparisModel.belgeNo);
            Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisIrsaliye, belgeNo: result?.belgeNo));
          }
        },
      );
  GridItemModel get faturaOlustur => GridItemModel.islemler(
        title: "${siparisTipi?.getName} Oluştur",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;

            final result =
                await BottomSheetDialogManager().showBelgeBaglantilariBottomSheetDialog(context, cariKodu: siparisModel.cariKodu, belgeTipi: siparisModel.belgeTuru, belgeNo: siparisModel.belgeNo);
            Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: siparisTipi));
          }
        },
      );
}
