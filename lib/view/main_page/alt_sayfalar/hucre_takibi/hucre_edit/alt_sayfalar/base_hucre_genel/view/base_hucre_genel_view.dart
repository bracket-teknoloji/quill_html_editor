import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_genel/view_model/base_hucre_genel_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

final class BaseHucreGenelView extends StatefulWidget {
  const BaseHucreGenelView({super.key});

  @override
  State<BaseHucreGenelView> createState() => _BaseHucreGenelViewState();
}

final class _BaseHucreGenelViewState extends BaseState<BaseHucreGenelView> {
  final BaseHucreGenelViewModel viewModel = BaseHucreGenelViewModel();
  late final TextEditingController depoController;
  late final TextEditingController belgeController;

  @override
  void initState() {
    viewModel.selectedEditTipi = viewModel.valueList.where((element) => element.rawValue == viewModel.model.belgeTuru).firstOrNull;
    depoController = TextEditingController(text: viewModel.model.depoTanimi);
    belgeController = TextEditingController(text: viewModel.model.belgeNo);
    if (depoList?.length == 1 && viewModel.model.depoKodu == null) {
      viewModel.setDepo(depoList?.firstOrNull);
      depoController.text = depoList?.firstOrNull?.depoTanimi ?? "";
      // viewModel.setDepoKodu(depoList?.firstOrNull?.depoKodu);
    }
    super.initState();
  }

  @override
  void dispose() {
    depoController.dispose();
    belgeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              // Observer(
              //   builder: (_) => SlideControllerWidget(
              //     title: "Belge Tipi",
              //     childrenTitleList: viewModel.valueList.map((e) => e.getName).toList(),
              //     childrenValueList: viewModel.valueList.map((e) => e.rawValue).toList(),
              //     filterOnChanged: viewModel.setSelectedEditTipi,
              //     groupValue: viewModel.selectedEditTipi?.rawValue,
              //   ),
              // ),
              ...List.generate(
                viewModel.valueList.length,
                (index) {
                  final item = viewModel.valueList[index];
                  return Observer(
                    builder: (_) => RadioListTile(
                      value: item.rawValue,
                      title: Text(item.getName),
                      groupValue: viewModel.selectedEditTipi?.rawValue,
                      onChanged: (value) {
                        viewModel.setSelectedEditTipi(viewModel.valueList.indexOf(viewModel.valueList.where((e) => e.rawValue == value).first));
                      },
                    ),
                  );
                },
              ),
              // Flexible(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: viewModel.valueList.length,
              //     itemBuilder: (context, index) {
              //       final item = viewModel.valueList[index];
              //       return Observer(
              //         builder: (_) => RadioListTile(
              //           value: item.rawValue,
              //           title: Text(item.getName),
              //           groupValue: viewModel.selectedEditTipi?.rawValue,
              //           onChanged: (value) {
              //             viewModel.setSelectedEditTipi(viewModel.valueList.indexOf(viewModel.valueList.where((e) => e.rawValue == value).first));
              //           },
              //         ),
              //       );
              //     },
              //   ),
              // ),
              CustomTextField(
                labelText: "Depo",
                isMust: true,
                readOnly: true,
                suffixMore: true,
                controller: depoController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.depoKodu.toStringIfNotNull ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showHucreDepoBottomSheetDialog(context, viewModel.model.depoKodu);
                  if (result != null) {
                    viewModel.setDepo(result);
                    depoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNotNull ?? "";
                  }
                },
              ),
              Observer(
                builder: (_) => CustomTextField(
                  labelText: "Belge",
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  controller: belgeController,
                  onTap: () async {
                    final result = await Get.toNamed("mainPage/belgeRehberi", arguments: viewModel.model.copyWith(pickerBelgeTuru: viewModel.selectedEditTipi?.rawValue, islemTuru: "HY"));
                    if (result is BelgeRehberiModel) {
                      viewModel.setBelge(result);
                      belgeController.text = result.belgeNo ?? "";
                    }
                  },
                ).yetkiVarMi(viewModel.isBelgeVisible),
              ),
            ],
          ),
        ).paddingAll(UIHelper.lowSize),
      );

  List<DepoList>? get depoList => parametreModel.depoList?.where((element) => element.hucreTakibi == "E").toList();
}
