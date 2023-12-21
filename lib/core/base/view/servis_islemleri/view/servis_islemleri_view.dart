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
          title: Text(loc(context).serviceOperations.serviceOperationsTitle),
        ),
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            final BottomSheetModel model = itemList[index];
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

  List<BottomSheetModel> get itemList => [
        BottomSheetModel(
          title: loc(context).serviceOperations.isWebServicesWorking,
          description: loc(context).serviceOperations.isWebServicesWorkingSubtitle,
          iconWidget: Icons.travel_explore_outlined,
          onTap: viewModel.webServisleriCalistir,
        ),
        BottomSheetModel(
          title: loc(context).serviceOperations.updateService,
          description: loc(context).serviceOperations.updateServiceSubtitle,
          iconWidget: Icons.sync_alt_outlined,
        ),
        // BottomSheetModel(
        //   title: "Web Servisi Yeniden Başlat",
        //   description: "Web servisini yeniden başlatmak için kullanılır.",
        //   iconWidget: Icons.restart_alt_outlined,
        // ),
        BottomSheetModel(
          title: loc(context).serviceOperations.dbUpdate,
          description: loc(context).serviceOperations.dbUpdateSubtitle,
          iconWidget: Icons.cloud_upload_outlined,
          onTap: viewModel.dbUpdate,
        ),
      ];
}
