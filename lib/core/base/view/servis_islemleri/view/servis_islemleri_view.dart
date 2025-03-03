import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../view/add_company/model/account_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/servis_islemleri_view_model.dart";

final class ServisIslemleriView extends StatefulWidget {
  const ServisIslemleriView({super.key});

  @override
  State<ServisIslemleriView> createState() => _ServisIslemleriViewState();
}

final class _ServisIslemleriViewState extends BaseState<ServisIslemleriView> {
  ServisIslemleriViewModel viewModel = ServisIslemleriViewModel();

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body().paddingAll(UIHelper.lowSize));

  AppBar appBar() => AppBar(title: AppBarTitle(title: loc.serviceOperations.serviceOperationsTitle));

  ListView body() => ListView.builder(
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
  );

  List<BottomSheetModel> get itemList => [
    BottomSheetModel(
      title: loc.serviceOperations.isWebServicesWorking,
      description: loc.serviceOperations.isWebServicesWorkingSubtitle,
      iconWidget: Icons.travel_explore_outlined,
      onTap: viewModel.webServisleriCalistir,
    ),
    // BottomSheetModel(
    //   title: loc.serviceOperations.updateService,
    //   description: loc.serviceOperations.updateServiceSubtitle,
    //   iconWidget: Icons.sync_alt_outlined,
    // ),
    // BottomSheetModel(
    //   title: "Web Servisi Yeniden Başlat",
    //   description: "Web servisini yeniden başlatmak için kullanılır.",
    //   iconWidget: Icons.restart_alt_outlined,
    // ),
    BottomSheetModel(
      title: loc.serviceOperations.dbUpdate,
      description: loc.serviceOperations.dbUpdateSubtitle,
      iconWidget: Icons.cloud_upload_outlined,
      onTap: viewModel.dbUpdate,
    ),
    BottomSheetModel(
      title: loc.serviceOperations.netOpenXCreateKernel,
      description: loc.serviceOperations.netOpenXCreateKernelSubTitle,
      iconWidget: Icons.bookmark_add_outlined,
      onTap: viewModel.netOpenXCreateKernel,
    ),
    BottomSheetModel(
      title: loc.serviceOperations.netOpenXKernelStatus,
      description: loc.serviceOperations.netOpenXKernelStatusSubTitle,
      iconWidget: Icons.broadcast_on_personal_outlined,
      onTap: viewModel.netOpenXStatus,
    ),
    BottomSheetModel(
      title: loc.serviceOperations.eFaturaDLLKayitla,
      description: loc.serviceOperations.eFaturaDLLKayitlaSubTitle,
      iconWidget: Icons.podcasts_outlined,
      onTap: viewModel.eFaturaDLLKayitla,
    ),
    if (!AccountModel.instance.demoMu)
      BottomSheetModel(
        title: loc.serviceOperations.netfectWinServiceRestart,
        description: loc.serviceOperations.netfectWinServiceRestartSubTitle,
        iconWidget: Icons.restart_alt_outlined,
        onTap: viewModel.netFectWinServiceRestart,
      ),
  ];
}
