import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "../../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "../../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../components/bottom_bar/bottom_bar.dart";
import "../../../../../components/button/elevated_buttons/footer_button.dart";
import "../../../../../components/layout/custom_layout_builder.dart";
import "../../../../../components/shimmer/list_view_shimmer.dart";
import "../../../../../components/slide_controller/view/slide_controller_view.dart";
import "../../../../../components/textfield/custom_text_field.dart";
import "../../../../../components/wrap/appbar_title.dart";
import "../../../../../constants/extensions/iterable_extensions.dart";
import "../../../../../constants/extensions/number_extensions.dart";
import "../../../../../constants/extensions/widget_extensions.dart";
import "../../../../../constants/ui_helper/ui_helper.dart";
import "../../../../state/base_state.dart";
import "../view_model/seri_bakiyeleri_view_model.dart";

class SeriBakiyeleriView extends StatefulWidget {
  final StokListesiModel stokModel;
  const SeriBakiyeleriView({super.key, required this.stokModel});

  @override
  State<SeriBakiyeleriView> createState() => _SeriBakiyeleriViewState();
}

class _SeriBakiyeleriViewState extends BaseState<SeriBakiyeleriView> {
  final SeriBakiyeleriViewModel viewModel = SeriBakiyeleriViewModel();
  late final TextEditingController stokKoduController;

  @override
  void initState() {
    viewModel.setStokKodu(widget.stokModel.stokKodu ?? "");
    stokKoduController = TextEditingController(text: viewModel.requestModel.stokKodu ?? "");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    stokKoduController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Seri Bakiyeleri",
              subtitle: (viewModel.seriList?.length ?? 0).toStringIfNotNull,
            ),
          ),
        ),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Stok",
              controller: stokKoduController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {
                final result = await Get.toNamed("/mainPage/stokListesiOzel", arguments: StokBottomSheetModel(seriTakibiVar: "E"));
                if (result is StokListesiModel) {
                  stokKoduController.text = result.stokKodu ?? "";
                  viewModel.setStokKodu(result.stokKodu ?? "");
                  await viewModel.getData();
                }
              },
              suffix: IconButton(
                onPressed: () async {
                  final result = await Get.toNamed("/qr");
                  if (result is String) {
                    stokKoduController.text = result;
                    viewModel.setStokKodu(result);
                    await viewModel.getData();
                  }
                },
                icon: const Icon(Icons.qr_code_scanner),
              ),
            ),
            Observer(
              builder: (_) => SlideControllerWidget(
                groupValue: viewModel.requestModel.bakiyeDurumu,
                childrenTitleList: viewModel.bakiyeDurumuMap.keys.toList(),
                childrenValueList: viewModel.bakiyeDurumuMap.values.toList(),
                filterOnChanged: (index) async {
                  viewModel.setBakiyeDurumu(viewModel.bakiyeDurumuMap.values.toList()[index ?? 0]);
                  await viewModel.getData();
                },
              ),
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: viewModel.getData,
                child: Observer(
                  builder: (_) {
                    if (viewModel.seriList == null) {
                      return const ListViewShimmer();
                    } else if (viewModel.seriList.ext.isNullOrEmpty) {
                      return const Center(
                        child: Text("Seri Bakiyeleri Bulunmamaktadır"),
                      );
                    }
                    return ListView.builder(
                      primary: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: viewModel.seriList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final SeriList seriModel = viewModel.seriList![index];
                        return Card(
                          color: UIHelper.getColorWithValue(seriModel.miktar ?? 0).withOpacity(0.5),
                          child: ListTile(
                            title: Text(seriModel.seriNo ?? ""),
                            subtitle: CustomLayoutBuilder(
                              splitCount: 2,
                              children: [
                                Text("Seri 1: ${seriModel.seri1}").yetkiVarMi(seriModel.seri1 != null),
                                Text("Seri 2: ${seriModel.seri2}").yetkiVarMi(seriModel.seri2 != null),
                                Text("Depo: ${seriModel.depoTanimi}").yetkiVarMi(seriModel.depoTanimi != null),
                                Text("Hücre: ${seriModel.hucreKodu}").yetkiVarMi(seriModel.hucreKodu != null),
                                Text("Miktar: ${seriModel.miktar.toIntIfDouble}").yetkiVarMi(seriModel.miktar != null),
                              ].where((element) => element is! SizedBox).toList(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
        bottomNavigationBar: BottomBarWidget(
          isScrolledDown: true,
          children: [
            FooterButton(
              children: [
                Observer(
                  builder: (_) => Text("Toplam Miktar: ${viewModel.seriList?.map((element) => element.miktar ?? 0).sum.toIntIfDouble ?? 0}"),
                ),
              ],
            ),
          ],
        ),
      );
}
