import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../components/card/siparis_rehberi_card.dart";
import "../../../../components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../components/shimmer/list_view_shimmer.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/siparis_rehberi_view_model.dart";

class SiparisRehberiView extends StatefulWidget {
  final BaseSiparisEditModel model;
  const SiparisRehberiView({super.key, required this.model});

  @override
  State<SiparisRehberiView> createState() => _SiparisRehberiViewState();
}

class _SiparisRehberiViewState extends BaseState<SiparisRehberiView> {
  final SiparisRehberiViewModel viewModel = SiparisRehberiViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController _baslangicTarihiController;
  late final TextEditingController _bitisTarihiController;

  @override
  void initState() {
    viewModel.setRequestModel(widget.model);
    _baslangicTarihiController = TextEditingController();
    _bitisTarihiController = TextEditingController();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _baslangicTarihiController.dispose();
    _bitisTarihiController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Sipariş Rehberi",
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
            IconButton(
              onPressed: () async {
                if (viewModel.selectedSiparisList.isEmpty) {
                  dialogManager.showErrorSnackBar("Lütfen en az bir sipariş seçiniz");
                } else {
                  Get.back(result: viewModel.selectedSiparisList);
                }
              },
              icon: const Icon(Icons.check_circle, color: UIHelper.primaryColor),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ],
        ),
        body: Column(
          children: [
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (index) async {
                viewModel.setBaslangicTarihi(_baslangicTarihiController.text);
                viewModel.setBitisTarihi(_bitisTarihiController.text);
                await viewModel.resetPage();
              },
              baslangicTarihiController: _baslangicTarihiController,
              bitisTarihiController: _bitisTarihiController,
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: viewModel.resetPage,
                child: Observer(
                  builder: (_) {
                    if (viewModel.siparisList == null) {
                      return const ListViewShimmer();
                    }
                    if (viewModel.siparisList!.isEmpty) {
                      return const Center(child: Text("Sipariş bulunamadı"));
                    }
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: viewModel.siparisList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final BaseSiparisEditModel model = viewModel.siparisList![index];
                        return Observer(
                          builder: (_) => SiparisRehberiCard(
                            model: model,
                            editTipiEnum: EditTipiEnum.musteri,
                            value: viewModel.selectedSiparisList.any((element) => element.belgeNo == model.belgeNo),
                            onTap: () {
                              if (viewModel.selectedSiparisList.any((element) => element.belgeNo == model.belgeNo)) {
                                viewModel.removeSelectedSiparis(model);
                              } else {
                                if (viewModel.selectedSiparisList.any((element) => element.cariKodu != model.cariKodu)) {
                                  dialogManager.showErrorSnackBar("Aynı cariye ait olmayan siparişler seçilemez");
                                } else {
                                  viewModel.addSelectedSiparis(model);
                                }
                              }
                            },
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
      );
}
