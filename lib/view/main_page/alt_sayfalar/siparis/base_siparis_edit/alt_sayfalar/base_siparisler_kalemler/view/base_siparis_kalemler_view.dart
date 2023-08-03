import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';

import '../../../../../../../../core/base/model/base_edit_model.dart';
import '../../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../siparisler/model/siparis_edit_reuqest_model.dart';

class BaseSiparisKalemlerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparisKalemlerView({super.key, required this.model});

  @override
  State<BaseSiparisKalemlerView> createState() => _BaseSiparisKalemlerViewState();
}

class _BaseSiparisKalemlerViewState extends BaseState<BaseSiparisKalemlerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance.tempJsonData ?? BaseSiparisEditModel.instance;
  late final TextEditingController _searchTextController;
  @override
  void initState() {
    _searchTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !widget.model.isGoruntule,
        child: FloatingActionButton(
          onPressed: () {
            // bottomSheetDialogManager.showPrintDialog(context, DicParams(belgeNo: model.belgeNo, belgeTipi: model.belgeTipi.toStringIfNull, cariKodu: model.cariKodu));
            Get.toNamed("/mainPage/stokRehberi");
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
                }
              },
              suffix: IconButton(
                  onPressed: () async {
                    var result = await Get.toNamed("/qr");
                    if (result != null) {
                      _searchTextController.text = result;
                      await Get.toNamed("/mainPage/stokRehberi", arguments: result);
                    }
                  },
                  icon: const Icon(Icons.qr_code_2_outlined)),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: BaseSiparisEditModel.instance.tempJsonData?.kalemAdedi ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(context, title: BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].stokAdi ?? "", children: [
                        BottomSheetModel(title: "Düzelt", iconWidget: Icons.edit_outlined),
                        BottomSheetModel(title: "Sil", iconWidget: Icons.delete_outline_outlined),
                        BottomSheetModel(
                            title: "Stok İşlemleri",
                            iconWidget: Icons.list_alt_outlined,
                            onTap: () {
                              Get.back();
                              return dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].stokKodu ?? "");
                            }),
                      ]),
                      contentPadding: UIHelper.lowPadding,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].stokAdi ?? ""),
                          IconButton(
                              onPressed: () async {
                                await bottomSheetDialogManager.showBottomSheetDialog(context, title: BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].stokAdi ?? "", children: [
                                  BottomSheetModel(title: "Düzelt", iconWidget: Icons.edit_outlined),
                                  BottomSheetModel(title: "Sil", iconWidget: Icons.delete_outline_outlined),
                                  BottomSheetModel(
                                      title: "Stok İşlemleri",
                                      iconWidget: Icons.list_alt_outlined,
                                      onTap: () => dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].stokKodu ?? "")),
                                ]);
                              },
                              icon: const Icon(Icons.more_vert_outlined))
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].stokKodu ?? ""),
                          Text("${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].depoKodu ?? ""} - ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].depoTanimi ?? ""}")
                              .paddingOnly(bottom: UIHelper.lowSize),
                          Wrap(
                              children: [
                            Text("Miktar: ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].miktar ?? ""} ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].olcuBirimAdi ?? ""}"),
                            Text("Teslim Miktar: ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].miktar ?? ""} ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].olcuBirimAdi ?? ""}"),
                            // Text("Miktar2: ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].miktar ?? ""} ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].olcuBirimAdi ?? ""}"),
                            Text("Kalan Miktar: ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].miktar ?? ""} ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].olcuBirimAdi ?? ""}"),
                            Text("Fiyat: ${(BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].miktar ?? 0) * (BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].brutFiyat ?? 0)}"),
                            Text("Teslim Tarihi: ${BaseSiparisEditModel.instance.tempJsonData?.kalemList?[index].teslimTarihi.toDateStringIfNull() ?? ""}"),
                          ]
                                  .map((e) => SizedBox(
                                        width: width * 0.4,
                                        child: e,
                                      ))
                                  .toList()),
                        ],
                      ),
                    ).paddingAll(UIHelper.lowSize));
                  }))
        ],
      ),
    );
  }
}
