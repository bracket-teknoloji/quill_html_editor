import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/depo_bakiye_durumu_model.dart";
import "../view_model/depo_bakiye_durumu_view_model.dart";

class DepoBakiyeDurumuView extends StatefulWidget {
  final StokListesiModel? model;
  const DepoBakiyeDurumuView({super.key, this.model});

  @override
  State<DepoBakiyeDurumuView> createState() => _DepoBakiyeDurumuViewState();
}

class _DepoBakiyeDurumuViewState extends BaseState<DepoBakiyeDurumuView> {
  final DepoBakiyeDurumuViewModel viewModel = DepoBakiyeDurumuViewModel();

  @override
  void initState() {
    if (widget.model != null) {
      viewModel.setStokKodu(widget.model?.stokKodu);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        bottomNavigationBar: bottomAppBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Depo Bakiye Durumu",
          subtitle: widget.model?.stokAdi,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.options,
                children: [
                  BottomSheetModel(
                    title: "Sıfır Bakiye Hariç",
                    iconWidget: viewModel.dicParams.sifirHaric == "E" ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                    onTap: () async {
                      Get.back();
                      viewModel.setSifirHaric(viewModel.dicParams.sifirHaric != "E");
                      await viewModel.getData();
                    },
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      );

  BottomBarWidget bottomAppBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Giriş"),
              Observer(
                builder: (_) => Text(viewModel.toplamGiris.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Çıkış"),
              Observer(
                builder: (_) => Text(viewModel.toplamCikis.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Bakiye"),
              Observer(
                builder: (_) => Text(viewModel.toplamBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
              ),
            ],
          ),
        ],
      );

  Observer body() => Observer(
        builder: (_) {
          if (viewModel.depoBakiyeDurumuList == null) {
            return const ListViewShimmer();
          } else if (viewModel.depoBakiyeDurumuList?.isEmpty ?? true) {
            return const Center(
              child: Text("Depo Bakiye Durumu Bulunamadı"),
            );
          }
          return ListView.builder(
            itemCount: viewModel.subeAdiList?.length ?? 0,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(viewModel.subeAdiList?[index] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)).paddingSymmetric(horizontal: UIHelper.lowSize),
                ...List.generate(
                  viewModel.depoBakiyeDurumuList?.where((element) => element.subeAdi == viewModel.subeAdiList?[index]).length ?? 0,
                  (index) {
                    final DepoBakiyeDurumuModel? item = viewModel.depoBakiyeDurumuList?[index];
                    return Card(
                      child: ListTile(
                        title: Text("${item?.depoAdi}"),
                        subtitle: Text("Depo Kodu: ${item?.depoKodu}"),
                        trailing: Text("${item?.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      ),
                    );
                  },
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          );
        },
      );
}
