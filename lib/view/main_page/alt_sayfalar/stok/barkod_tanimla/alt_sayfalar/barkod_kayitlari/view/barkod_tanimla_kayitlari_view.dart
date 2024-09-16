import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../model/barkod_tanimla_kayitlari_model.dart";
import "../view_model/barkod_tanimla_kayitlari_view_model.dart";

final class BarkodTanimlaKayitlariView extends StatefulWidget {
  final StokListesiModel? model;
  const BarkodTanimlaKayitlariView({super.key, this.model});

  @override
  State<BarkodTanimlaKayitlariView> createState() => _BarkodTanimlaKayitlariViewState();
}

final class _BarkodTanimlaKayitlariViewState extends BaseState<BarkodTanimlaKayitlariView> {
  final BarkodTanimlaKayitlariViewModel viewModel = BarkodTanimlaKayitlariViewModel();

  @override
  void initState() {
    viewModel.setStokKodu(widget.model?.stokKodu);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model != null) {
        await viewModel.getData();
      } else {
        viewModel.setBarkodTanimlaKayitlari([]);
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BarkodTanimlaKayitlariView oldWidget) {
    if (oldWidget.model?.stokKodu != widget.model?.stokKodu) {
      viewModel.setStokKodu(widget.model?.stokKodu);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await viewModel.getData();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        floatingActionButton: CustomFloatingActionButton(
          isScrolledDown: true,
          onPressed: () async {
            if (widget.model != null) {
              final result = await Get.toNamed("mainPage/barkodEdit", arguments: widget.model);
              if (result == true) {
                await viewModel.getData();
              }
            } else {
              await dialogManager.showAlertDialog("Stok kartı seçilmedi.");
            }
          },
        ).yetkiVarMi(yetkiController.stokBarkodEkle),
        body: Observer(
          builder: (_) => RefreshableListView<BarkodTanimlaKayitlariModel>(
            onRefresh: viewModel.getData,
            items: viewModel.barkodTanimlaKayitlari,
            itemBuilder: (item) => Card(
              child: ListTile(
                onTap: () async {
                  bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: item.barkod ?? "",
                    children: [
                      BottomSheetModel(
                        title: loc.generalStrings.delete,
                        iconWidget: Icons.delete_outline_outlined,
                        onTap: () {
                          Get.back();
                          dialogManager.showAreYouSureDialog(() async {
                            final result = await viewModel.deleteItem(item);
                            if (result) {
                              dialogManager.showSuccessSnackBar("${item.barkod} barkodlu kayıt başarıyla silindi.");
                              await viewModel.getData();
                            }
                          });
                        },
                      ).yetkiKontrol(yetkiController.stokBarkodSil),
                    ].nullCheckWithGeneric,
                  );
                },
                title: Text("Barkod: ${item.barkod}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Birim: ${item.birimAdi}"),
                        Text("Tipi: ${item.barkodTipi}-${item.barkodTipiAdi}"),
                      ],
                    ),
                    Text("Açıklama: ${item.aciklama}").yetkiVarMi(item.aciklama != null),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
