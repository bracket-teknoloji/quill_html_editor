import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
import "../../../model/base_siparis_edit_model.dart";
import "../view_model/base_siparis_kalemler_view_model.dart";

final class BaseSiparisKalemlerView extends StatefulWidget {
  const BaseSiparisKalemlerView({required this.model, super.key, this.updater});
  final BaseEditModel<SiparisEditRequestModel> model;
  final bool? updater;

  @override
  State<BaseSiparisKalemlerView> createState() => _BaseSiparisKalemlerViewState();
}

final class _BaseSiparisKalemlerViewState extends BaseState<BaseSiparisKalemlerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  BaseSiparisKalemlerViewModel viewModel = BaseSiparisKalemlerViewModel();
  late final TextEditingController _searchTextController;
  @override
  void initState() {
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
    visible: !widget.model.isGoruntule,
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
      children: [
        Visibility(
          visible: !widget.model.isGoruntule,
          child: CustomTextField(
            labelText: "Stok Kodu / Barkod Giriniz",
            controller: _searchTextController,
            onSubmitted: (p0) async {
              if (p0.ext.isNotNullOrNoEmpty) {
                await Get.toNamed("/mainPage/stokRehberi", arguments: p0);
                viewModel.updateKalemList();
              }
            },
            suffix: IconButton(
              onPressed: () async {
                final result = await Get.toNamed("/qr");
                if (result != null) {
                  _searchTextController.text = result;
                  await Get.toNamed("/mainPage/stokRehberi", arguments: result);
                  viewModel.updateKalemList();
                }
              },
              icon: const Icon(Icons.qr_code_scanner),
            ),
          ).paddingOnly(top: UIHelper.lowSize),
        ),
        Expanded(
          child: Observer(
            builder:
                (_) =>
                    viewModel.kalemList.ext.isNullOrEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                      children: [
                                        kalemListTile(context, index, kalemModel),
                                        ...List.generate(kalemModel.kalemList?.length ?? 0, (index2) {
                                          final KalemModel? model = kalemModel.kalemList?[index2];
                                          return Column(
                                            children: [
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
    onTap: () async => await listTileBottomSheet(context, index),
    contentPadding: UIHelper.lowPadding.copyWith(left: UIHelper.highSize, bottom: UIHelper.lowSize),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(kalemModel.kalemAdi ?? kalemModel.stokAdi ?? kalemModel.stokKodu ?? "", softWrap: true)),
        const Icon(Icons.more_vert_outlined),
      ],
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (kalemModel.paketMi == "K")
          const ColorfulBadge(label: Text("Karma Koli"), badgeColorEnum: BadgeColorEnum.karmaKoli),
        if (kalemModel.stokKodu case final value?) Text(value),
        Text("${kalemModel.depoKodu ?? ""} - ${kalemModel.depoTanimi ?? ""}").paddingOnly(bottom: UIHelper.lowSize),
        if (kalemModel.faturaKalemAciklama != "")
          Text(kalemModel.faturaKalemAciklama, style: const TextStyle(color: UIHelper.primaryColor)),
        LayoutBuilder(
          builder:
              (context, constrains) => Wrap(
                children:
                    [
                      if (kalemModel.kosulKodu != null && kalemModel.kosulKodu != "")
                        Text("Koşul: ${kalemModel.kosulKodu ?? ""}"),
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
                      if (kalemModel.brutFiyat != null)
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Fiyat: ${kalemModel.brutFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat)}",
                              ),
                              if (kalemModel.dovizliMi)
                                TextSpan(
                                  text:
                                      "\n(${kalemModel.dovizliFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency})",
                                ),
                            ],
                          ),
                        ),
                      if (kalemModel.dovizKuru != null)
                        Text(
                          "Kur: ${kalemModel.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency}",
                        ),
                      if (kalemModel.brutFiyat != null)
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Tutar: ${(kalemModel.brutTutar - kalemModel.iskontoTutari).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                              ),
                              if (kalemModel.dovizliMi)
                                TextSpan(
                                  text:
                                      "\n(${kalemModel.dovizBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${kalemModel.dovizAdi ?? mainCurrency})",
                                ),
                            ],
                          ),
                        ),
                      if (kalemModel.projeKodu != null && yetkiController.projeUygulamasiAcikMi)
                        Text("Proje: ${kalemModel.projeKodu}"),
                      if (kalemModel.tamamlanan != null)
                        Text(
                          "Teslim Miktar: ${kalemModel.tamamlanan.toIntIfDouble ?? ""} ${kalemModel.olcuBirimAdi ?? ""}",
                        ),
                      if (kalemModel.kalan != null)
                        Text("Kalan Miktar: ${kalemModel.kalan.toIntIfDouble ?? ""} ${kalemModel.olcuBirimAdi ?? ""}"),
                      if (kalemModel.teslimTarihi != null)
                        Text("Teslim Tarihi: ${kalemModel.teslimTarihi.toDateString}"),
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
      children: [
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
              children: [
                if (kDebugMode) BottomSheetModel(title: "Stok Etiketi Yazdır", iconWidget: Icons.print_outlined),
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
    subtitle: CustomLayoutBuilder.divideInHalf(
      children: [
        Text("Miktar: ${(kalemList?.getSelectedMiktar.toIntIfDouble ?? 0).toIntIfDouble.toStringIfNotNull ?? ""}"),
        Text("Fiyat: ${kalemList?.brutFiyat.toIntIfDouble.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat) ?? ""}"),
        // Text("KDV %: ${(kalemList?.kdvOrani).toIntIfDouble ?? ""}"),
        Text(
          "KDV %: ${((model.getEditTipiEnum?.satisMi == true ? kalemList?.stokSatisKdv : kalemList?.stokAlisKdv) ?? kalemList?.kdvOrani).toIntIfDouble ?? ""}",
        ),
        Text(
          "Tutar: ${(kalemList?.araToplamTutari.toIntIfDouble ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
        ),
      ],
    ),
    // title: Text("${stokList?.stokKodu ?? ""}-${stokList?.stokAdi ?? ""}"),
    // subtitle: Text("${viewModel.kalemList?[index].kalemList?[index].miktar ?? ""} ${viewModel.kalemList?[index].kalemList?[index].olcuBirimAdi ?? ""}"),
    // trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
  );

  Future<void> listTileBottomSheet(BuildContext context, int index) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: viewModel.kalemList?[index].stokAdi ?? "",
      children: [
        if (!widget.model.isGoruntule)
          BottomSheetModel(
            title: loc.generalStrings.edit,
            iconWidget: Icons.edit_outlined,
            onTap: () async {
              Get.back();
              final result = await Get.toNamed("/talepTeklifKalemEkle", arguments: viewModel.kalemList?[index]);
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
        BottomSheetModel(
          title: "Stok İşlemleri",
          iconWidget: Icons.list_alt_outlined,
          onTap: () {
            Get.back();
            return dialogManager.showStokGridViewDialog(
              StokListesiModel()..stokKodu = viewModel.kalemList?[index].stokKodu ?? "",
            );
          },
        ),
      ],
    );
  }
}
