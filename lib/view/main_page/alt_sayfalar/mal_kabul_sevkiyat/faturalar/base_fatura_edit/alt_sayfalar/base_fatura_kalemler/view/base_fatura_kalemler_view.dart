import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/view/add_company/model/account_model.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../../../stok/base_stok_edit/model/save_stok_model.dart";
import "../../../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../view_model/base_fatura_kalemler_view_model.dart";

final class BaseFaturaKalemlerView extends StatefulWidget {
  const BaseFaturaKalemlerView({required this.model, super.key, this.updater});
  final BaseEditModel<SiparisEditRequestModel> model;
  final bool? updater;

  @override
  State<BaseFaturaKalemlerView> createState() => _BaseFaturaKalemlerViewState();
}

//#region Test
final class _BaseFaturaKalemlerViewState extends BaseState<BaseFaturaKalemlerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  BaseFaturaKalemlerViewModel viewModel = BaseFaturaKalemlerViewModel();
  late final TextEditingController _searchTextController;
  @override
  void initState() {
    debugPrint(widget.updater.toString());
    _searchTextController = TextEditingController();
    viewModel.updateKalemList();
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(floatingActionButton: fab(), body: body());

  Visibility fab() => Visibility(
    visible:
        !widget.model.isGoruntule && (BaseSiparisEditModel.instance.getEditTipiEnum?.rehberdenStokSecilsin ?? false),
    child: FloatingActionButton(
      onPressed: () async {
        // bottomSheetDialogManager.showPrintDialog(context, DicParams(belgeNo: model.belgeNo, belgeTipi: model.belgeTipi.toStringIfNotNull, cariKodu: model.cariKodu));
        await Get.toNamed("/mainPage/stokRehberi");
        viewModel.updateKalemList();
      },
      child: const Icon(Icons.add),
    ),
  );

  Padding body() => Padding(
    padding: UIHelper.lowPadding,
    child: Column(
      children: <Widget>[
        if (!widget.model.isGoruntule)
          CustomTextField(
            labelText: "Stok Kodu / Barkod Giriniz",
            readOnly: BaseSiparisEditModel.instance.getEditTipiEnum?.kalemlerKlavyeAcilmasin,
            controller: _searchTextController,
            onSubmitted: (p0) async {
              if (p0.ext.isNotNullOrNoEmpty) {
                await Get.toNamed("/mainPage/stokRehberi", arguments: p0);
                viewModel.updateKalemList();
              }
            },
            suffix: IconButton(onPressed: getBarkodStok, icon: const Icon(Icons.qr_code_scanner)),
          ).paddingOnly(top: UIHelper.lowSize),
        Expanded(
          child: Observer(
            builder:
                (_) =>
                    viewModel.kalemList.ext.isNullOrEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.manage_search_outlined, size: 50, color: theme.colorScheme.primary),
                              const Text("Kalem bulunamadı.\nLütfen Kalem Ekleyin.", textAlign: TextAlign.center),
                            ],
                          ),
                        )
                        : Observer(
                          builder:
                              (_) => ReorderableListView.builder(
                                onReorder: (oldIndex, newIndex) {
                                  if (oldIndex == newIndex) return;
                                  if (newIndex > oldIndex) {
                                    newIndex -= 1;
                                  }
                                  final item = viewModel.kalemList?[oldIndex];
                                  if (item != null) {
                                    final List<KalemModel>? kalemList = BaseSiparisEditModel.instance.kalemList;
                                    kalemList?.removeAt(oldIndex);
                                    kalemList?.insert(newIndex, item);
                                    BaseSiparisEditModel.instance.kalemList = kalemList;
                                    viewModel.updateKalemList();
                                  }
                                },
                                primary: true,
                                itemCount: viewModel.kalemList?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final kalemModel = viewModel.kalemList![index];
                                  return Card(
                                    key: Key((kalemModel.sira ?? index).toString()),
                                    child: Column(
                                      children: <Widget>[
                                        kalemListTile(context, index, kalemModel),
                                        ...List.generate(kalemModel.kalemList?.length ?? 0, (index2) {
                                          final KalemModel? model = kalemModel.kalemList?[index2];
                                          return Column(
                                            children: <Widget>[
                                              const Divider(),
                                              hucreListTile(model, kalemModel).paddingOnly(left: UIHelper.highSize),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  );
                                },
                              ),
                        ),
          ),
        ),
      ],
    ),
  );

  ListTile kalemListTile(BuildContext context, int index, KalemModel kalemModel) => ListTile(
    onTap: () async => await listTileBottomSheet(context, index, model: kalemModel),
    contentPadding: UIHelper.lowPadding.copyWith(left: UIHelper.highSize, bottom: UIHelper.lowSize),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: Text(kalemModel.kalemAdi ?? kalemModel.stokAdi ?? kalemModel.stokKodu ?? "", softWrap: true)),
        const Icon(Icons.more_vert_outlined),
      ],
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (kalemModel.dovizliMi) const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli),
        if (kalemModel.paketMi == "K")
          const ColorfulBadge(label: Text("Karma Koli"), badgeColorEnum: BadgeColorEnum.karmaKoli),
        Text(
          kalemModel.stokKodu ?? "",
          style: TextStyle(
            color:
                widget.model.baseEditEnum.taslakMi
                    ? kalemModel.kalemEBelgedenMi
                        ? UIHelper.primaryColor
                        : ColorPalette.mantis
                    : null,
          ),
        ),
        if (kalemModel.depoKodu != null && kalemModel.depoTanimi != null)
          Text("${kalemModel.depoKodu ?? ""} - ${kalemModel.depoTanimi ?? ""}"),
        if (kalemModel.faturaKalemAciklama != "")
          Text(kalemModel.faturaKalemAciklama, style: const TextStyle(color: UIHelper.primaryColor)),
        if (kalemModel.barkodList != null)
          Text(
            "Barkod Sayısı: ${kalemModel.barkodList?.length ?? 0}",
            style: const TextStyle(color: UIHelper.primaryColor),
          ),
        LayoutBuilder(
          builder:
              (context, constrains) => Wrap(
                children:
                    <Widget>[
                      if (!(kalemModel.miktar == null || kalemModel.miktar == 0.0))
                        Text(
                          "Miktar: ${kalemModel.miktar.toIntIfDouble ?? ""} ${kalemModel.olcuBirimAdi ?? ""}  ${kalemModel.olcuBirimCarpani != null ? "(${kalemModel.gercekMiktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${kalemModel.stokOlcuBirimi})" : ""}",
                        ),
                      if (kalemModel.miktar2 != null)
                        Text("Miktar2: ${kalemModel.miktar2.toIntIfDouble ?? ""} ${kalemModel.olcuBirimAdi ?? ""}"),
                      if (kalemModel.kdvOrani != null) Text("KDV: %${kalemModel.kdvOrani.toIntIfDouble ?? ""}"),
                      if (kalemModel.malFazlasiMiktar != null)
                        Text(
                          "Mal Fazlası Miktar: ${kalemModel.malFazlasiMiktar.toIntIfDouble ?? ""} ${kalemModel.olcuBirimAdi ?? ""}",
                        ),
                      if (kalemModel.kdvOrani != null)
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Satış İskontosu: ${kalemModel.iskontoTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ",
                              ),
                              TextSpan(
                                text: kalemModel.iskontoDetayi,
                                style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      if (model.getEditTipiEnum?.fiyatGor == true)
                        Text.rich(
                          TextSpan(
                            children: [
                              if (kalemModel.brutFiyat != null) ...[
                                TextSpan(
                                  text:
                                      "Fiyat: ${kalemModel.brutFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                                ),
                                if (kalemModel.dovizliMi)
                                  TextSpan(
                                    text:
                                        "\n(${kalemModel.dovizliFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency})",
                                  ),
                              ],
                            ],
                          ),
                        ),
                      if (model.getEditTipiEnum?.fiyatGor == true && kalemModel.dovizKuru != null)
                        Text(
                          "Kur: ${kalemModel.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency}",
                        ),
                      if (yetkiController.satirdaVade(model.getEditTipiEnum!))
                        Text("Vade Tarihi: ${kalemModel.vadeTarihi?.toDateString ?? ""}"),
                      if (model.getEditTipiEnum?.fiyatGor == true && kalemModel.otvTutar != null)
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "ÖTV Tutarı: ${kalemModel.otvTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              ),
                              if (kalemModel.dovizliMi)
                                TextSpan(
                                  text:
                                      "\n(${kalemModel.dovizliOTVTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency})",
                                ),
                            ],
                          ),
                        ),
                      if (model.getEditTipiEnum?.fiyatGor == true && kalemModel.brutFiyat != null)
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Tutar: ${kalemModel.getBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                              ),
                              if (kalemModel.dovizliMi)
                                TextSpan(
                                  text:
                                      "\n(${kalemModel.dovizliBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency})",
                                ),
                            ],
                          ),
                        ),
                      if (kalemModel.projeKodu != null && yetkiController.projeUygulamasiAcikMi)
                        Text("Proje: ${kalemModel.projeKodu}"),
                      if (kalemModel.teslimTarihi != null)
                        Text("Teslim Tarihi: ${kalemModel.teslimTarihi.toDateStringIfNull ?? ""}"),
                    ].map((e) => e is! SizedBox ? SizedBox(width: constrains.maxWidth / 2, child: e) : null).toList().nullCheckWithGeneric,
              ),
        ),
      ],
    ),
  );

  ListTile hucreListTile(KalemModel? kalemList, KalemModel? superKalemList) => ListTile(
    contentPadding: UIHelper.lowPadding,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            "${kalemList?.stokKodu ?? ""} - ${kalemList?.stokAdi ?? ""}",
            softWrap: true,
          ).paddingOnly(bottom: UIHelper.lowSize),
        ),
        IconButton(
          onPressed: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: "Hücre İşlemleri",
              children: <BottomSheetModel>[
                if (AccountModel.instance.isDebug)
                  BottomSheetModel(title: "Stok Etiketi Yazdır", iconWidget: Icons.print_outlined),
                BottomSheetModel(
                  title: "Stok İşlemleri",
                  iconWidget: Icons.list_alt_outlined,
                  onTap: () {
                    Get.back();
                    dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = kalemList?.stokKodu ?? "");
                  },
                ),
              ],
            );
          },
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ],
    ),
    subtitle: Wrap(
      children:
          <Text>[
            Text("Miktar: ${(kalemList?.getSelectedMiktar.toIntIfDouble ?? 0).toIntIfDouble.toStringIfNotNull ?? ""}"),
            if (model.getEditTipiEnum?.fiyatGor == true)
              Text(
                "Fiyat: ${(kalemList?.koliBilesenFiyatorandan == "E" ? superKalemList?.koliBilesenOrandan(kalemList?.koliBilesenOrani ?? 0) : kalemList?.brutFiyat).toIntIfDouble.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
              ),
            // Text("KDV %: ${(kalemList?.kdvOrani).toIntIfDouble ?? ""}"),
            Text(
              "KDV %: ${((model.getEditTipiEnum?.satisMi == true ? kalemList?.stokSatisKdv : kalemList?.stokAlisKdv) ?? kalemList?.kdvOrani).toIntIfDouble ?? ""}",
            ),

            if (model.getEditTipiEnum?.fiyatGor == true)
              Text(
                "Tutar: ${(((kalemList?.koliBilesenFiyatorandan == "E" ? superKalemList?.koliBilesenOrandan(kalemList?.koliBilesenOrani ?? 0) : kalemList?.brutFiyat) ?? 0) * (kalemList?.koliBilesenMiktari ?? 0)).toIntIfDouble.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
              ),
          ].map((e) => SizedBox(width: width * 0.4, child: e)).toList(),
    ),
    // title: Text("${stokList?.stokKodu ?? ""}-${stokList?.stokAdi ?? ""}"),
    // subtitle: Text("${viewModel.kalemList?[index].kalemList?[index].miktar ?? ""} ${viewModel.kalemList?[index].kalemList?[index].olcuBirimAdi ?? ""}"),
    // trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
  );

  Future<void> listTileBottomSheet(BuildContext context, int index, {required KalemModel model}) async {
    final kalemList2 = viewModel.kalemList?[index];
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: kalemList2?.kalemAdi ?? kalemList2?.stokAdi ?? "",
      children: [
        if ((BaseSiparisEditModel.instance.getEditTipiEnum?.kalemDuzeltilsin ?? false) && !widget.model.isGoruntule)
          BottomSheetModel(
            title: loc.generalStrings.edit,
            iconWidget: Icons.edit_outlined,
            onTap: () async {
              Get.back();
              final result = await Get.toNamed("/kalemEkle", arguments: viewModel.kalemList?[index]);
              if (result is KalemModel) {
                BaseSiparisEditModel.instance.kalemList?[index] = result;
              }
              viewModel.updateKalemList();
            },
          ),
        if (!widget.model.isGoruntule)
          BottomSheetModel(
            title: loc.generalStrings.delete,
            iconWidget: Icons.delete_outline_outlined,
            onTap: () {
              Get.back();
              return dialogManager.showAreYouSureDialog(() {
                viewModel.removeAtKalemList(index);
              });
            },
          ),
        if (widget.model.baseEditEnum == BaseEditEnum.taslak && (model.kalemEBelgedenMi))
          BottomSheetModel(
            title: "Stok Oluştur",
            iconWidget: Icons.add_outlined,
            onTap: () async {
              Get.back();
              final result = await Get.toNamed(
                "/mainPage/stokEdit",
                arguments: BaseEditModel<StokListesiModel>(
                  model: StokListesiModel.fromKalemModel(model.copyWith.stokKodu(null)),
                  baseEditEnum: BaseEditEnum.ekle,
                ),
              );
              if (result is SaveStokModel) {
                BaseSiparisEditModel.instance.kalemList?[index] = viewModel.kalemList![index].copyWith(
                  stokAdi: result.adi,
                  stokKodu: result.kodu,
                  kdvOrani:
                      BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi == true
                          ? result.satisKdvOrani
                          : result.alisKdvOrani,
                  seriCikislardaAcik: result.seriCikistaAktif,
                  seriGirislerdeAcik: result.seriGiristeAktif,
                  seriMiktarKadarSor: result.seriMiktarKadar,
                  //TODO efatura_stok değişmiyor
                );
                viewModel.updateKalemList();
              }
            },
          ),
        if (widget.model.baseEditEnum == BaseEditEnum.taslak)
          BottomSheetModel(
            title: "Stok Değiştir",
            iconWidget: Icons.change_circle_outlined,
            onTap: () async {
              Get.back();
              final stokModel = await Get.toNamed("/mainPage/stokListesi", arguments: true);
              if (stokModel is StokListesiModel) {
                BaseSiparisEditModel.instance.kalemList?[index] = viewModel.kalemList![index].copyWith(
                  stokAdi: stokModel.stokAdi,
                  stokKodu: stokModel.stokKodu,
                  stokAlisKdv: stokModel.alisKdv,
                  stokSatisKdv: stokModel.satisKdv,
                  paketMi: stokModel.paketMi,
                  seriGirislerdeAcik: stokModel.seriGirislerdeAcik,
                  seriCikislardaAcik: stokModel.seriCikislardaAcik,
                  seriMiktarKadarSor: stokModel.seriMiktarKadarSor,
                  // kdvOrani: BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi == true ? stokModel.satisKdv : stokModel.alisKdv,
                );
                viewModel.updateKalemList();
                // viewModel.addKalemList(KalemModel.fromStokListesiModel(stokModel));
              }
            },
          ),
        if (!model.kalemEBelgedenMi)
          BottomSheetModel(
            title: "Stok İşlemleri",
            iconWidget: Icons.list_alt_outlined,
            onTap: () async {
              Get.back();
              final StokListesiModel? stokList = await networkManager.getStokModel(
                StokRehberiRequestModel.fromKalemModel(model),
              );
              if (stokList == null) {
                return;
              }
              return dialogManager.showStokGridViewDialog(stokList);
            },
          ),
      ],
    );
  }

  Future<void> getBarkodStok() async {
    final result = await Get.toNamed("/qr");
    if (result == null) return;
    _searchTextController.text = result;
    final stokModel = await networkManager.getStokModel(
      StokRehberiRequestModel(
        oto: model.getEditTipiEnum?.urunOtomatikEklensin ?? false ? "E" : null,
        stokKodu: result,
        menuKodu: "COMM_FADE",
        ozelKod1: model.ozelKod1,
        ozelKod2: model.ozelKod2,
        belgeTarihi: model.tarih.toDateString,
        okutuldu: true,
        cariKodu: model.cariKodu,
        belgeTipi: model.getEditTipiEnum?.rawValue,
        faturaTipi: 2,
        faturaHedefDepo: model.hedefDepo,
        faturaDepoKodu: model.cikisDepoKodu,
        belgeNo: model.belgeNo,
      ),
    );

    final isStokKoduExists = model.kalemList?.any((element) => element.stokKodu == stokModel?.stokKodu) ?? false;
    final isBarkodExists =
        model.kalemList?.any(
          (element) => isStokKoduExists && (element.barkodList?.any((element2) => element2.barkod == result) ?? false),
        ) ??
        false;
    if (stokModel == null) {
      if (!(model.getEditTipiEnum?.urunOtomatikEklensin ?? false)) {
        await Get.toNamed("/mainPage/stokRehberi", arguments: result);
      } else {
        dialogManager.showAlertDialog(
          "Barkod bulunamadı.\nSadece Barkodlu Stoklar Eklenebilir.\nOkutulan barkod: $result",
        );
      }
    } else {
      if (isBarkodExists && model.getEditTipiEnum?.tekrarEdenBarkod == "EY" ||
          isStokKoduExists && model.getEditTipiEnum?.tekrarEdenBarkod == "E") {
        return dialogManager.showAlertDialog("Bu barkod zaten eklenmiş.");
      }
      final bool satisMi = model.getEditTipiEnum?.satisMi ?? false;
      final KalemModel kalemModel = KalemModel.fromBarkodModel(stokModel)
        ..kdvOrani = satisMi ? stokModel.satisKdv : stokModel.alisKdv;
      if (model.getEditTipiEnum?.urunOtomatikEklensin ?? false) {
        if ((stokModel.miktar ?? 0) <= 0) {
          dialogManager.showAlertDialog("Stok miktarı 0 veya daha az olduğu için eklenemez.");
          return;
        }
        if (isStokKoduExists && model.getEditTipiEnum?.tekrarEdenBarkod == "M") {
          // add miktar into existing kalem
          final kalem = model.kalemList?.firstWhereOrNull((element) => element.stokKodu == stokModel.stokKodu);
          if (kalem != null) {
            kalem.miktar = (kalem.miktar ?? 0) + (stokModel.miktar ?? 0);
          }
          BaseSiparisEditModel.instance.kalemList = model.kalemList;
        } else {
          BaseSiparisEditModel.instance.kalemList ??= [];
          BaseSiparisEditModel.instance.kalemList?.add(kalemModel);
        }
      } else {
        if (isStokKoduExists && (model.getEditTipiEnum?.tekrarEdenBarkod?.startsWith("S") ?? false)) {
          bool devamMi = false;
          await dialogManager.showAreYouSureDialog(
            () => devamMi = true,
            title: "${stokModel.stokKodu} - ${stokModel.stokAdi} ürün listenizde mevcut.\nYine de eklensin mi?",
          );
          if (!devamMi) return;
        }
        final stok = await Get.toNamed("/kalemEkle", arguments: kalemModel);
        if (stok is! KalemModel) return;
        if (isStokKoduExists) {
          if (model.getEditTipiEnum?.tekrarEdenBarkod?.endsWith("M") ?? false) {
            kalemBirlestir(stokModel, stok);
          }
        }
      }
    }
    _searchTextController.clear();
    viewModel.updateKalemList();
  }

  void kalemBirlestir(StokListesiModel stokModel, KalemModel stok) {
    final kalem = model.kalemList?.firstWhereOrNull((element) => element.stokKodu == stokModel.stokKodu);
    if (kalem != null) {
      model.kalemList?.removeLast();
      kalem.miktar = (kalem.miktar ?? 0) + (stok.miktar ?? 0);
      kalem.seriList?.addAll(stok.seriList ?? []);
      kalem.barkodList?.add(BarkodList(barkod: stok.barkod, miktar: stok.miktar, miktar2: stok.miktar2));
    }
    BaseSiparisEditModel.instance.kalemList = model.kalemList;
  }
}
