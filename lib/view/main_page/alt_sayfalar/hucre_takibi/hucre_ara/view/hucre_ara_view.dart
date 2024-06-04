import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/card/hucre_ara_card.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_ara/view_model/hucre_ara_view_model.dart";

final class HucreAraView extends StatefulWidget {
  const HucreAraView({super.key});

  @override
  State<HucreAraView> createState() => _HucreAraViewState();
}

final class _HucreAraViewState extends BaseState<HucreAraView> {
  late final TextEditingController barkodController;
  final HucreAraViewModel viewModel = HucreAraViewModel();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    barkodController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    barkodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Hücre Ara",
              subtitle: viewModel.stokList?.length.toStringIfNotNull,
            ),
          ),
        ),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Hücre/Stok giriniz.",
              controller: barkodController,
              onChanged: viewModel.setBarkod,
              focusNode: focusNode,
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      final result = await Get.toNamed("/qr");
                      if (result != null) {
                        barkodController.text = result ?? "";
                        final stok = await networkManager.getStokModel(
                          StokRehberiRequestModel(
                            menuKodu: "STOK_FGOR",
                            stokKodu: barkodController.text,
                          ),
                        );
                        await setStok(stok);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz_outlined),
                    onPressed: () async {
                      final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                      if (result is BaseStokMixin) {
                        await setStok(result);
                      }
                    },
                  ),
                ],
              ),
              onSubmitted: (value) => viewModel.getData(),
            ),
            Expanded(
              child: Observer(
                builder: (_) => RefreshableListView(
                  onRefresh: viewModel.getData,
                  items: viewModel.stokList,
                  itemBuilder: (item) => HucreAraCard(model: item),
                ),
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> setStok(BaseStokMixin? stok) async {
    viewModel.setBarkod(stok?.stokKodu);
    barkodController.text = stok?.stokKodu ?? "";
    await viewModel.getData();
  }
}
