import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
import "../../../model/base_siparis_edit_model.dart";
import "../view_model/base_siparis_kalemler_view_model.dart";

class BaseSiparisKalemlerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparisKalemlerView({super.key, required this.model});

  @override
  State<BaseSiparisKalemlerView> createState() => _BaseSiparisKalemlerViewState();
}

class _BaseSiparisKalemlerViewState extends BaseState<BaseSiparisKalemlerView> {
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
  dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !widget.model.isGoruntule,
        child: FloatingActionButton(
          onPressed: () async {
            // bottomSheetDialogManager.showPrintDialog(context, DicParams(belgeNo: model.belgeNo, belgeTipi: model.belgeTipi.toStringIfNull, cariKodu: model.cariKodu));
            await Get.toNamed("/mainPage/stokRehberi");
            viewModel.updateKalemList();
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: Column(
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
                    var result = await Get.toNamed("/qr");
                    if (result != null) {
                      _searchTextController.text = result;
                      await Get.toNamed("/mainPage/stokRehberi", arguments: result);
                      viewModel.updateKalemList();
                    }
                  },
                  icon: const Icon(Icons.qr_code_2_outlined)),
            ),
          ),
          Expanded(
              child: Observer(
                  builder: (_) => viewModel.kalemList.ext.isNullOrEmpty
                      ? Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.manage_search_outlined, size: 50, color: theme.colorScheme.primary),
                            const Text("Kalem bulunamadı.\nLütfen Kalem Ekleyin.", textAlign: TextAlign.center),
                          ],
                        ))
                      : Observer(
                          builder: (_) => ListView.builder(
                              primary: false,
                              padding: UIHelper.lowPadding,
                              itemCount: viewModel.kalemList?.length ?? 0,
                              itemBuilder: (context, index) {
                                KalemModel? kalemModel = viewModel.kalemList?[index];
                                return Card(
                                    child: Column(
                                        children: [
                                  kalemListTile(context, index, kalemModel),
                                  ...List.generate((kalemModel?.kalemModelHucreList?.length ?? 0), (index2) {
                                    StokList? stokList = kalemModel?.kalemModelHucreList?[index2];
                                    return Column(
                                      children: [
                                        const Divider(),
                                        hucreListTile(stokList, kalemModel).paddingOnly(left: UIHelper.highSize, top: UIHelper.lowSize, bottom: UIHelper.lowSize),
                                      ],
                                    );
                                  }),
                                ].map((e) => e.paddingAll(UIHelper.lowSize)).toList()));
                              }))))
        ],
      ),
    );
  }

  ListTile kalemListTile(BuildContext context, int index, KalemModel? kalemModel) {
    return ListTile(
      onTap: () async => await listTileBottomSheet(context, index),
      contentPadding: UIHelper.lowPadding,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [SizedBox(width: width * 0.7, child: Text(kalemModel?.stokAdi ?? kalemModel?.stokKodu ?? "", softWrap: true)), const Icon(Icons.more_vert_outlined)],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Badge(label: Text("Karma Koli")).yetkiVarMi(kalemModel?.kalemModelHucreList.ext.isNotNullOrEmpty ?? false),
          Text(kalemModel?.stokKodu ?? ""),
          Text("${kalemModel?.depoKodu ?? ""} - ${kalemModel?.depoTanimi ?? ""}").paddingOnly(bottom: UIHelper.lowSize),
          Wrap(
              children: [
            Text("Miktar: ${kalemModel?.miktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}"),
            Text("Miktar2: ${kalemModel?.miktar2.toIntIfDouble ?? ""}"),
            Text("Teslim Miktar: ${kalemModel?.miktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}"),
            Text("Mal Fazlası Miktar: ${kalemModel?.malFazlasiMiktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}"),
            Text("Satış İskontosu: ${kalemModel?.iskontoTutari.commaSeparatedWithFixedDigits ?? ""}"),
            Text("Kalan Miktar: ${kalemModel?.miktar.toIntIfDouble ?? ""} ${kalemModel?.olcuBirimAdi ?? ""}"),
            Text("Fiyat: ${kalemModel?.brutFiyat.commaSeparatedWithFixedDigits ?? 0.00}"),
            Text("Teslim Tarihi: ${kalemModel?.teslimTarihi.toDateStringIfNull() ?? ""}"),
          ].map((e) => SizedBox(width: width * 0.4, child: e)).toList()),
        ],
      ),
    );
  }

  ListTile hucreListTile(StokList? stokList, KalemModel? kalemModel) {
    return ListTile(
      contentPadding: UIHelper.lowPadding,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.7,
            child: Text("${stokList?.stokKodu ?? ""} - ${stokList?.stokAdi ?? ""}", softWrap: true).paddingOnly(bottom: UIHelper.lowSize),
          ),
          IconButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Hücre İşlemleri", children: [
                  BottomSheetModel(title: "Stok Etiketi Yazdır", iconWidget: Icons.print_outlined),
                  BottomSheetModel(
                      title: "Stok İşlemleri",
                      iconWidget: Icons.list_alt_outlined,
                      onTap: () {
                        Get.back();
                        dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = stokList?.stokKodu ?? "");
                      }),
                ]);
              },
              icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
              children: [
            Text("Miktar: ${((stokList?.koliBilesenMiktari.toIntIfDouble ?? 0) * (kalemModel?.miktar.toIntIfDouble ?? 0)).toIntIfDouble.toStringIfNull ?? ""}"),
            Text("Fiyat: ${stokList?.bulunanFiyat.toIntIfDouble.commaSeparatedWithFixedDigits ?? ""}"),
            Text("KDV %: ${(StaticVariables.instance.isMusteriSiparisleri ? stokList?.satisKdv : stokList?.alisKdv).toIntIfDouble ?? ""}"),
            Text("Tutar: ${((stokList?.koliBilesenMiktari ?? 0) * (kalemModel?.genelToplamTutari ?? 0) * (stokList?.koliBilesenOrani ?? 0) / 100).commaSeparatedWithFixedDigits}"),
          ]
                  .map((e) => SizedBox(
                        width: width * 0.4,
                        child: e,
                      ))
                  .toList()),
        ],
      ),
      // title: Text("${stokList?.stokKodu ?? ""}-${stokList?.stokAdi ?? ""}"),
      // subtitle: Text("${viewModel.kalemList?[index].kalemModelHucreList?[index].miktar ?? ""} ${viewModel.kalemList?[index].kalemModelHucreList?[index].olcuBirimAdi ?? ""}"),
      // trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
    );
  }

  listTileBottomSheet(BuildContext context, int index) {
    bottomSheetDialogManager.showBottomSheetDialog(context, title: viewModel.kalemList?[index].stokAdi ?? "", children: [
      BottomSheetModel(
          title: "Düzelt",
          iconWidget: Icons.edit_outlined,
          onTap: () async {
            Get.back();
            await Get.toNamed("/kalemEkle", arguments: viewModel.kalemList?[index]);
            viewModel.updateKalemList();
          }),
      BottomSheetModel(
          title: "Sil",
          iconWidget: Icons.delete_outline_outlined,
          onTap: () => dialogManager.showAreYouSureDialog(() {
                Get.back();
                viewModel.removeAtKalemList(index);
              })),
      BottomSheetModel(
          title: "Stok İşlemleri",
          iconWidget: Icons.list_alt_outlined,
          onTap: () {
            Get.back();
            return dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = viewModel.kalemList?[index].stokKodu ?? "");
          }),
    ]);
  }
}
