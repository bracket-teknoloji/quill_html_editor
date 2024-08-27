import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";

import "../../../../../view/main_page/model/param_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/helper_widgets/custom_label_widget.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../constants/color_palette.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/cache/cache_manager.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../state/base_state.dart";
import "../../doviz_kuru_girisi/view/doviz_kuru_girisi_view.dart";
import "../view_model/doviz_kurlari_view_model.dart";

final class DovizKurlariView extends StatefulWidget {
  const DovizKurlariView({super.key});

  @override
  State<DovizKurlariView> createState() => _DovizKurlariViewState();
}

final class _DovizKurlariViewState extends BaseState<DovizKurlariView> {
  final DovizKurlariViewModel viewModel = DovizKurlariViewModel();
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: viewModel.tarih.toDateString);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(context),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: const Text("Döviz Kurları"),
      );

  FloatingActionButton fab(BuildContext context) => FloatingActionButton(
        onPressed: () async {
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              BottomSheetModel(
                title: "Kur Girişi",
                iconWidget: Icons.add,
                onTap: () async {
                  if (setDovizBottomSheetList.ext.isNotNullOrEmpty) {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Döviz Tipi",
                      children: setDovizBottomSheetList,
                    );
                    if (result != null && result is DovizList) {
                      Get.back();
                      await Get.to(
                        () => DovizKuruGirisiView(
                          dovizKurlariModel: DovizKurlariModel(
                            tarih: DateTime.now(),
                            dovizTipi: result.dovizTipi,
                            dovizAdi: result.isim ?? result.dovizKodu.toStringIfNotNull,
                          ),
                        ),
                      );
                      await viewModel.getData();
                    }
                  } else {
                    Get.back();
                    await dialogManager.showAlertDialog(
                      "Döviz kuru girişi için en fazla 2 kayıt olabilir",
                    );
                  }
                },
              ),
              BottomSheetModel(
                title: "Kurları Netsis'ten Getir",
                iconWidget: Icons.edit_outlined,
                onTap: () async {
                  Get.back();
                  await dovizKuruGuncelle();
                },
              ),
            ],
          );
        },
        child: const Icon(Icons.add),
      );

  Column body() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  viewModel.changeTarihYesterday();
                  _controller.text = viewModel.tarih.toDateString;
                  viewModel.getData();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Tarih",
                  readOnly: true,
                  isMust: true,
                  controller: _controller,
                  isDateTime: true,
                  onTap: () async {
                    final result = await dialogManager.showDateTimePicker();
                    if (result != null) {
                      viewModel.changeTarih(result);
                      _controller.text = viewModel.tarih.toDateString;
                      await viewModel.getData();
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  viewModel.changeTarihTomorow();
                  _controller.text = viewModel.tarih.toDateString;
                  viewModel.getData();
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          const Text(
            "Kurlar",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ).paddingOnly(top: UIHelper.midSize),
          const Divider().paddingSymmetric(vertical: UIHelper.lowSize),
          Expanded(
            child: Observer(
              builder: (_) => RefreshableListView(onRefresh: viewModel.getData, items: viewModel.observableList, itemBuilder: dovizKurlariCard),
            ),
          ),
        ],
      );

  Card dovizKurlariCard(DovizKurlariModel item) => Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.dovizAdi ?? ""),
              Text(
                item.tarih.toDateString,
                style: const TextStyle(color: ColorPalette.slateGray),
              ),
            ],
          ).paddingOnly(bottom: UIHelper.highSize),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWidgetWithLabel(
                isVertical: true,
                addPadding: false,
                text: "Alış",
                child: Text(
                  item.dovAlis.commaSeparatedWithDecimalDigits(
                    OndalikEnum.dovizFiyati,
                  ),
                ),
              ),
              CustomWidgetWithLabel(
                isVertical: true,
                addPadding: false,
                text: "Satış",
                child: Text(
                  item.dovSatis.commaSeparatedWithDecimalDigits(
                    OndalikEnum.dovizFiyati,
                  ),
                ),
              ),
              CustomWidgetWithLabel(
                isVertical: true,
                addPadding: false,
                text: "Ef. Alış",
                child: Text(
                  item.effAlis.commaSeparatedWithDecimalDigits(
                    OndalikEnum.dovizFiyati,
                  ),
                ),
              ),
              CustomWidgetWithLabel(
                isVertical: true,
                addPadding: false,
                text: "Ef. Satış",
                child: Text(
                  item.effSatis.commaSeparatedWithDecimalDigits(
                    OndalikEnum.dovizFiyati,
                  ),
                ),
              ),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          onTap: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: loc.generalStrings.options,
              children: [
                BottomSheetModel(
                  title: loc.generalStrings.edit,
                  iconWidget: Icons.edit_outlined,
                  onTap: () async {
                    Get.back();
                    await Get.to(
                      () => DovizKuruGirisiView(
                        dovizKurlariModel: item,
                      ),
                    );
                    await viewModel.getData();
                  },
                ),
                BottomSheetModel(
                  title: loc.generalStrings.delete,
                  iconWidget: Icons.delete_outline,
                  onTap: () {
                    Get.back();
                    dialogManager.showAreYouSureDialog(() async {
                      final result = await networkManager.dioPost<DovizKurlariModel>(
                        path: ApiUrls.deleteDovizKuru,
                        bodyModel: DovizKurlariModel(),
                        data: {
                          "DovizTipi": item.dovizTipi,
                          "Tarih": item.tarih.toDateString,
                        },
                      );
                      if (result.isSuccess) {
                        dialogManager.showSuccessSnackBar(
                          "Başarıyla Silindi",
                        );
                        await viewModel.getData();
                      }
                    });
                  },
                ),
              ],
            );
          },
        ),
      );

  Future<void> dovizKuruGuncelle() async {
    await dialogManager.showDialog(
      onYes: () async {
        final result = await networkManager.dioPost<DovizKurlariModel>(
          showLoading: true,
          path: ApiUrls.dovizKuruGuncelle,
          bodyModel: DovizKurlariModel(),
          data: {
            "SilGuncelle": viewModel.kurlariSilTekrarGuncelle,
            "Tarih": viewModel.tarih.toDateString,
          },
        );
        if (result.isSuccess) {
          dialogManager.showSuccessSnackBar("Başarıyla Güncellendi");
          await viewModel.getData();
        }
      },
      body: Column(
        children: [
          Text(
            "${viewModel.tarih.toDateString} tarihli döviz kurları güncellensin mi?",
          ),
          Observer(
            builder: (_) => CheckboxListTile.adaptive(
              title: const Text("Mevcut kurları sil ve tekrar güncelle"),
              value: viewModel.kurlariSilTekrarGuncelle,
              onChanged: (value) => viewModel.changeKurlariSilTekrarGuncelle(),
            ),
          ).paddingSymmetric(vertical: UIHelper.lowSize),
        ],
      ),
    );
  }

  List<BottomSheetModel> get setDovizBottomSheetList {
    final List<DovizList>? dovizList = CacheManager.getAnaVeri?.paramModel?.dovizList;
    final List<BottomSheetModel> bottomSheetList = [];
    for (final DovizList item in dovizList?.where((element) => element.dovizTipi != 0).toList() ?? []) {
      if (viewModel.observableList?.any((element) => element.dovizTipi != item.dovizTipi) ?? false) {
        bottomSheetList.add(
          BottomSheetModel(
            title: item.isim ?? item.dovizTipi.toStringIfNotNull ?? "",
            iconWidget: Icons.add,
            value: item,
          ),
        );
      }
    }
    return bottomSheetList;
  }
}
