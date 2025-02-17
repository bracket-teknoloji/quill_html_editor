import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/depo_ta%C5%9Fep_toplananlar/view_model/depo_talep_toplananlar_view_model.dart";

class DepoTalepToplananlarView extends StatefulWidget {
  const DepoTalepToplananlarView({required this.model, super.key});

  final KalemModel model;

  @override
  State<DepoTalepToplananlarView> createState() => _DepoTalepToplananlarViewState();
}

class _DepoTalepToplananlarViewState extends BaseState<DepoTalepToplananlarView> {
  final DepoTalepToplananlarViewModel viewModel = DepoTalepToplananlarViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model.id case final id?) {
        await viewModel.getKalemler(id);
      } else {
        dialogManager.showAlertDialog("ID bulunamadı");
        Get.back();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body());

  AppBar appBar() => AppBar(
    title: Observer(
      builder:
          (_) => AppBarTitle(title: "Depo Talep Toplananlar", subtitle: viewModel.kalemList?.length.toStringIfNotNull),
    ),
  );

  Observer body() => Observer(
    builder:
        (_) => RefreshableListView(
          onRefresh: () async => await viewModel.getKalemler(widget.model.id!),
          items: viewModel.kalemList,
          itemBuilder:
              (item) => Card(
                child: ListTile(
                  title: Text(item.stokAdi ?? ""),
                  trailing: IconButton(
                    onPressed: () async {
                      dialogManager.showAreYouSureDialog(() async {
                        final result = await viewModel.deleteKalem(item.id!);
                        if (result) {
                          await viewModel.getKalemler(widget.model.id!);
                          if (viewModel.kalemList.ext.isNullOrEmpty) {
                            Get.back(result: result);
                          }
                          dialogManager.showSuccessSnackBar("Silme işlemi başarılı");
                        }
                      });
                    },
                    icon: const Icon(Icons.delete_outline_outlined),
                  ),
                  subtitle: CustomLayoutBuilder.divideInHalf(
                    children: [
                      Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      Text("Kullanıcı: ${item.kayityapankul ?? ""}"),
                      Text("Depo Kodu: ${item.depoKodu ?? ""}"),
                    ],
                  ),
                ),
              ),
        ),
  );
}
