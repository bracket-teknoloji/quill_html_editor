import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:share_plus/share_plus.dart";

import "../../../../../../../view/add_company/model/account_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_save_request_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../../../../view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/kalem_list_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "../../../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../../../view/main_page/model/grid_item_model.dart";
import "../../../../../../../view/main_page/model/param_model.dart";
import "../../../../../../../view/main_page/model/user_model/profil_yetki_model.dart";
import "../../../../../../base/model/base_edit_model.dart";
import "../../../../../../base/model/edit_fatura_model.dart";
import "../../../../../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../constants/enum/base_edit_enum.dart";
import "../../../../../../constants/enum/cek_senet_listesi_enum.dart";
import "../../../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../../../constants/enum/islem_tipi_enum.dart";
import "../../../../../../constants/extensions/list_extensions.dart";
import "../../../../../../constants/ui_helper/ui_helper.dart";
import "../../../../../../constants/yetki_controller/yetki_controller.dart";
import "../../../../../../init/cache/cache_manager.dart";
import "../../../../../../init/network/login/api_urls.dart";
import "../../../../../../init/network/network_manager.dart";
import "../../../../../../init/theme/app_theme_dark.dart";
import "../../../../../../utils/map_utils.dart";
import "../../../../../dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "../../../../../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../dialog/dialog_manager.dart";
import "../../../../../helper_widgets/custom_label_widget.dart";
import "../../../../../textfield/custom_text_field.dart";
import "../../kod_degistir_model.dart";
import "../view_model/islemler_menu_item_constants_view_model.dart";

final class IslemlerMenuItemConstants<T> {
  IslemlerMenuItemConstants(this.context, {required this.islemTipi, List<GridItemModel>? raporlar, this.model, this.siparisTipi}) {
    if (islemTipi == IslemTipiEnum.stok) {
      islemlerList
        ..add(stokKarti)
        ..add(kopyala)
        ..add(stokHareketleri)
        ..add(stokYazdir)
        ..add(hucreHareketleri)
        ..add(depoBakiyeDurumu)
        ..add(fiyatGor)
        ..add(stokResimleri)
        ..add(stokFiyatOzeti)
        ..add(seriHareketleri)
        ..add(seriBakiyeleri);

      if (raporlar!.firstOrNull?.altMenuVarMi ?? false) islemlerList.addAll(raporlar);
    } else if (islemTipi case (IslemTipiEnum.cari || IslemTipiEnum.cariListesi)) {
      if (model is CariListesiModel) {
        final CariListesiModel newModel = model as CariListesiModel;
        islemlerList
          ..add(cariSatisTeklifi)
          ..add(cariSatisTalebi)
          ..add(cariMusteriSiparisi)
          ..add(cariSaticiSiparisi)
          ..add(cariAlisIrsaliyesi)
          ..add(cariAlisFaturasi)
          ..add(cariSatisIrsaliyesi)
          ..add(cariSatisFaturasi)
          ..add(bankaCariEFTHavale(model: model as CariListesiModel))
          ..add(nakitTahsilat(model))
          ..add(nakitOdeme(model))
          ..add(krediKartiTahsilati(model))
          ..add(borcCeki)
          ..add(borcSenedi)
          ..add(cekTahsilati)
          ..add(tahsilatSenedi)
          ..add(cariVirman)
          ..addIfConditionTrue(newModel.enlem != null, konumGoster)
          ..add(konumAta)
          ..add(paylas)
          ..addIfConditionTrue(_yetkiController.cariKartiYeniKayit, kopyala)
          ..add(cariHareketleri)
          ..add(stokHareketleri)
          ..add(cariAktivite)
          ..add(cariAktiviteKaydiGir)
          ..addIfConditionTrue(islemTipi == IslemTipiEnum.cariListesi, cariKoduDegistir(newModel.cariKodu));
        if (raporlar!.firstOrNull?.altMenuVarMi ?? false) islemlerList.addAll(raporlar);
      }
    } else if (islemTipi == IslemTipiEnum.siparis) {
      if (model is BaseSiparisEditModel) {
        final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
        // islemlerList.add(irsaliyeOlustur);
        if (siparisModel.getEditTipiEnum?.musteriMi ?? false) islemlerList.addIfConditionTrue(!siparisModel.onaydaMi && _yetkiController.satisIrsEkle, satisIrsaliyeOlustur);
        if (siparisModel.getEditTipiEnum?.saticiMi ?? false) islemlerList.addIfConditionTrue(!siparisModel.onaydaMi && _yetkiController.alisIrsEkle, alisIrsaliyeOlustur);
        islemlerList
          ..add(siparisPDFGoruntule)
          ..addIfConditionTrue(!siparisModel.onaydaMi, siparistenFaturaOlustur)
          ..addIfConditionTrue(siparisModel.siparislestiMi || siparisModel.faturalastiMi || siparisModel.irsaliyelestiMi, belgeBaglantilari)
          ..add(belgeNoDegistir)
          ..add(siparisCariKoduDegistir)
          ..addIfConditionTrue(!siparisModel.onaydaMi, belgeyiKapatAc)
          ..addIfConditionTrue((siparisModel.onaydaMi || siparisModel.onaylandiMi) && _yetkiController.siparisOnayIslemleri(siparisModel.belgeTuru), talTekOnayla)
          ..add(kopyala);

        if (raporlar!.firstOrNull?.altMenuVarMi ?? false) islemlerList.addAll(raporlar);
      }
    } else if (islemTipi == IslemTipiEnum.cariIslemleri) {
      islemlerList
        ..addIfConditionTrue(_yetkiController.cariKarti, cariKarti)
        ..addIfConditionTrue(_yetkiController.cariHareketleri, cariHareketleri);

      if (raporlar!.firstOrNull?.altMenuVarMi ?? false) islemlerList.addAll(raporlar);
      islemlerList
        ..add(konumaGit)
        ..add(cariIslemleri((model as CariListesiModel).cariKodu))
        ..add(paylas);
    } else if (islemTipi == IslemTipiEnum.kasa) {
      if (model != null) {
        islemlerList.add(kasaHareketleri);
      }
      islemlerList
        ..add(bankaKasaTransferi)
        ..add(nakitTahsilat(null))
        ..add(nakitOdeme(null))
        ..add(krediKartiTahsilati(null))
        ..add(kasaTransferi)
        ..add(muhtelifTahsilat)
        ..add(muhtelifOdeme);

      if (raporlar?.firstOrNull?.altMenuVarMi ?? false) islemlerList.addAll(raporlar!);
    } else if (islemTipi == IslemTipiEnum.cariHareketleri) {
      islemlerList
        ..add(nakitOdeme(model))
        ..add(nakitTahsilat(model))
        ..add(krediKartiTahsilati(model))
        ..add(tahsilatSenedi)
        ..add(cekTahsilati)
        ..add(borcCeki)
        ..add(borcSenedi)
        ..add(bankaCariEFTHavale(model: model as CariListesiModel));
    } else if (islemTipi == IslemTipiEnum.banka) {
      islemlerList
        ..addIfConditionTrue(model != null, bankaHareketleri)
        ..add(bankaCariEFTHavale())
        ..add(bankaKasaTransferi)
        ..add(hesaplarArasiVirman)
        ..add(hesaplarArasiEftHavale)
        ..add(bankaMuhtelifTahsilat)
        ..add(bnkaMuhtelifOdeme);
    } else if (islemTipi == IslemTipiEnum.cekSenet) {
      final CekSenetListesiModel cekModel = model as CekSenetListesiModel;
      if (cekModel.cekSenetListesiEnum.borcMu) {
        islemlerList.add(odemeDekontOlustur);
      } else {
        islemlerList
          ..addIfConditionTrue(cekModel.yeri == "P" && cekModel.cekSenetListesiEnum.cariHesabinaCirola, cariHesabaCirola)
          ..addIfConditionTrue(cekModel.yeri == "P" && cekModel.cekSenetListesiEnum.tahsilatCirola, tahsilHesabaCirola)
          ..addIfConditionTrue(cekModel.yeri == "P" && _yetkiController.finansKasaIslemleri, kasaTahsilEt)
          ..addIfConditionTrue(cekModel.yeri == "T" && cekModel.cekSenetListesiEnum.tahsilDekontu, tahsilatDekontOlustur);
      }
    } else if (islemTipi == IslemTipiEnum.tahsilatOdeme) {
      islemlerList
        ..add(nakitOdeme(model))
        ..add(nakitTahsilat(model))
        ..add(krediKartiTahsilati(model))
        ..add(tahsilatSenedi)
        ..add(cekTahsilati)
        ..add(borcSenedi)
        ..add(borcCeki);
    } else if (islemTipi == IslemTipiEnum.talepTeklif) {
      if (model is BaseSiparisEditModel) {
        final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
        islemlerList
          ..add(siparisPDFGoruntule)
          ..addIfConditionTrue(!siparisModel.kapaliMi && siparisModel.stekMi, talTekRevizeEt)
          ..addIfConditionTrue(siparisModel.atalMi && siparisModel.teklifSipariseDonerMi, saticiSiparisiOlustur)
          ..addIfConditionTrue((siparisModel.stalMi || siparisModel.stekMi) && siparisModel.teklifSipariseDonerMi, musteriSiparisiOlustur)
          ..addIfConditionTrue(siparisModel.stekMi && siparisModel.teklifIrsaliyeDonerMi, satisIrsaliyeOlustur)
          ..addIfConditionTrue(siparisModel.stekMi && siparisModel.teklifFaturayaDonerMi && !siparisModel.irsaliyelestiMi, siparistenFaturaOlustur)
          ..addIfConditionTrue(siparisModel.siparislestiMi || siparisModel.faturalastiMi || siparisModel.irsaliyelestiMi, belgeBaglantilari)
          ..addIfConditionTrue(!siparisModel.onaydaMi, belgeyiKapatAc)
          ..add(kopyala)
          ..add(cariIslemleri(siparisModel.cariKodu ?? ""))
          ..add(siparisCariKoduDegistir)
          ..addIfConditionTrue(!siparisModel.kapaliMi, belgeNoDegistir)
          ..addIfConditionTrue((siparisModel.onaydaMi || siparisModel.onaylandiMi) && _yetkiController.taltekOnayIslemleri(siparisModel.belgeTuru), talTekOnayla);
      }
    } else if (islemTipi == IslemTipiEnum.fatura) {
      final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
      islemlerList
        ..addIfConditionTrue(siparisModel.getEditTipiEnum?.irsaliyeMi == true, irsaliyeFaturalastir)
        ..addIfConditionTrue(siparisModel.getEditTipiEnum?.alisIrsaliyesiMi == true && kDebugMode, satisIrsaliyeOlustur)
        ..add(siparisPDFGoruntule)
        ..add(siparisCariKoduDegistir)
        ..add(faturaBelgeNoDegistir)
        ..addIfConditionTrue(siparisModel.aFaturaMi, alistanSatisFaturasiOlustur);
    } else if (islemTipi == IslemTipiEnum.eBelge) {
      final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
      islemlerList
        ..addIfConditionTrue(siparisModel.eBelgeMi, eBelgeGoruntule)
        ..addIfConditionTrue(siparisModel.taslakMi, eBelgetaslakSil)
        ..addIfConditionTrue(siparisModel.getEditTipiEnum.alisFaturasiMi && !siparisModel.eFaturaMi, eBelgeEslestir)
        ..addIfConditionTrue(siparisModel.getEditTipiEnum.alisFaturasiMi && siparisModel.eFaturaMi, eBelgeEslestirmeKaldir)
        ..addIfConditionTrue(
          !siparisModel.uyariMi &&
              !siparisModel.hataliMi &&
              !siparisModel.basariliMi &&
              (siparisModel.getEditTipiEnum.satisFaturasiMi || (siparisModel.getEditTipiEnum.satisIrsaliyesiMi && siparisModel.eBelgeCheckBoxMi)),
          eFaturaGonder,
        )
        ..addIfConditionTrue(siparisModel.uyariMi || siparisModel.basariliMi || siparisModel.hataliMi, durumSorgula)
        ..addIfConditionTrue(siparisModel.eBelgeMi, eBelgeYazdir);
      // islemlerList.add(eBelgeYazdir);
    } else if (islemTipi == IslemTipiEnum.depoTransferi) {
      final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
      islemlerList
        ..addIfConditionTrue(
          siparisModel.datOnayda == "E" &&
              (AccountModel.instance.adminMi || (_yetkiController.transferDatOnay && (_userModel!.transferDatOnayIslemleriDepolar?.contains(siparisModel.topluDepo ?? -1) ?? false))),
          transferOnayla,
        )
        ..add(siparisPDFGoruntule)
        ..add(siparisCariKoduDegistir)
        ..add(faturaBelgeNoDegistir)
        ..add(kopyala);
    }
  }
  BuildContext context;
  IslemlerMenuItemConstantsViewModel viewModel = IslemlerMenuItemConstantsViewModel();
  IslemTipiEnum islemTipi;
  ThemeData get theme => AppThemeDark.instance?.theme ?? ThemeData();
  EditTipiEnum? siparisTipi;
  List<GridItemModel> islemlerList = [];
  T? model;
  // T? get model2 => model;
  DialogManager get _dialogManager => DialogManager();
  NetworkManager get _networkManager => NetworkManager();
  ParamModel get _paramModel => CacheManager.getAnaVeri?.paramModel ?? ParamModel();
  YetkiController get _yetkiController => YetkiController();
  ProfilYetkiModel? get _userModel => CacheManager.getAnaVeri?.userModel?.profilYetki;
  BottomSheetDialogManager get _bottomSheetDialogManager => BottomSheetDialogManager();

  GridItemModel get cariHareketleri => GridItemModel.islemler(
        isEnabled: _yetkiController.cariHareketleri,
        iconData: Icons.sync_alt_outlined,
        title: "Cari Hareketleri",
        onTap: () async => Get.toNamed("mainPage/cariHareketleri", arguments: model),
      );

  //* Genel
  GridItemModel get stokHareketleri => GridItemModel.islemler(
        isEnabled: _yetkiController.stokHareketleriStokHareketleri,
        iconData: Icons.sync_alt_outlined,
        title: "Stok Hareketleri",
        onTap: () async => Get.toNamed("mainPage/stokHareketleri", arguments: model),
      );
  GridItemModel get cariAktivite => GridItemModel.islemler(
        iconData: Icons.sync_alt_outlined,
        isEnabled: _yetkiController.cariAktivite,
        title: "Cari Aktivite",
        onTap: () async => Get.toNamed("mainPage/cariAktivite", arguments: model),
      );
  GridItemModel get cariAktiviteKaydiGir => GridItemModel.islemler(
        iconData: Icons.add_chart_outlined,
        isEnabled: _yetkiController.cariAktiviteYeniKayit,
        title: "Aktivite Kaydı Gir",
        onTap: () async => Get.toNamed(
          "mainPage/cariAktiviteEdit",
          arguments: BaseEditModel<CariAktiviteListesiModel>(baseEditEnum: BaseEditEnum.ekle, model: CariAktiviteListesiModel.fromCariListesiModel(model as CariListesiModel)),
        ),
      );
  GridItemModel get kopyala => GridItemModel.islemler(
        title: "Kopyala",
        iconData: Icons.copy_outlined,
        isEnabled: ((siparisTipi?.eklensinMi ?? true) && (siparisTipi?.kopyalanabilirMi ?? true)) || AccountModel.instance.adminMi,
        onTap: () async => await Get.toNamed(
          islemTipi.route,
          arguments: BaseEditModel(
            model: model,
            baseEditEnum: BaseEditEnum.kopyala,
            editTipiEnum: siparisTipi ?? (model is BaseSiparisEditModel ? (model as BaseSiparisEditModel).getEditTipiEnum : null),
          ),
        ),
      );
  //* Siparis
  GridItemModel get irsaliyeOlustur => GridItemModel.islemler(title: "İrsaliye Oluştur", iconData: Icons.conveyor_belt);
  GridItemModel get belgeyiKapatAc {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    if (siparisModel.tipi != 1) {
      return GridItemModel.islemler(
        title: "Belgeyi Kapat",
        isEnabled: (siparisTipi?.belgeKapatabilirMi ?? false) || AccountModel.instance.adminMi,
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
        isEnabled: AccountModel.instance.adminMi,
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

  Future<bool> kilitRequest(BaseSiparisEditModel siparisModel, int yeniTipi) async {
    final result = await _networkManager.dioPost<SiparisEditRequestModel>(
      path: ApiUrls.belgeDurumunuDegistir,
      showLoading: true,
      bodyModel: SiparisEditRequestModel(),
      data: EditFaturaModel.fromSiparislerModel(siparisModel..tipi = yeniTipi).toJson(),
    );
    if (result.isSuccess) {
      _dialogManager.showSuccessSnackBar("Başarılı");
      return result.isSuccess;
    } else {
      return false;
    }
  }

  GridItemModel get belgeNoDegistir => GridItemModel.islemler(
        title: "Belge No Değiştir",
        isEnabled: (model as BaseSiparisEditModel).islemBilgileriDegistirebilirMi,
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
                            "BelgeTipi": siparisModel?.getEditTipiEnum?.rawValue,
                            "EIrsaliye": "H",
                            "CariKodu": siparisModel?.cariKodu ?? "",
                          },
                        );
                        if (result.isSuccess) {
                          final List<BaseSiparisEditModel> list = result.dataList;
                          controller.text = list.firstOrNull?.belgeNo ?? "";
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
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withValues(alpha: 0.1))),
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
                            if (result.isSuccess) {
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

  // BuildContext get context => Get.context!;
  GridItemModel get siparisPDFGoruntule => GridItemModel.islemler(
        title: "PDF Görüntüle",
        isEnabled: (model as BaseSiparisEditModel).getEditTipiEnum?.yazdirilsinMi,
        iconData: Icons.picture_as_pdf_outlined,
        onTap: () async {
          final BaseSiparisEditModel? siparisModel = model as BaseSiparisEditModel?;
          final List<NetFectDizaynList> dizaynList =
              (_paramModel.netFectDizaynList?.filteredDizaynList(siparisModel?.getEditTipiEnum) ?? []).where((element) => element.ozelKod == siparisModel?.getEditTipiEnum?.getPrintValue).toList();
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
                  dicParams: DicParams(belgeNo: siparisModel?.belgeNo ?? "", cariKodu: siparisModel?.cariKodu, belgeTipi: siparisModel?.getEditTipiEnum?.rawValue),
                ),
              ),
            );
          }
        },
      );
  GridItemModel get belgeyiKopyala => GridItemModel.islemler(title: "Belgeyi Kopyala", iconData: Icons.copy_outlined);
  //* Stok
  GridItemModel get stokKarti => GridItemModel.islemler(
        title: "Stok Kartı",
        isEnabled: _yetkiController.stokKarti,
        iconData: Icons.info_outline,
        onTap: () async => Get.toNamed(
          "/mainPage/stokEdit",
          arguments: BaseEditModel(model: model as StokListesiModel, baseEditEnum: _yetkiController.stokKartiDuzenleme ? BaseEditEnum.duzenle : BaseEditEnum.goruntule),
        ),
      );
  GridItemModel get stokYazdir => GridItemModel.islemler(
        title: "Yazdır",
        isEnabled: _yetkiController.yazdirmaStokEtiketi,
        iconData: Icons.print_outlined,
        onTap: () async => Get.toNamed("/mainPage/stokYazdir", arguments: model),
      );
  GridItemModel get depoBakiyeDurumu => GridItemModel.islemler(
        title: "Depo Bakiye Durumu",
        isEnabled: _yetkiController.stokDepoBakiyeDurumu,
        iconData: Icons.warehouse_outlined,
        onTap: () async => Get.toNamed("/mainPage/depoBakiyeDurumu", arguments: model),
      );
  GridItemModel get hucreHareketleri => GridItemModel.islemler(
        title: "Hücre Hareketleri",
        isEnabled: _yetkiController.hucreHareketleri,
        iconData: Icons.shelves,
        onTap: () async => Get.toNamed("/mainPage/hucreHareketleri", arguments: model),
      );
  GridItemModel get seriHareketleri => GridItemModel.islemler(
        title: "Seri Hareketleri",
        isEnabled:
            (_userModel?.stokSeriHar == true && ((model as StokListesiModel).seriCikislardaAcik == true || (model as StokListesiModel).seriGirislerdeAcik == true)) || AccountModel.instance.adminMi,
        iconData: Icons.dynamic_form_outlined,
        onTap: () async => Get.toNamed("/seriHareketleri", arguments: model),
      );
  GridItemModel get seriBakiyeleri => GridItemModel.islemler(
        title: "Seri Bakiye Durumu",
        isEnabled:
            (_userModel?.stokSeriHar == true && ((model as StokListesiModel).seriCikislardaAcik == true || (model as StokListesiModel).seriGirislerdeAcik == true)) || AccountModel.instance.adminMi,
        iconData: Icons.dynamic_form_outlined,
        onTap: () async => Get.toNamed("/seriBakiyeleri", arguments: model),
      );
  GridItemModel get fiyatGor => GridItemModel.islemler(
        title: "Fiyat Gör",
        isEnabled: _yetkiController.stokFiyatGorEkrani,
        iconData: Icons.monetization_on_outlined,
        onTap: () async => Get.toNamed("/mainPage/stokFiyatGor", arguments: model),
      );

  GridItemModel get stokResimleri => GridItemModel.islemler(
        title: "Stok Resimleri",
        isEnabled: _yetkiController.stokResimGoster,
        iconData: Icons.photo_album_outlined,
        onTap: () async => await Get.toNamed("/evraklar", arguments: EvraklarRequestModel.fromStokModel(model as StokListesiModel)),
      );

  GridItemModel get stokFiyatOzeti => GridItemModel.islemler(
        title: "Fiyat Özeti",
        isEnabled: _yetkiController.stokFiyatOzeti,
        iconData: Icons.monetization_on_outlined,
        onTap: () async => Get.toNamed("mainPage/fiyatOzeti", arguments: model),
      );

  //* Cari
  GridItemModel get paylas => GridItemModel.islemler(
        title: "Paylaş",
        iconData: Icons.share_outlined,
        onTap: () async {
          final CariListesiModel newModel = model as CariListesiModel;
          final result = await _bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
            context,
            title: "Paylaş",
            groupValues: List.generate(7, (index) => true),
            children: [
              if (newModel.cariAdi != null) BottomSheetModel(title: "Ünvan", value: newModel.cariAdi, groupValue: true),
              if (newModel.cariAdres != null) BottomSheetModel(title: "Adres", value: newModel.cariAdres, groupValue: true),
              if (newModel.cariIl != null || newModel.cariIlce != null) BottomSheetModel(title: "İl/ İlçe", value: "${newModel.cariIl ?? ""} / ${newModel.cariIlce ?? ""}", groupValue: true),
              if (newModel.vergiDairesi != null || newModel.vergiNumarasi != null)
                BottomSheetModel(title: "Vergi Bilgileri", value: "${newModel.vergiDairesi ?? ""} ${newModel.vergiNumarasi ?? ""}", groupValue: true),
              if (newModel.cariTel != null) BottomSheetModel(title: "Telefon", value: newModel.cariTel, groupValue: true),
              if (newModel.web != null) BottomSheetModel(title: "Web Sitesi", value: newModel.web, groupValue: true),
              if (newModel.email != null) BottomSheetModel(title: "Mail", value: newModel.email, groupValue: true),
            ],
          );
          if (result.ext.isNotNullOrEmpty) {
            Clipboard.setData(ClipboardData(text: result!.join("\n")));
            Share.share(result.join("\n"));
          }
        },
      );

  GridItemModel cariKoduDegistir(String? cariKodu) => GridItemModel.islemler(
        title: "Cari Kodu Değiştir",
        isEnabled: _yetkiController.cariKartiDuzenleme,
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
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withValues(alpha: 0.1))),
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
                              if (result.isSuccess) {
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

  GridItemModel get siparisCariKoduDegistir {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Cari Kodu Değiştir",
      isEnabled: siparisModel.islemBilgileriDegistirebilirMi && (siparisTipi?.cariKoduDegisirMi ?? true) && !siparisModel.eBelgeMi,
      iconData: Icons.people_alt_outlined,
      onTap: () async {
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
                    if (result.isSuccess) {
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
  }

  GridItemModel get borcCeki => GridItemModel.islemler(
        title: "Borç Çeki",
        isEnabled: _userModel?.finansCekBorc,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/cekBorcTahsilat", arguments: model),
      );
  GridItemModel get borcSenedi => GridItemModel.islemler(
        title: "Borç Senedi",
        isEnabled: _userModel?.finansCekBorc,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/senetBorcTahsilat", arguments: model),
      );
  GridItemModel get cekTahsilati => GridItemModel.islemler(
        title: "Senet tahsilatı",
        isEnabled: _userModel?.tahsilatSenetTahsilat,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/senetMusteriTahsilat", arguments: model),
      );
  GridItemModel get tahsilatSenedi => GridItemModel.islemler(
        title: "Çek Tahsilatı",
        isEnabled: _userModel?.tahsilatCekTahsilat,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/cekMusteriTahsilat", arguments: model),
      );

  //* Banka
  GridItemModel bankaCariEFTHavale({CariListesiModel? model}) => GridItemModel.islemler(
        title: "Cari EFT/Havale",
        isEnabled: _yetkiController.bankaCariEftHavale,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/cariEFTHavale", arguments: model),
      );
  GridItemModel get bankaHareketleri =>
      GridItemModel.islemler(title: "Banka Hareketleri", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaHareketleri", arguments: model));

  GridItemModel get bankaKasaTransferi =>
      GridItemModel.islemler(title: "Banka Kasa Transferi", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaKasaTransferi", arguments: model));
  GridItemModel get hesaplarArasiVirman =>
      GridItemModel.islemler(title: "Hesaplar Arası Virman", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/hesaplarArasiVirman"));
  GridItemModel get cariVirman => GridItemModel.islemler(
        title: "Cari Virman",
        isEnabled: _userModel?.cariVirman,
        iconData: Icons.sync_alt_outlined,
        onTap: () async => await Get.toNamed("/mainPage/cariVirman", arguments: model),
      );
  GridItemModel get hesaplarArasiEftHavale =>
      GridItemModel.islemler(title: "Hesaplar Arası EFT/Havale", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/hesaplarArasiEftHavale"));
  GridItemModel get bankaMuhtelifTahsilat =>
      GridItemModel.islemler(title: "Muhtelif Tahsilat", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaMuhtelifTahsilat"));
  GridItemModel get bnkaMuhtelifOdeme => GridItemModel.islemler(title: "Muhtelif Ödeme", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/bankaMuhtelifOdeme"));

  //* Kasa
  GridItemModel get kasaTransferi => GridItemModel.islemler(title: "Kasalar Arası Transferi", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/kasaTransferi"));
  GridItemModel krediKartiTahsilati(dynamic value) => GridItemModel.islemler(
        title: "Kredi Kartı Tahsilatı",
        isEnabled: _userModel?.tahsilatKKartiTahsilat,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/krediKartiTahsilati", arguments: value),
      );
  GridItemModel nakitTahsilat(dynamic value) => GridItemModel.islemler(
        title: "Nakit Tahsilat",
        isEnabled: _userModel?.tahsilatNakitTahsilat,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/nakitTahsilat", arguments: value),
      );
  GridItemModel nakitOdeme(dynamic value) => GridItemModel.islemler(
        title: "Nakit Ödeme",
        isEnabled: _userModel?.tahsilatNakitOdeme,
        iconData: Icons.local_atm_outlined,
        onTap: () async => await Get.toNamed("/mainPage/nakitOdeme", arguments: value),
      );
  GridItemModel get muhtelifTahsilat => GridItemModel.islemler(title: "Muhtelif\nTahsilat", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/muhtelifTahsilat"));
  GridItemModel get muhtelifOdeme => GridItemModel.islemler(title: "Muhtelif\nÖdeme", iconData: Icons.list_alt_rounded, onTap: () async => await Get.toNamed("/mainPage/muhtelifOdeme"));
  GridItemModel get kasaHareketleri =>
      GridItemModel.islemler(title: "Kasa Hareketleri", iconData: Icons.sync_alt_outlined, onTap: () async => await Get.toNamed("/mainPage/kasaHareketleri", arguments: model));

  //* Çek Senet
  GridItemModel get odemeDekontOlustur =>
      GridItemModel.islemler(title: "Ödeme Dekont Oluştur", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/odemeDekontOlustur", arguments: model));
  GridItemModel get tahsilatDekontOlustur =>
      GridItemModel.islemler(title: "Tahsil Dekontu Oluştur", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/odemeDekontOlustur", arguments: model));
  GridItemModel get cariHesabaCirola =>
      GridItemModel.islemler(title: "Cari Hesaba Cirola", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/cariHesabaCirola", arguments: model));
  GridItemModel get tahsilHesabaCirola =>
      GridItemModel.islemler(title: "Tahsil Hesaba Cirola", iconData: Icons.add_outlined, onTap: () async => await Get.toNamed("/mainPage/tahsilHesabaCirola", arguments: model));
  GridItemModel get kasaTahsilEt => GridItemModel.islemler(
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
              Get.toNamed(
                "mainPage/cariEdit",
                arguments: BaseEditModel(
                  model: cariModel,
                  editTipiEnum: EditTipiEnum.cari,
                  baseEditEnum: BaseEditEnum.goruntule,
                ),
              );
            }
          }
        },
      );

  GridItemModel get cariSatisTeklifi => GridItemModel.islemler(
        title: "Satış Teklifi",
        icon: "offer",
        isEnabled: _yetkiController.satisTeklifiEkle,
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;

            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/talTekEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.satisTeklifi));
          }
        },
      );

  GridItemModel get konumGoster => GridItemModel.islemler(
        title: "Konum Göster",
        iconData: Icons.location_on_outlined,
        isEnabled: _userModel?.cariHarita == true || AccountModel.instance.adminMi,
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;
            await Get.toNamed("/mainPage/cariHaritasiGoruntule", arguments: cariModel);
            // if (result is LatLng) {
            //   final saveCari = await _networkManager.dioPost(
            //     path: ApiUrls.saveCari,
            //     bodyModel: CariListesiModel(),
            //     showError: true,
            //     showLoading: true,
            //     data: CariSaveRequestModel(requestVersion: 6, islemKodu: 3, kodu: cariModel.cariKodu, enlem: result.latitude, boylam: result.longitude).toJson(),
            //   );
            //   return saveCari.success;
            // }
          }
        },
      );
  GridItemModel get konumaGit => GridItemModel.islemler(
        title: "Konuma Git",
        iconData: Icons.location_on_outlined,
        isEnabled: _userModel?.cariHarita == true || AccountModel.instance.adminMi,
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;
            try {
              await MapUtils.openMap(cariModel.enlem ?? 0, cariModel.boylam ?? 0);
            } on Exception catch (e) {
              _dialogManager.showAlertDialog(e.toString());
            }
            // if (result is LatLng) {
            //   final saveCari = await _networkManager.dioPost(
            //     path: ApiUrls.saveCari,
            //     bodyModel: CariListesiModel(),
            //     showError: true,
            //     showLoading: true,
            //     data: CariSaveRequestModel(requestVersion: 6, islemKodu: 3, kodu: cariModel.cariKodu, enlem: result.latitude, boylam: result.longitude).toJson(),
            //   );
            //   return saveCari.success;
            // }
          }
        },
      );

  GridItemModel get konumAta => GridItemModel.islemler(
        title: "Konum Ata",
        iconData: Icons.location_on_outlined,
        isEnabled: (_userModel?.cariHarita == true || AccountModel.instance.adminMi) && _yetkiController.cariKartiDuzenleme,
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;
            final result = await Get.toNamed("/mainPage/cariHaritasiOzel", arguments: (enlem: cariModel.enlem, boylam: cariModel.boylam));
            if (result is LatLng) {
              final saveCari = await _networkManager.dioPost(
                path: ApiUrls.saveCari,
                bodyModel: CariListesiModel(),
                showLoading: true,
                data: CariSaveRequestModel(requestVersion: 6, islemKodu: 3, kodu: cariModel.cariKodu, enlem: result.latitude, boylam: result.longitude).toJson(),
              );
              return saveCari.isSuccess;
            }
          }
        },
      );
  GridItemModel get cariSatisTalebi => GridItemModel.islemler(
        title: "Satış Talebi",
        icon: "offer",
        isEnabled: _yetkiController.satisTalebiEkle,
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;

            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/talTekEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.satisTalebi));
          }
        },
      );
  GridItemModel get cariMusteriSiparisi => GridItemModel.islemler(
        title: "Müşteri Siparişi",
        isEnabled: _yetkiController.siparisMSKaydet,
        icon: "order",
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;

            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.musteri));
          }
        },
      );

  GridItemModel get cariSaticiSiparisi => GridItemModel.islemler(
        title: "Satıcı Siparişi",
        isEnabled: _yetkiController.siparisSSKaydet,
        icon: "order",
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;

            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.satici));
          }
        },
      );

  GridItemModel get cariAlisIrsaliyesi => GridItemModel.islemler(
        title: "Alış İrsaliyesi",
        isEnabled: _yetkiController.alisIrsEkle,
        icon: "pallet",
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;

            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.alisIrsaliye));
          }
        },
      );

  GridItemModel get cariSatisIrsaliyesi => GridItemModel.islemler(
        title: "Satış İrsaliyesi",
        isEnabled: _yetkiController.satisIrsEkle,
        icon: "forklift",
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;

            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.satisIrsaliye));
          }
        },
      );

  GridItemModel get cariAlisFaturasi => GridItemModel.islemler(
        title: "Alış Faturası",
        isEnabled: _yetkiController.alisFatEkle,
        icon: "pallet",
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;
            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.alisFatura));
          }
        },
      );

  GridItemModel get cariSatisFaturasi => GridItemModel.islemler(
        title: "Satış Faturası",
        isEnabled: _yetkiController.satisFatEkle,
        icon: "forklift",
        onTap: () async {
          if (model is CariListesiModel) {
            final CariListesiModel cariModel = model as CariListesiModel;
            final BaseSiparisEditModel siparisModel = BaseSiparisEditModel.fromCariListesiModel(cariModel);
            return await Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.ekle, editTipiEnum: EditTipiEnum.satisFatura));
          }
        },
      );

  GridItemModel cariIslemleri(String? cariNo) => GridItemModel.islemler(
        title: "İşlemler",
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          final result = await _networkManager.getCariModel(CariRequestModel(kod: [cariNo ?? ""]));
          _dialogManager.showCariGridViewDialog(result);
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
            final kalemler = await Get.toNamed("mainPage/kalemRehberi", arguments: SiparislerRequestModel.fromBaseSiparisEditModel(siparisModel));
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
                        if (result.isSuccess) {
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
    if (result.isSuccess) {
      final List<BaseSiparisEditModel> list = result.dataList;
      controller.text = list.firstOrNull?.belgeNo ?? "";
    }
  }

  GridItemModel get talTekRevizeEt => GridItemModel.islemler(
        title: "Revize Et",
        iconData: Icons.app_registration_outlined,
        isEnabled: siparisTipi?.eklensinMi,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            return await Get.toNamed("mainPage/talTekEdit", arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.revize, editTipiEnum: siparisTipi));
          }
        },
      );
  GridItemModel get alistanSatisFaturasiOlustur => GridItemModel.islemler(
        title: "Satış Faturası Oluştur",
        isEnabled: EditTipiEnum.satisFatura.eklensinMi,
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            final detayModel = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(siparisModel));
            return await Get.toNamed(
              "mainPage/faturaEdit",
              arguments: BaseEditModel(
                model: siparisModel.copyWith(
                  kalemList: detayModel?.kalemList,
                  tarih: DateTime.now().dateTimeWithoutTime,
                ),
                baseEditEnum: BaseEditEnum.kopyala,
                editTipiEnum: EditTipiEnum.satisFatura,
              ),
            );
          }
        },
      );
  GridItemModel get irsaliyeFaturalastir {
    final siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Fatura Oluştur",
      isEnabled: siparisModel.getEditTipiEnum?.satisMi == true ? EditTipiEnum.satisFatura.eklensinMi : EditTipiEnum.alisFatura.eklensinMi,
      iconData: Icons.list_alt_outlined,
      onTap: () async {
        if (model is BaseSiparisEditModel) {
          return await Get.toNamed(
            "mainPage/irsaliyeFaturalastir",
            arguments: BaseEditModel(
              model: siparisModel,
              baseEditEnum: BaseEditEnum.kopyala,
              editTipiEnum: siparisModel.getEditTipiEnum?.satisMi == true ? EditTipiEnum.satisFatura : EditTipiEnum.alisFatura,
            ),
          );
        }
      },
    );
  }

  GridItemModel get satisIrsaliyeOlustur => GridItemModel.islemler(
        title: "Satış İrsaliyesi Oluştur",
        isEnabled: EditTipiEnum.satisIrsaliye.eklensinMi,
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            if (siparisModel.getEditTipiEnum.talepTeklifMi) {
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
            } else if (siparisModel.getEditTipiEnum.siparisMi) {
              final result = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(siparisModel));
              if (result == null) {
                return;
              } else {
                final kalemList = await getKalemRehberi(result);
                if (kalemList == null) {
                  return;
                }
                return await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(model: result.copyWith(kalemList: kalemList), baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisIrsaliye, belgeNo: result.belgeNo),
                );
              }
            } else {
              siparisModel
                ..teslimCari = null
                ..teslimCariAdi = null
                ..teslimTarihi = null
                ..istenilenTeslimTarihi = null;
              return await Get.toNamed(
                "mainPage/faturaEdit",
                arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.satisIrsaliye, belgeNo: siparisModel.belgeNo),
              );
            }
          }
        },
      );
  GridItemModel get alisIrsaliyeOlustur => GridItemModel.islemler(
        title: "Alış İrsaliyesi Oluştur",
        isEnabled: EditTipiEnum.alisIrsaliye.eklensinMi,
        iconData: Icons.list_alt_outlined,
        onTap: () async {
          if (model is BaseSiparisEditModel) {
            final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
            siparisModel.resmiBelgeNo = siparisModel.belgeNo;
            if (siparisModel.getEditTipiEnum.talepTeklifMi) {
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
                  arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.alisIrsaliye, belgeNo: result.belgeNo),
                );
              } else {
                return;
              }
            } else if (siparisModel.getEditTipiEnum.siparisMi) {
              final result = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(siparisModel));
              if (result == null) {
                return;
              } else {
                final kalemList = await getKalemRehberi(result);
                if (kalemList == null) {
                  return;
                }
                return await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(model: result.copyWith(kalemList: kalemList), baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.alisIrsaliye, belgeNo: result.belgeNo),
                );
              }
            } else {
              siparisModel
                ..teslimCari = null
                ..teslimCariAdi = null
                ..teslimTarihi = null
                ..istenilenTeslimTarihi = null;
              return await Get.toNamed(
                "mainPage/faturaEdit",
                arguments: BaseEditModel(model: siparisModel, baseEditEnum: BaseEditEnum.kopyala, editTipiEnum: EditTipiEnum.alisIrsaliye, belgeNo: siparisModel.belgeNo),
              );
            }
          }
        },
      );
  GridItemModel get siparistenFaturaOlustur => GridItemModel.islemler(
        title: "Fatura Oluştur (Siparişten)",
        iconData: Icons.list_alt_outlined,
        isEnabled: siparisTipi?.satisMi == true ? EditTipiEnum.satisFatura.eklensinMi : EditTipiEnum.alisFatura.eklensinMi,
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
                if (kalemList == null) return;
                return await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(
                    model: siparisModel
                      ..kalemList = kalemList
                          .map(
                            (e) => e..miktar = e.kalan,
                          )
                          .toList(),
                    baseEditEnum: BaseEditEnum.siparistenKopyala,
                    editTipiEnum: EditTipiEnum.satisFatura,
                    belgeNo: result.belgeNo,
                  ),
                );
              } else {
                return;
              }
            } else {
              final BaseSiparisEditModel? result = await _networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(siparisModel));
              if (result == null) {
                return;
              } else {
                final List<KalemModel>? kalemList = await getKalemRehberi(result);
                if (kalemList == null) {
                  return;
                }
                result.depoTanimi ??= siparisModel.depoTanimi;
                BaseSiparisEditModel.resetInstance();
                final boolean = await Get.toNamed(
                  "mainPage/faturaEdit",
                  arguments: BaseEditModel(
                    model: result..kalemList = kalemList.map((e) => e..miktar = e.kalan).toList(),
                    baseEditEnum: BaseEditEnum.siparistenKopyala,
                    editTipiEnum: siparisTipi?.saticiMi == true ? EditTipiEnum.alisFatura : EditTipiEnum.satisFatura,
                  ),
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
        if (result.isSuccess) {
          _dialogManager.showSuccessSnackBar("Kayıt Başarılı");
          return true;
        } else {
          return false;
        }
      },
    );
  }

  GridItemModel get transferOnayla {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Onayla",
      iconData: Icons.check_circle_outline,
      onTap: () async {
        final BaseSiparisEditModel newSiparisModel = BaseSiparisEditModel()
          ..belgeNo = siparisModel.belgeNo
          ..belgeTuru = siparisModel.belgeTuru
          ..pickerBelgeTuru = siparisModel.belgeTuru
          ..cariKodu = siparisModel.cariKodu
          ..islemKodu = 1
          ..lokalDat = siparisModel.lokalDat ?? "H"
          ..tag = "FaturaModel";
        final result = await _networkManager.dioPost<BaseSiparisEditModel>(
          path: ApiUrls.saveFatura,
          bodyModel: BaseSiparisEditModel(),
          data: newSiparisModel.toJson(),
          showLoading: true,
        );
        if (result.isSuccess) {
          _dialogManager.showSuccessSnackBar("Kayıt Başarılı");
          return true;
        } else {
          return false;
        }
      },
    );
  }

  Future<List<KalemModel>?> getKalemRehberi(BaseSiparisEditModel model) async {
    final result = await Get.toNamed("/mainPage/kalemRehberi", arguments: SiparislerRequestModel.fromBaseSiparisEditModel(model));
    if (result is List) {
      final List<KalemModel> list = result.map((e) => e as KalemModel).toList().cast<KalemModel>();
      return list;
    }
    return null;
  }

  //* E-Fatura

  GridItemModel get eFaturaGonder {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    final bool yetki = () {
      if (siparisModel.eArsivSerisindenMi) return _yetkiController.ebelgeEArsivGonder;
      if (siparisModel.eFaturaSerisindenMi) return _yetkiController.ebelgeEFaturaGonder;
      if (siparisModel.eIrsaliyeSerisindenMi) return _yetkiController.ebelgeEIrsaliyeGonder;
      return false;
    }.call();
    return GridItemModel.islemler(
      title: "${siparisModel.getTitle(siparisModel.belgeNo)} Gönder",
      isEnabled: yetki,
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
      isEnabled: () {
        if (!siparisModel.eBelgeMi) return false;
        if (siparisModel.eArsivMi) return _yetkiController.ebelgeEArsivGoruntule;
        if (siparisModel.eFaturaMi || _yetkiController.ebelgeEFaturaGelenKutusu) return _yetkiController.ebelgeEFaturaGoruntule;
        if (siparisModel.eIrsaliyeMi || _yetkiController.ebelgeEIrsaliyeGelenKutusu) return _yetkiController.ebelgeEIrsaliyeGoruntule;
        return false;
      }.call(),
      iconData: Icons.picture_as_pdf_outlined,
      onTap: () async => await Get.toNamed("/mainPage/eBelgePdf", arguments: EBelgeListesiModel.fromBaseSiparisEditModel(siparisModel)),
    );
  }

  GridItemModel get durumSorgula {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Durum Sorgula",
      isEnabled: () {
        if (!siparisModel.eBelgeMi) return false;
        if (siparisModel.eArsivMi || _yetkiController.ebelgeEArsivGidenKutusu) return _yetkiController.ebelgeEArsivSorgula;
        if (siparisModel.eFaturaMi || _yetkiController.ebelgeEFaturaGidenKutusu) return _yetkiController.ebelgeEFaturaSorgula;
        if (siparisModel.eIrsaliyeMi) return _yetkiController.ebelgeEIrsaliyeGidenKutusu;
        return false;
      }.call(),
      iconData: Icons.refresh_outlined,
      onTap: () async {
        final result = await _networkManager.dioGet<EBelgeListesiModel>(
          path: ApiUrls.getEFaturalar,
          showLoading: true,
          bodyModel: EBelgeListesiModel(),
          queryParameters: {"FilterModel": jsonEncode(EBelgeListesiModel.fromBaseSiparisEditModel(siparisModel).durumSorgula.toJson())},
        );
        if (result.isSuccess) {
          _dialogManager.showInfoSnackBar(result.dataList.first.onayDurumuString);
          return true;
        }
      },
    );
  }

  GridItemModel get eBelgetaslakSil {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    final bool yetki = () {
      if (siparisModel.eBelgeMi) {
        if (siparisModel.eArsivMi) return _yetkiController.ebelgeEArsivTaslakSil;
        if (siparisModel.eFaturaMi) return _yetkiController.ebelgeEFaturaTaslakSil;
        if (siparisModel.eIrsaliyeMi) return _yetkiController.ebelgeEIrsaliyeTaslakSil;
      }
      return false;
    }.call();
    return GridItemModel.islemler(
      title: "Taslağı Sil",
      isEnabled: yetki,
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
          if (result.isSuccess) {
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
      isEnabled: siparisModel.getEditTipiEnum?.yazdirilsinMi,
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
          if (result.isSuccess) {
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
          if (result.isSuccess) {
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

  GridItemModel get faturaBelgeNoDegistir {
    final BaseSiparisEditModel siparisModel = model as BaseSiparisEditModel;
    return GridItemModel.islemler(
      title: "Belge No Değiştir",
      iconData: Icons.edit_outlined,
      isEnabled: siparisModel.islemBilgileriDegistirebilirMi && !siparisModel.eBelgeMi,
      onTap: () async {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController controller = TextEditingController(text: siparisModel.belgeNo);
        final TextEditingController resmiController = TextEditingController(text: siparisModel.resmiBelgeNo);
        return await _bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: "Fatura Belge No Değiştir",
          body: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
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
                  onChanged: (p0) {
                    resmiController.text = belgeNoToResmiBelgeNo(p0, siparisModel.tarih);
                  },
                  suffix: IconButton(
                    onPressed: () async {
                      final result = await _networkManager.dioGet<BaseSiparisEditModel>(
                        path: ApiUrls.getSiradakiBelgeNo,
                        bodyModel: BaseSiparisEditModel(),
                        queryParameters: {
                          "Seri": controller.text,
                          "BelgeTipi": siparisModel.getEditTipiEnum?.rawValue,
                          "EIrsaliye": "H",
                          "CariKodu": siparisModel.cariKodu ?? "",
                        },
                      );
                      if (result.isSuccess) {
                        final List<BaseSiparisEditModel> list = result.dataList;
                        controller.text = list.firstOrNull?.belgeNo ?? "";
                        resmiController.text = belgeNoToResmiBelgeNo(controller.text, siparisModel.tarih);
                      }
                    },
                    icon: const Icon(Icons.format_list_numbered_rtl_outlined),
                  ),
                ),
                CustomTextField(
                  labelText: "Resmi Belge No",
                  controller: resmiController,
                  isMust: true,
                  maxLength: 16,
                  validator: (p0) {
                    if (p0 == null || p0.length != 16) {
                      return "Lütfen 16 haneli bir belge no giriniz.";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() != true) {
                      return;
                    }
                    bool boolean = false;
                    await _dialogManager.showAreYouSureDialog(() async {
                      boolean = true;
                    });
                    if (boolean) {
                      final result = await _networkManager.dioPost<BaseSiparisEditModel>(
                        path: ApiUrls.saveFatura,
                        showLoading: true,
                        bodyModel: BaseSiparisEditModel(),
                        data: BaseSiparisEditModel.belgeNoDegistir(
                          siparisModel
                            ..yeniBelgeNo = controller.text
                            ..resmiBelgeNo = resmiController.text,
                        ).toJson(),
                      );
                      if (result.isSuccess) {
                        _dialogManager.showSuccessSnackBar("Başarılı");
                        boolean = true;
                      } else {
                        boolean = false;
                      }
                    }
                    Get.back(result: boolean);
                  },
                  child: const Text("Kaydet"),
                ).paddingAll(UIHelper.lowSize),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        );
      },
    );
  }

  String belgeNoToResmiBelgeNo(String belgeNo, DateTime? tarih) {
    // belgeNo is like as "EFT000000000012" and resmiBelgeNo should be "EFT2023000000012"
    if (belgeNo.length == 15) {
      return belgeNo.substring(0, 3) + (tarih?.year.toString() ?? "") + belgeNo.substring(6, 15);
    } else {
      return "";
    }
  }
}
