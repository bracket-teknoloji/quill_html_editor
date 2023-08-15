import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
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
                                return Card(
                                    child: ListTile(
                                  onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(context, title: viewModel.kalemList?[index].stokAdi ?? "", children: [
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
                                  ]),
                                  contentPadding: UIHelper.lowPadding,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [Text(viewModel.kalemList?[index].stokAdi ?? viewModel.kalemList?[index].stokKodu ?? ""), const Icon(Icons.more_vert_outlined)],
                                  ),
                                  subtitle: Observer(builder: (_) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(viewModel.kalemList?[index].stokKodu ?? ""),
                                        Text("${viewModel.kalemList?[index].depoKodu ?? ""} - ${viewModel.kalemList?[index].depoTanimi ?? ""}").paddingOnly(bottom: UIHelper.lowSize),
                                        Wrap(
                                            children: [
                                          Text("Miktar: ${viewModel.kalemList?[index].miktar ?? ""} ${viewModel.kalemList?[index].olcuBirimAdi ?? ""}"),
                                          Text("Teslim Miktar: ${viewModel.kalemList?[index].miktar ?? ""} ${viewModel.kalemList?[index].olcuBirimAdi ?? ""}"),
                                          // Text("Miktar2: ${viewModel.kalemList[index].miktar ?? ""} ${viewModel.kalemList[index].olcuBirimAdi ?? ""}"),
                                          Text("Kalan Miktar: ${viewModel.kalemList?[index].miktar ?? ""} ${viewModel.kalemList?[index].olcuBirimAdi ?? ""}"),
                                          Text("Fiyat: ${(viewModel.kalemList?[index].miktar ?? 0) * (viewModel.kalemList?[index].brutFiyat ?? 0)}"),
                                          Text("Teslim Tarihi: ${viewModel.kalemList?[index].teslimTarihi.toDateStringIfNull() ?? ""}"),
                                        ]
                                                .map((e) => SizedBox(
                                                      width: width * 0.4,
                                                      child: e,
                                                    ))
                                                .toList()),
                                      ],
                                    );
                                  }),
                                ).paddingAll(UIHelper.lowSize));
                              }))))
        ],
      ),
    );
  }
}
