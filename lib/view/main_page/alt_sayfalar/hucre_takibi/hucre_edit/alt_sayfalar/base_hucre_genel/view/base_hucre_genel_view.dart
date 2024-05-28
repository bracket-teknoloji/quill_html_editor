import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_genel/view_model/base_hucre_genel_view_model.dart";

final class BaseHucreGenelView extends StatefulWidget {
  const BaseHucreGenelView({super.key});

  @override
  State<BaseHucreGenelView> createState() => _BaseHucreGenelViewState();
}

final class _BaseHucreGenelViewState extends State<BaseHucreGenelView> {
  final BaseHucreGenelViewModel viewModel = BaseHucreGenelViewModel();
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Observer(
                builder: (_) => SlideControllerWidget(
                  title: "Belge Tipi",
                  childrenTitleList: viewModel.valueList.map((e) => e.getName).toList(),
                  childrenValueList: viewModel.valueList.map((e) => e.rawValue).toList(),
                  filterOnChanged: viewModel.setSelectedEditTipi,
                  groupValue: viewModel.selectedEditTipi?.rawValue,
                ),
              ),
              CustomTextField(
                labelText: "Depo",
                isMust: true,
                readOnly: true,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Belge",
                isMust: true,
                readOnly: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ).paddingAll(UIHelper.lowSize);
}
