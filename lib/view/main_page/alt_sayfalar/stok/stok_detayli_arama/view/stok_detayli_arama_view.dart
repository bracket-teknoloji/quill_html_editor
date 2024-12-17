import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../model/param_model.dart";
import "../view_model/stok_detayli_arama_view_model.dart";

final class StokDetayliAramaView extends StatefulWidget {
  const StokDetayliAramaView({required this.aramaList, super.key});
  final List<StokDetayliAramaAlanlar> aramaList;

  @override
  State<StokDetayliAramaView> createState() => _StokDetayliAramaViewState();
}

final class _StokDetayliAramaViewState extends BaseState<StokDetayliAramaView> {
  final StokDetayliAramaViewModel viewModel = StokDetayliAramaViewModel();
  late final List<TextEditingController> controllerList;

  @override
  void initState() {
    viewModel.setObservableList(
      widget.aramaList.map(
        (e) {
          if (e.searchCriter != null) return e;
          return e..searchCriter = "IC";
        },
      ).toList(),
    );
    controllerList = viewModel.observableList?.map((e) => TextEditingController(text: e.searchText)).toList() ?? [];
    super.initState();
  }

  @override
  void dispose() {
    for (final TextEditingController e in controllerList) {
      e.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Detaylı Arama"),
          actions: [
            IconButton(
              onPressed: () {
                dialogManager.showAreYouSureDialog(() async {
                  Get.back(result: true);
                });
              },
              icon: const Icon(Icons.delete_outline_outlined),
            ),
            IconButton(
              onPressed: () {
                Get.back(result: viewModel.observableList?.where((element) => element.searchText != null).toList());
              },
              icon: const Icon(Icons.check_circle_outline_outlined),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: viewModel.observableList?.length,
          itemBuilder: (context, index) => CustomTextField(
            controller: controllerList[index],
            labelText: viewModel.observableList?[index].name ?? "",
            onChanged: (value) => viewModel.setSearchText(index, value),
            valueWidget: Observer(builder: (_) => Text(viewModel.detaySekliList.firstWhereOrNull((element) => element.kodu == viewModel.observableList?[index].searchCriter)?.adi ?? "")),
            suffix: IconButton(
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Kriter Seçiniz",
                  groupValue: viewModel.observableList?[index].searchCriter,
                  children: viewModel.detaySekliList.map((element) => BottomSheetModel(title: element.adi, value: element, groupValue: element.kodu)).toList(),
                );
                if (result is DetaySekliRecord) {
                  viewModel.setKriter(index, result);
                }
              },
              icon: const Icon(Icons.manage_search_outlined),
            ),
          ),
        ).paddingAll(UIHelper.lowSize),
      );
}
