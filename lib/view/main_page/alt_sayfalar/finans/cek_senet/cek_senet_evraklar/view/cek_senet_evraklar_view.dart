import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/image/image_view.dart";
import "../../../../../../../core/components/image/image_widget.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../cek_senet_evrak_ekle/view/cek_senet_evrak_ekle_view.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../model/evraklar_model.dart";
import "../model/evraklar_request_model.dart";
import "../view_model/cek_senet_evraklar_view_model.dart";

final class CekSenetEvraklarView extends StatefulWidget {
  const CekSenetEvraklarView({required this.model, super.key});
  final CekSenetListesiModel model;

  @override
  State<CekSenetEvraklarView> createState() => _CekSenetEvraklarViewState();
}

final class _CekSenetEvraklarViewState extends BaseState<CekSenetEvraklarView> {
  late final CekSenetEvraklarViewModel viewModel;

  @override
  void initState() {
    viewModel = CekSenetEvraklarViewModel(requestModel: EvraklarRequestModel.fromCekSenetListesiModel(widget.model));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: appBar(),
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        final result = await Get.to(CekSenetEvrakEkleView(model: widget.model));
        if (result is bool) {
          await viewModel.resetPage();
        }
      },
      child: const Icon(Icons.add_outlined),
    ),
    body: body(),
  );

  AppBar appBar() => AppBar(title: AppBarTitle(title: "Evraklar", subtitle: widget.model.belgeNo ?? ""));

  RefreshIndicator body() => RefreshIndicator.adaptive(
    onRefresh: () async => await viewModel.resetPage(),
    child: Observer(
      builder: (_) {
        if (viewModel.evraklarListesi == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (viewModel.evraklarListesi!.isEmpty) {
          return const Center(child: Text("Evrak bulunamadı"));
        }
        return ListView.builder(
          padding: UIHelper.lowPadding,
          itemCount: viewModel.evraklarListesi?.length ?? 0,
          itemBuilder: (context, index) {
            final EvraklarModel model = viewModel.evraklarListesi![index];
            return Card(
              child: ListTile(
                contentPadding: UIHelper.midPadding,
                leading: InkWell(
                  onTap: () => Get.to(ImageView(path: model.resimUrl ?? "", title: model.aciklama ?? "")),
                  child: SizedBox(
                    height: UIHelper.highSize * 3,
                    width: UIHelper.highSize * 3,
                    child: ImageWidget(path: model.resimUrlKucuk),
                  ),
                ),
                title: Text(model.aciklama ?? ""),
                onTap: () async => await onTap(model),
              ),
            );
          },
        );
      },
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
      ),
      BottomSheetModel(
        title: loc.generalStrings.delete,
        iconWidget: Icons.delete_outline_outlined,
        onTap: () async {
          Get.back();
          dialogManager.showAreYouSureDialog(
            onYes: () async {
              final result = await viewModel.deleteEvrak(model!);
              if (result.isSuccess) {
                dialogManager.showSuccessSnackBar(result.message ?? "Silme işlemi başarılı");
                await viewModel.resetPage();
              }
            },
          );
        },
      ),
    ],
  );
}
