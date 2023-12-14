import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/servis_islemleri/view_model/servis_islemleri_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class ServisIslemleriView extends StatefulWidget {
  const ServisIslemleriView({super.key});

  @override
  State<ServisIslemleriView> createState() => _ServisIslemleriViewState();
}

class _ServisIslemleriViewState extends BaseState<ServisIslemleriView> {
  ServisIslemleriViewModel viewModel = ServisIslemleriViewModel();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Servis İşlemleri"),
        ),
        body: ListView.builder(
          itemCount: viewModel.itemList.length,
          itemBuilder: (context, index) {
            final BottomSheetModel model = viewModel.itemList[index];
            return Card(
              child: ListTile(
                leading: Icon(model.iconWidget),
                title: Text(model.title),
                subtitle: Text(model.description ?? ""),
                onTap: model.onTap,
              ),
            );
          },
        ).paddingAll(UIHelper.lowSize),
      );
}
