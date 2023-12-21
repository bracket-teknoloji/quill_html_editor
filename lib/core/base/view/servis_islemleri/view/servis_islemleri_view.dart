import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/servis_islemleri/view_model/servis_islemleri_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/generated/locale_base.dart";

class ServisIslemleriView extends StatefulWidget {
  const ServisIslemleriView({super.key});

  @override
  State<ServisIslemleriView> createState() => _ServisIslemleriViewState();
}

class _ServisIslemleriViewState extends BaseState<ServisIslemleriView> {
  ServisIslemleriViewModel viewModel = ServisIslemleriViewModel();


  LocaleBase get getLoc => loc(context);
  
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(getLoc.serviceOperations.serviceOperationsTitle),
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
          title: getLoc.serviceOperations.isWebServicesWorking,
          description: getLoc.serviceOperations.isWebServicesWorkingSubtitle,
          iconWidget: Icons.travel_explore_outlined,
          onTap: viewModel.webServisleriCalistir,
        ),
        // BottomSheetModel(
        //   title: getLoc.serviceOperations.updateService,
        //   description: getLoc.serviceOperations.updateServiceSubtitle,
        //   iconWidget: Icons.sync_alt_outlined,
        // ),
        // BottomSheetModel(
        //   title: "Web Servisi Yeniden Başlat",
        //   description: "Web servisini yeniden başlatmak için kullanılır.",
        //   iconWidget: Icons.restart_alt_outlined,
        // ),
        BottomSheetModel(
          title: getLoc.serviceOperations.dbUpdate,
          description: getLoc.serviceOperations.dbUpdateSubtitle,
          iconWidget: Icons.cloud_upload_outlined,
          onTap: viewModel.dbUpdate,
        ),
        BottomSheetModel(
          title: getLoc.serviceOperations.netOpenXCreateKernel,
          description: getLoc.serviceOperations.netOpenXCreateKernelSubTitle,
          iconWidget: Icons.bookmark_add_outlined,
          onTap: viewModel.netOpenXCreateKernel,
        ),
        BottomSheetModel(
          title: getLoc.serviceOperations.netOpenXKernelStatus,
          description: getLoc.serviceOperations.netOpenXKernelStatusSubTitle,
          iconWidget: Icons.broadcast_on_personal_outlined,
          onTap: viewModel.netOpenXStatus,
        ),
        BottomSheetModel(
          title: getLoc.serviceOperations.eFaturaDLLKayitla,
          description: getLoc.serviceOperations.eFaturaDLLKayitlaSubTitle,
          iconWidget: Icons.podcasts_outlined,
          onTap: viewModel.eFaturaDLLKayitla,
        ),
        BottomSheetModel(
          title: getLoc.serviceOperations.netfectWinServiceRestart,
          description: getLoc.serviceOperations.netfectWinServiceRestartSubTitle,
          iconWidget: Icons.restart_alt_outlined,
          onTap: viewModel.netFectWinServiceRestart,
        ),
      ];

}
