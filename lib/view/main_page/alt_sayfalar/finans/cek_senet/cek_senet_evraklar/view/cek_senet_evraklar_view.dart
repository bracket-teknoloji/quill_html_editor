import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/image/image_view.dart";
import "package:picker/core/components/image/image_widget.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/view_model/cek_senet_evraklar_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";

class CekSenetEvraklarView extends StatefulWidget {
  final CekSenetListesiModel model;
  const CekSenetEvraklarView({super.key, required this.model});

  @override
  State<CekSenetEvraklarView> createState() => _CekSenetEvraklarViewState();
}

class _CekSenetEvraklarViewState extends BaseState<CekSenetEvraklarView> {
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
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {},
        //   child: const Icon(Icons.add_outlined),
        // ),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Evraklar",
          subtitle: widget.model.belgeNo ?? "",
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async => await viewModel.resetPage(),
        child: Observer(
          builder: (_) {
            if (viewModel.evraklarListesi == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (viewModel.evraklarListesi!.isEmpty) {
              return const Center(
                child: Text("Evrak bulunamadı"),
              );
            }
            return ListView.builder(
              padding: UIHelper.lowPadding,
              itemCount: viewModel.evraklarListesi?.length ?? 0,
              itemBuilder: (context, index) {
                final EvraklarModel model = viewModel.evraklarListesi![index];
                return Card(
                  child: ListTile(
                    contentPadding: UIHelper.midPadding,
                    leading: SizedBox(
                      height: UIHelper.highSize * 10,
                      width: UIHelper.highSize * 3,
                      child: ImageWidget(path: model.resimUrlKucuk),
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
        title: "Seçenekler",
        children: [
          BottomSheetModel(
            title: "Görüntüle",
            iconWidget: Icons.preview_outlined,
            onTap: () {
              Get.back();
              return Get.to(ImageView(path: model?.resimUrl));
            },
          ),
          BottomSheetModel(title: "Sil", iconWidget: Icons.delete_outline_outlined),
        ],
      );
}
