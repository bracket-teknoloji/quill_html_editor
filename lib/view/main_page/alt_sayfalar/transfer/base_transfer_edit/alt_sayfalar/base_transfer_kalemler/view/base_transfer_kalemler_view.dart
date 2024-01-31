import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/text_span_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../view_model/base_transfer_kalemler_view_model.dart";

class BaseTransferKalemlerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  final bool? updater;
  const BaseTransferKalemlerView({super.key, required this.model, this.updater});

  @override
  State<BaseTransferKalemlerView> createState() => _BaseTransferKalemlerViewState();
}

class _BaseTransferKalemlerViewState extends BaseState<BaseTransferKalemlerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  BaseTransferKalemlerViewModel viewModel = BaseTransferKalemlerViewModel();
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
  Widget build(BuildContext context) => Scaffold(floatingActionButton: fab(), body: body());

  Visibility fab() => Visibility(
        visible: !widget.model.isGoruntule,
        child: FloatingActionButton(
          onPressed: () async {
            // bottomSheetDialogManager.showPrintDialog(context, DicParams(belgeNo: model.belgeNo, belgeTipi: model.belgeTipi.toStringIfNotNull, cariKodu: model.cariKodu));
            await Get.toNamed("/mainPage/TransferStokRehberi");
            viewModel.updateKalemList();
          },
          child: const Icon(Icons.add),
        ),
      );

  Padding body() => Padding(
        padding: UIHelper.lowPadding,
        child: Column(
          children: <Widget>[
            Visibility(
              visible: !widget.model.isGoruntule,
              child: CustomTextField(
                labelText: "Stok Kodu / Barkod Giriniz",
                controller: _searchTextController,
                onSubmitted: (String p0) async {
                  if (p0.ext.isNotNullOrNoEmpty) {
                    await Get.toNamed("/mainPage/TransferStokRehberi", arguments: p0);
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
                builder: (_) => viewModel.kalemList.ext.isNullOrEmpty
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
                        builder: (_) => ListView.builder(
                          primary: true,
                          itemCount: viewModel.kalemList?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final KalemModel? kalemModel = viewModel.kalemList?[index];
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  kalemListTile(context, index, kalemModel),
                                  ...List.generate(kalemModel?.kalemList?.length ?? 0, (int index2) {
                                    final KalemModel? model = kalemModel?.kalemList?[index2];
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

  ListTile kalemListTile(BuildContext context, int index, KalemModel? kalemModel) => ListTile(
        onTap: () async => await listTileBottomSheet(context, index, model: kalemModel),
        contentPadding: UIHelper.lowPadding.copyWith(left: UIHelper.highSize, bottom: UIHelper.lowSize),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: width * 0.7, child: Text(kalemModel?.kalemAdi ?? kalemModel?.stokAdi ?? kalemModel?.stokKodu ?? "", softWrap: true)),
            const Icon(Icons.more_vert_outlined),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(kalemModel?.dovizliMi ?? false),
            const ColorfulBadge(label: Text("Karma Koli"), badgeColorEnum: BadgeColorEnum.karmaKoli).yetkiVarMi(kalemModel?.kalemList.ext.isNotNullOrEmpty ?? false),
            Text(kalemModel?.stokKodu ?? ""),
            Text("${kalemModel?.depoKodu ?? ""} - ${kalemModel?.depoTanimi ?? ""}").yetkiVarMi(kalemModel?.depoKodu != null && kalemModel?.depoTanimi != null),
            // Text(kalemModel?.faturaKalemAciklama ?? "", style: TextStyle(color: UIHelper.primaryColor)).yetkiVarMi(kalemModel?.seriList != null),
            Text("Sipariş ${kalemModel?.siparisNo ?? ""} (${kalemModel?.siparisSira ?? ""})", style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.primaryColor))
                .yetkiVarMi(kalemModel?.siparisNo != null)
                .paddingOnly(bottom: UIHelper.lowSize),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constrains) => Wrap(
                children: <Widget>[
                  Text("Miktar: ${(kalemModel?.miktar ?? kalemModel?.miktar2).toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}")
                      .yetkiVarMi(!(kalemModel?.miktar == null || kalemModel?.miktar == 0.0)),
                  Text("Miktar2: ${kalemModel?.miktar2.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}").yetkiVarMi(kalemModel?.miktar2 != null),
                  Text("KDV: %${kalemModel?.kdvOrani.toIntIfDouble ?? ""}").yetkiVarMi(kalemModel?.kdvOrani != null),
                  Text("Mal Fazlası Miktar: ${kalemModel?.malFazlasiMiktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}").yetkiVarMi(kalemModel?.malFazlasiMiktar != null),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan?>[
                        TextSpan(text: "Satış İskontosu: ${kalemModel?.iskontoTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} "),
                        if (kalemModel?.iskontoTutari != 0.0)
                          TextSpan(
                            text:
                                "(${kalemModel?.iskonto1.toIntIfDouble ?? ""}${kalemModel?.iskonto2 != null ? "+" : ""}${kalemModel?.iskonto2.toIntIfDouble ?? ""}${kalemModel?.iskonto3 != null ? "+" : ""}${kalemModel?.iskonto3.toIntIfDouble ?? ""}${kalemModel?.iskonto4 != null ? "+" : ""}${kalemModel?.iskonto4.toIntIfDouble ?? ""}${kalemModel?.iskonto5 != null ? "+" : ""}${kalemModel?.iskonto5.toIntIfDouble ?? ""}${kalemModel?.iskonto6 != null ? "+" : ""}${kalemModel?.iskonto6.toIntIfDouble ?? ""}) ",
                            style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.primaryColor),
                          )
                        else
                          null,
                      ].whereType<TextSpan>().toList(),
                    ),
                  ).yetkiVarMi(kalemModel?.kdvOrani != null),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Fiyat: ${kalemModel?.brutFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"}"),
                        TextSpan(text: "\n(${kalemModel?.getDovizBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? "0.00"} ${kalemModel?.dovizAdi ?? mainCurrency})")
                            .yetkiVarMi(kalemModel?.dovizliMi),
                      ],
                    ).yetkiVarMi(kalemModel?.brutFiyat != null),
                  ),
                  Text("Kur: ${kalemModel?.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? "0.00"} ${kalemModel?.dovizAdi ?? mainCurrency}")
                      .yetkiVarMi(kalemModel?.dovizKuru != null),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Tutar: ${kalemModel?.brutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"}"),
                        TextSpan(text: "\n(${kalemModel?.dovizGenelToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? "0.00"} ${kalemModel?.dovizAdi ?? mainCurrency})")
                            .yetkiVarMi(kalemModel?.dovizliMi),
                      ],
                    ).yetkiVarMi(kalemModel?.brutFiyat != null),
                  ),
                  Text("Proje: ${kalemModel?.projeKodu}").yetkiVarMi(kalemModel?.projeKodu != null && yetkiController.projeUygulamasiAcikMi),
                  // Text("Teslim Miktar: ${kalemModel?.miktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}").yetkiVarMi(kalemModel?.miktar != null),
                  // Text("Kalan Miktar: ${kalemModel?.miktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}").yetkiVarMi(kalemModel?.miktar != null),
                  Text("Teslim Tarihi: ${kalemModel?.teslimTarihi.toDateStringIfNull ?? ""}").yetkiVarMi(kalemModel?.teslimTarihi != null),
                ].map((Widget e) => e is! SizedBox ? SizedBox(width: constrains.maxWidth / 2, child: e) : null).toList().nullCheckWithGeneric,
              ),
            ),
          ].nullCheckWithGeneric,
        ),
      );

  ListTile hucreListTile(KalemModel? kalemList, KalemModel? superKalemList) => ListTile(
        contentPadding: UIHelper.lowPadding,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: width * 0.7,
              child: Text("${kalemList?.stokKodu ?? ""} - ${kalemList?.stokAdi ?? ""}", softWrap: true).paddingOnly(bottom: UIHelper.lowSize),
            ),
            IconButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Hücre İşlemleri",
                  children: <BottomSheetModel?>[
                    BottomSheetModel(title: "Stok Etiketi Yazdır", iconWidget: Icons.print_outlined).yetkiKontrol(false),
                    BottomSheetModel(
                      title: "Stok İşlemleri",
                      iconWidget: Icons.list_alt_outlined,
                      onTap: () {
                        Get.back();
                        dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = kalemList?.stokKodu ?? "");
                      },
                    ),
                  ].nullCheckWithGeneric,
                );
              },
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        subtitle: Wrap(
          children: <Text>[
            Text("Miktar: ${(kalemList?.getSelectedMiktar.toIntIfDouble ?? 0).toIntIfDouble.toStringIfNotNull ?? ""}"),
            Text(
              "Fiyat: ${(kalemList?.koliBilesenFiyatorandan == "E" ? superKalemList?.koliBilesenOrandan(kalemList?.koliBilesenOrani ?? 0) : kalemList?.brutFiyat).toIntIfDouble.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
            ),
            // Text("KDV %: ${(kalemList?.kdvOrani).toIntIfDouble ?? ""}"),
            Text("KDV %: ${((StaticVariables.instance.isMusteriSiparisleri ? kalemList?.stokSatisKdv : kalemList?.stokAlisKdv) ?? kalemList?.kdvOrani).toIntIfDouble ?? ""}"),

            Text(
              "Tutar: ${(((kalemList?.koliBilesenFiyatorandan == "E" ? superKalemList?.koliBilesenOrandan(kalemList?.koliBilesenOrani ?? 0) : kalemList?.brutFiyat) ?? 0) * (kalemList?.koliBilesenMiktari ?? 0)).toIntIfDouble.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
            ),
          ]
              .map(
                (Text e) => SizedBox(
                  width: width * 0.4,
                  child: e,
                ),
              )
              .toList(),
        ),
        // title: Text("${stokList?.stokKodu ?? ""}-${stokList?.stokAdi ?? ""}"),
        // subtitle: Text("${viewModel.kalemList?[index].kalemList?[index].miktar ?? ""} ${viewModel.kalemList?[index].kalemList?[index].olcuBirimAdi ?? ""}"),
        // trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
      );

  Future<void> listTileBottomSheet(BuildContext context, int index, {KalemModel? model}) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: viewModel.kalemList?[index].stokAdi ?? "",
      children: <BottomSheetModel?>[
        BottomSheetModel(
          title: loc(context).generalStrings.edit,
          iconWidget: Icons.edit_outlined,
          onTap: () async {
            Get.back();
            final result = await Get.toNamed("/TransferKalemEkle", arguments: viewModel.kalemList?[index]);
            if (result is KalemModel) {
              BaseSiparisEditModel.instance.kalemList?[index] = result;
            }
            viewModel.updateKalemList();
          },
        ).yetkiKontrol(!widget.model.isGoruntule && model?.siparisNo == null),
        BottomSheetModel(
          title: loc(context).generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: () {
            Get.back();
            return dialogManager.showAreYouSureDialog(() {
              viewModel.removeAtKalemList(index);
            });
          },
        ).yetkiKontrol(!widget.model.isGoruntule && model?.siparisNo == null),
        BottomSheetModel(
          title: "Stok İşlemleri",
          iconWidget: Icons.list_alt_outlined,
          onTap: () {
            Get.back();
            return dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = viewModel.kalemList?[index].stokKodu ?? "");
          },
        ),
      ].nullCheckWithGeneric,
    );
  }
}
