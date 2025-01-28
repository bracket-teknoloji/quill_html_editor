import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/depo_mal_toplama_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_listesi/view_model/transfer_mal_talebi_listesi_view_model.dart";

final class TransferMalTalebiListesiView extends StatefulWidget {
  const TransferMalTalebiListesiView({super.key});

  @override
  State<TransferMalTalebiListesiView> createState() => _TransferMalTalebiListesiViewState();
}

final class _TransferMalTalebiListesiViewState extends BaseState<TransferMalTalebiListesiView> {
  final TransferMalTalebiListesiViewModel viewModel = TransferMalTalebiListesiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpen) {
              return CustomAppBarTextField(
                onChanged: viewModel.setSearchText,
              );
            }
            return const AppBarTitle(title: "Transfer Mal Talebi Listesi");
          },
        ),
        actions: [
          IconButton(
            icon: Observer(
              builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
            ),
            onPressed: () async {
              if (viewModel.isSearchBarOpen) {
                await viewModel.resetList();
              }
              viewModel.changeSearchBarStatus();
            },
          ),
        ],
      );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: () async {
          final result = await Get.toNamed("mainPage/transferMalTalebiEdit", arguments: BaseEditModel<BaseSiparisEditModel>(baseEditEnum: BaseEditEnum.ekle));
          if (result == true) {
            await viewModel.resetList();
          }
        },
      );

  Widget body() => Column(
        children: [
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: DepoMalToplamaEnum.values.map((e) => e.durumAdi).toList(),
              filterOnChanged: (index) => viewModel.setSelectedDepoMalToplamaEnum(DepoMalToplamaEnum.values[index!]),
              childrenValueList: DepoMalToplamaEnum.values,
              groupValue: viewModel.selectedDepoMalToplamaEnum,
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => RefreshableListView(
                onRefresh: viewModel.resetList,
                items: viewModel.filteredObservableList,
                itemBuilder: _malToplamaCard,
              ),
            ),
          ),
        ],
      );

  Card _malToplamaCard(BaseSiparisEditModel item) => Card(
        color: item.isTamamlandi || item.isKapali ? ColorPalette.mantis.withValues(alpha: 0.5) : null,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("#${item.id}", style: const TextStyle(fontWeight: FontWeight.bold)).paddingOnly(right: UIHelper.lowSize),
                  ColorfulBadge(label: Text(item.durumAdi ?? ""), badgeColorEnum: item.isTamamlandi || item.isKapali ? BadgeColorEnum.basarili : BadgeColorEnum.kapali),
                ],
              ),
              if (item.tarih != null) Text(item.tarih.toDateString),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.belgeNo != null) Text("İş Emri: ${item.belgeNo}"),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  // Text("Karşı Şube: ${item.kars}"),
                  Text("Karşı Şube: ${item.hedefSube ?? 0}"),
                  if (item.kalemSayisi != null) Text("Kalem Adedi: ${item.kalemSayisi}"),
                  if (item.miktar != null) Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  if (item.tamamlananMiktar != null) Text("Tamamlanan Miktar: ${item.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  if (item.kalanMiktar != null) Text("Kalan Miktar: ${item.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                ],
              ),
              if (item.kayityapankul != null) Text("Kaydeden: ${item.kayityapankul}"),
              if (item.aciklama != null) Text("Açıklama: ${item.aciklama}"),
            ],
          ),
          onTap: () async {
            bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: loc.generalStrings.options,
              children: [
                BottomSheetModel(
                  title: loc.generalStrings.view,
                  iconWidget: Icons.preview_outlined,
                  onTap: () async {
                    Get
                      ..back()
                      ..toNamed("mainPage/transferMalTalebiEdit", arguments: BaseEditModel<BaseSiparisEditModel>(baseEditEnum: BaseEditEnum.goruntule, model: item));
                  },
                ),
                BottomSheetModel(
                  title: loc.generalStrings.edit,
                  iconWidget: Icons.edit_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed("mainPage/transferMalTalebiEdit", arguments: BaseEditModel<BaseSiparisEditModel>(baseEditEnum: BaseEditEnum.duzenle, model: item));
                    if (result == true) {
                      await viewModel.resetList();
                    }
                  },
                ),
                BottomSheetModel(
                  title: loc.generalStrings.delete,
                  iconWidget: Icons.delete_outline,
                  onTap: () async {
                    if (item.id == null) {
                      dialogManager.showErrorSnackBar("ID bulunamadı.");
                      return;
                    }
                    Get.back();
                    dialogManager.showAreYouSureDialog(() async {
                      final result = await viewModel.deleteMalTalebi(item.id!);
                      if (result) {
                        dialogManager.showSuccessSnackBar("${item.id} numaralı kayıt Silindi");
                        await viewModel.resetList();
                      }
                    });
                  },
                ),
                if (item.isKapali)
                  BottomSheetModel(
                    title: "Talebi Aç",
                    iconWidget: Icons.refresh_outlined,
                    onTap: () async {
                      if (item.id == null) {
                        dialogManager.showErrorSnackBar("ID bulunamadı.");
                        return;
                      }
                      Get.back();
                      dialogManager.showAreYouSureDialog(() async {
                        final result = await viewModel.talebiAc(item.id!);
                        if (result) {
                          dialogManager.showSuccessSnackBar("${item.id} numaralı talep açıldı");
                          await viewModel.resetList();
                        }
                      });
                    },
                  ),
                if (!item.isKapali)
                  BottomSheetModel(
                    title: "Talebi Kapat",
                    iconWidget: Icons.close_outlined,
                    onTap: () async {
                      if (item.id == null) {
                        dialogManager.showErrorSnackBar("ID bulunamadı.");
                        return;
                      }
                      Get.back();
                      dialogManager.showAreYouSureDialog(() async {
                        final result = await viewModel.talebiKapat(item.id!);
                        if (result) {
                          dialogManager.showSuccessSnackBar("${item.id} numaralı talep kapatıldı");
                          await viewModel.resetList();
                        }
                      });
                    },
                  ),
              ],
            );
          },
        ),
      );
}
