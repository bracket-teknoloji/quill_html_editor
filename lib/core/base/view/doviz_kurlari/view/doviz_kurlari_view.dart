import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../view/main_page/model/param_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/helper_widgets/custom_label_widget.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/cache/cache_manager.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_network_mixin.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../model/generic_response_model.dart";
import "../../../state/base_state.dart";
import "../../doviz_kuru_girisi/view/doviz_kuru_girisi_view.dart";
import "../view_model/doviz_kurlari_view_model.dart";

class DovizKurlariView extends StatefulWidget {
  const DovizKurlariView({super.key});

  @override
  State<DovizKurlariView> createState() => _DovizKurlariViewState();
}

class _DovizKurlariViewState extends BaseState<DovizKurlariView> {
  DovizKurlariViewModel viewModel = DovizKurlariViewModel();
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: viewModel.tarih.toDateString);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar(), floatingActionButton: fab(context), body: body());

  AppBar appBar() => AppBar(
        title: const Text("Döviz Kurları"),
      );

  FloatingActionButton fab(BuildContext context) => FloatingActionButton(
        onPressed: () async {
          await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: <BottomSheetModel>[
            BottomSheetModel(
                title: "Kur Girişi",
                iconWidget: Icons.add,
                onTap: () async {
                  if (setDovizBottomSheetList.ext.isNotNullOrEmpty) {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Döviz Tipi", children: setDovizBottomSheetList);
                    if (result != null && result is DovizList) {
                      Get.back();
                      await Get.to(() =>
                          DovizKuruGirisiView(dovizKurlariModel: DovizKurlariModel(tarih: DateTime.now(), dovizTipi: result.dovizTipi, dovizAdi: result.isim ?? result.dovizKodu.toStringIfNotNull)));
                      await getData();
                    }
                  } else {
                    Get.back();
                    await dialogManager.showAlertDialog("Döviz kuru girişi için en fazla 2 kayıt olabilir");
                  }
                }),
            BottomSheetModel(
                title: "Kurları Netsis'ten Getir",
                iconWidget: Icons.edit_outlined,
                onTap: () async {
                  Get.back();
                  await dovizKuruGuncelle();
                }),
          ]);
        },
        child: const Icon(Icons.add),
      );

  Column body() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  onPressed: () async {
                    viewModel.changeTarihYesterday();
                    _controller.text = viewModel.tarih.toDateString;
                    await getData();
                  },
                  icon: const Icon(Icons.arrow_back)),
              Expanded(
                  child: CustomTextField(
                labelText: "Tarih",
                readOnly: true,
                isMust: true,
                controller: _controller,
                isDateTime: true,
                onTap: () async {
                  final DateTime? result = await dialogManager.showDateTimePicker();
                  if (result != null) {
                    viewModel.changeTarih(result);
                    _controller.text = viewModel.tarih.toDateString;
                    await getData();
                  }
                },
              )),
              IconButton(
                  onPressed: () async {
                    viewModel.changeTarihTomorow();
                    _controller.text = viewModel.tarih.toDateString;
                    await getData();
                  },
                  icon: const Icon(Icons.arrow_forward))
            ],
          ),
          const Text("Kurlar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)).paddingOnly(top: UIHelper.midSize),
          const Divider().paddingSymmetric(vertical: UIHelper.lowSize),
          Expanded(
              child: RefreshIndicator.adaptive(
            onRefresh: () async => await getData(),
            child: Observer(
                builder: (_) => viewModel.dovizKurlariList.ext.isNullOrEmpty
                    ? viewModel.dovizKurlariList == null
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : const Center(child: Text("Veri Yok"))
                    : ListView.builder(
                        itemCount: viewModel.dovizKurlariList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final DovizKurlariModel model = viewModel.dovizKurlariList?[index] ?? DovizKurlariModel();
                          return Card(
                              child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(model.dovizAdi ?? ""),
                                Text(model.tarih.toDateString, style: const TextStyle(color: Colors.grey)),
                              ],
                            ).paddingOnly(bottom: UIHelper.highSize),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <CustomWidgetWithLabel>[
                                CustomWidgetWithLabel(isVertical: true, text: "Alış", child: Text(model.dovAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati))),
                                CustomWidgetWithLabel(isVertical: true, text: "Satış", child: Text(model.dovSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati))),
                                CustomWidgetWithLabel(isVertical: true, text: "Ef. Alış", child: Text(model.effAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati))),
                                CustomWidgetWithLabel(isVertical: true, text: "Ef. Satış", child: Text(model.effSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati))),
                              ].map((CustomWidgetWithLabel e) => Expanded(child: e)).toList(),
                            ),
                            onTap: () async {
                              await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: <BottomSheetModel>[
                                BottomSheetModel(
                                    title: "Düzelt",
                                    iconWidget: Icons.edit_outlined,
                                    onTap: () async {
                                      Get.back();
                                      await Get.to(() => DovizKuruGirisiView(dovizKurlariModel: model));
                                      await getData();
                                    }),
                                BottomSheetModel(
                                    title: "Sil",
                                    iconWidget: Icons.delete_outline,
                                    onTap: () {
                                      Get.back();
                                      dialogManager.showAreYouSureDialog(() async {
                                        final GenericResponseModel<NetworkManagerMixin> result = await networkManager.dioPost<DovizKurlariModel>(
                                            path: ApiUrls.deleteDovizKuru, bodyModel: DovizKurlariModel(), data: <String, Object?>{"DovizTipi": model.dovizTipi, "Tarih": model.tarih.toDateString});
                                        if (result.success == true) {
                                          dialogManager.showSuccessSnackBar("Başarıyla Silindi");
                                          await getData();
                                        }
                                      });
                                    }),
                              ]);
                            },
                          ));
                        })),
          ))
        ],
      );

  Future<void> getData() async {
    viewModel.changeDovizKurlariList(null);
    final GenericResponseModel<NetworkManagerMixin> result = await networkManager
        .dioGet<DovizKurlariModel>(path: ApiUrls.getDovizKurlari, bodyModel: DovizKurlariModel(), queryParameters: <String, dynamic>{"EkranTipi": "L", "SabitTarih": viewModel.tarih.toDateString});
    if (result.success == true && result.data is List) {
      viewModel.changeDovizKurlariList(result.data.whereType<DovizKurlariModel>().toList());
    }
  }

  Future<void> dovizKuruGuncelle() async {
    await dialogManager.showDialog(
      onYes: () async {
        final GenericResponseModel<NetworkManagerMixin> result = await networkManager.dioPost<DovizKurlariModel>(
            showLoading: true,
            path: ApiUrls.dovizKuruGuncelle,
            bodyModel: DovizKurlariModel(),
            data: <String, Object>{"SilGuncelle": viewModel.kurlariSilTekrarGuncelle, "Tarih": viewModel.tarih.toDateString});
        if (result.success == true) {
          dialogManager.showSuccessSnackBar("Başarıyla Güncellendi");
          await getData();
        }
      },
      body: Column(
        children: <Widget>[
          Text("${viewModel.tarih.toDateString} tarihli döviz kurları güncellensin mi?"),
          Observer(
              builder: (_) => CheckboxListTile.adaptive(
                  title: const Text("Mevcut kurları sil ve tekrar güncelle"),
                  value: viewModel.kurlariSilTekrarGuncelle,
                  onChanged: (bool? value) => viewModel.changeKurlariSilTekrarGuncelle())).paddingSymmetric(vertical: UIHelper.lowSize)
        ],
      ),
    );
  }

  List<BottomSheetModel> get setDovizBottomSheetList {
    final List<DovizList>? dovizList = CacheManager.getAnaVeri()?.paramModel?.dovizList;
    final List<BottomSheetModel> bottomSheetList = <BottomSheetModel>[];
    for (DovizList item in dovizList?.where((DovizList element) => element.dovizTipi != 0).toList() ?? <DovizList>[]) {
      if (viewModel.dovizKurlariList?.any((DovizKurlariModel element) => element.dovizTipi != item.dovizTipi) ?? false) {
        bottomSheetList.add(BottomSheetModel(title: item.isim ?? item.dovizTipi.toStringIfNotNull ?? "", iconWidget: Icons.add, value: item));
      }
    }
    return bottomSheetList;
  }
}
