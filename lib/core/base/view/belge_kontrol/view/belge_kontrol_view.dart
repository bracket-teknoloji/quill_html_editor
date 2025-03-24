import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/belge_kontrol/view_model/belge_kontrol_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

final class BelgeKontrolView extends StatefulWidget {
  const BelgeKontrolView({super.key});

  @override
  State<BelgeKontrolView> createState() => _BelgeKontrolViewState();
}

final class _BelgeKontrolViewState extends BaseState<BelgeKontrolView> {
  final BelgeKontrolViewModel viewModel = BelgeKontrolViewModel();
  late final TextEditingController _searchController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: _appBar(), floatingActionButton: _fab(), body: _body());

  AppBar _appBar() => AppBar(
    title: Observer(
      builder:
          (_) =>
              viewModel.isSearchBarOpen
                  ? CustomAppBarTextField(onChanged: viewModel.setSearchText)
                  : AppBarTitle(title: "Belge Kontrol", subtitle: "${viewModel.filteredList?.length ?? 0}"),
    ),
    actions: [
      IconButton(
        icon: Observer(
          builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
        ),
        onPressed: viewModel.changeSearchBarStatus,
      ),
    ],
  );

  Widget _fab() => CustomFloatingActionButton(
    isScrolledDown: yetkiController.genelBelgeKontrolEkle,
    onPressed: () async {
      if (await Get.toNamed("/mainPage/belgeEkle") == true) {
        await viewModel.resetList();
      }
    },
  );

  Column _body() => Column(
    children: [
      RaporFiltreDateTimeBottomSheetView(
        filterOnChanged: (value) async {
          viewModel
            ..setBaslangicTarihi(baslangicTarihiController.text)
            ..setBitisTarihi(bitisTarihiController.text)
            ..getData();
        },
        baslangicTarihiController: baslangicTarihiController,
        bitisTarihiController: bitisTarihiController,
      ),
      CustomWidgetWithLabel(
        text: "Tamamlanma Durumu",
        child: Observer(
          builder:
              (_) => SlideControllerWidget(
                childrenTitleList: ["Tümü", "Kalan", "Tamamlanan"],
                filterOnChanged: (index) {
                  viewModel
                    ..setFilterValue(["T", "K", "B"][index ?? 0])
                    ..resetList();
                },
                childrenValueList: ["T", "K", "B"],
                groupValue: viewModel.requestModel.durum,
              ),
        ),
      ),
      Expanded(
        child: Observer(
          builder:
              (_) => RefreshableListView(
                onRefresh: () async => viewModel.resetList(),
                items: viewModel.filteredList,
                itemBuilder:
                    (item) => Card(
                      color: (item.isTamamlandi
                              ? ColorPalette.mantis
                              : item.isDevamEdiyor
                              ? ColorPalette.gamboge
                              : null)
                          ?.withValues(alpha: 0.3),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.belgeNo ?? ""),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.belgeTarihi?.toDateString ?? ""),
                                IconButton(
                                  icon: const Icon(Icons.more_vert_outlined),
                                  onPressed: () async {
                                    bottomSheetDialogManager.showBottomSheetDialog(
                                      context,
                                      title: loc.generalStrings.options,
                                      children: [
                                        if (yetkiController.genelBelgeKontrolSil)
                                          BottomSheetModel(
                                            title: loc.generalStrings.delete,
                                            iconWidget: Icons.delete_outline_outlined,
                                            onTap: () {
                                              if (item.id case final id?) {
                                                Get.back();
                                                dialogManager.showAreYouSureDialog(
                                                  onYes: () async {
                                                    final result = await viewModel.deletekontrol(id);
                                                    if (result.isSuccess) {
                                                      dialogManager.showSuccessSnackBar(
                                                        result.message ?? "Başarıyla silindi",
                                                      );
                                                      await viewModel.resetList();
                                                    }
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.belgeTipiAciklama ?? ""),
                            if (item.cariAdi case final value?)
                              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                            CustomLayoutBuilder.divideInHalf(
                              children: [
                                Text("Kullanıcı: ${item.kayityapankul ?? ""}"),
                                Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                                Text(
                                  "Kont. Miktar: ${item.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                                ),
                                Text(
                                  "Kalan Miktar: ${item.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                                ),
                              ],
                            ),
                            LinearProgressIndicator(
                              value: (item.tamamlananMiktar ?? 0) / (item.miktar ?? 1),
                            ).paddingOnly(top: UIHelper.lowSize),
                            // Text(item.tedarikciKodu ?? ""),
                          ],
                        ),
                        onTap: () async {
                          await Get.toNamed("/mainPage/belgeKalemler", arguments: item);
                          viewModel.resetList();
                        },
                      ),
                    ),
              ),
        ),
      ),
    ],
  );
}
