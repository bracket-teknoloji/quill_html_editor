import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/image/evraklar/view_model/evraklar_view_model.dart";
import "package:picker/core/components/image/image_view.dart";
import "package:picker/core/components/image/image_widget.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";

final class EvraklarView extends StatefulWidget {
  final EvraklarRequestModel model;
  const EvraklarView({super.key, required this.model});

  @override
  State<EvraklarView> createState() => _EvraklarViewState();
}

final class _EvraklarViewState extends BaseState<EvraklarView> {
  final EvraklarViewModel viewModel = EvraklarViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await viewModel.getData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          Get.back(result: viewModel.refresh ?? false);
        },
        child: BaseScaffold(
          appBar: appBar(),
          floatingActionButton: fab(),
          body: body(),
        ),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Evraklar",
          subtitle: widget.model.belgeNo,
        ),
      );

  Widget fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: () async {
          final result = await Get.toNamed("/imagePicker", arguments: viewModel.requestModel);
          if (result == true) {
            viewModel.setRefresh(true);
            await viewModel.getData();
          }
        },
      ).yetkiVarMi(yetkiController.stokResimEkle);

  Observer body() => Observer(builder: (_) => RefreshableListView(onRefresh: viewModel.getData, items: viewModel.observableList, itemBuilder: evrakCard));

  Widget evrakCard(EvraklarModel? model) => Card(
        child: ListTile(
          contentPadding: UIHelper.midPadding,
          leading: InkWell(
            onTap: () => Get.to(ImageView(path: model?.resimUrl ?? "", title: model?.aciklama ?? "")),
            child: SizedBox(
              height: UIHelper.highSize * 3,
              width: UIHelper.highSize * 3,
              child: ImageWidget(path: model?.resimUrlKucuk),
            ),
          ),
          title: Text(model?.aciklama ?? ""),
          subtitle: Text(model?.id.toStringIfNotNull ?? ""),
          onTap: () async => await onTap(model),
        ),
      );

  Future<void> onTap(EvraklarModel? model) async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: loc.generalStrings.options,
        children: [
          BottomSheetModel(
            title: loc.generalStrings.view,
            iconWidget: Icons.preview_outlined,
            onTap: () {
              Get.back();
              return Get.to(ImageView(path: model?.resimUrl ?? "", title: model?.aciklama ?? ""));
            },
          ).yetkiKontrol(yetkiController.stokResimGoster),
          BottomSheetModel(
            title: loc.generalStrings.delete,
            iconWidget: Icons.delete_outline_outlined,
            onTap: () async {
              Get.back();
              dialogManager.showAreYouSureDialog(() async {
                final result = await viewModel.deleteEvrak(model!);
                if (result.isSuccess) {
                  dialogManager.showSuccessSnackBar(result.message ?? "Silme işlemi başarılı");
                  await viewModel.getData();
                }
              });
            },
          ).yetkiKontrol(yetkiController.stokResimSil),
        ].nullCheckWithGeneric,
      );
}
