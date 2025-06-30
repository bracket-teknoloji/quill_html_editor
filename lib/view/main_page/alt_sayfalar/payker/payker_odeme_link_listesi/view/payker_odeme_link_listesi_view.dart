import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_link_listesi/view_model/payker_odeme_link_listesi_view_model.dart";
import "package:share_plus/share_plus.dart";

class PaykerOdemeLinkListesiView extends StatefulWidget {
  const PaykerOdemeLinkListesiView({super.key});

  @override
  State<PaykerOdemeLinkListesiView> createState() => _PaykerOdemeLinkListesiViewState();
}

class _PaykerOdemeLinkListesiViewState extends BaseState<PaykerOdemeLinkListesiView> {
  final PaykerOdemeLinkListesiViewModel _viewModel = PaykerOdemeLinkListesiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await _viewModel.checkPermissions();
      // eğer result'ın kayıtTarihi geçtiğimiz 7 günden daha eskiyse, verileri güncelle
      if (result == null) {
        dialogManager.showAlertDialog(
          "Payker Ödeme Listesi verilerine erişim izni verilmedi.",
        );
        Get.back();
        return;
      }
      if (result.paykerModule == null) {
        dialogManager.showAlertDialog(
          "Payker modülü bulunamadı. Lütfen Payker modülünü etkinleştirin.",
        );
        Get.back();
        return;
      }
      if (!(result.paykerModule!.sozlesmeAktif ?? false)) {
        dialogManager.showAlertDialog(
          "Payker modülü sözleşmesi aktif değil. Lütfen sözleşmeyi kontrol edin.",
        );
        Get.back();
        return;
      }
      if (result.kayitTarihi != null && result.kayitTarihi!.isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
        await _viewModel.getData();
      } else {
        return dialogManager.showAlertDialog(
          "Payker Ödeme Listesi verileri güncel değil. Lütfen verileri güncelleyin.",
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: _appBar(),
    floatingActionButton: _fab(),
    body: _body(),
  );

  AppBar _appBar() => AppBar(
    title: Observer(
      builder: (_) {
        if (_viewModel.isSearchBarOpen) {
          return CustomAppBarTextField(
            onChanged: _viewModel.setSearchText,
          );
        }
        return AppBarTitle(title: "Ödeme Linkleri", subtitle: _viewModel.filteredList?.length.toString() ?? "0");
      },
    ),
    actions: [
      IconButton(
        icon: Observer(
          builder: (_) => Icon(_viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
        ),
        onPressed: _viewModel.changeSearchBarStatus,
      ),
    ],
  );

  CustomFloatingActionButton _fab() => CustomFloatingActionButton(
    isScrolledDown: true,
    onPressed: () async {
      final result = await Get.toNamed("/mainPage/paykerLinkEditEkle");
      if (result == true) {
        await _viewModel.getData();
      }
    },
  );

  Observer _body() => Observer(
    builder: (_) => RefreshableListView(
      onRefresh: _viewModel.getData,
      items: _viewModel.filteredList,
      itemBuilder: (item) => Card(
        child: ListTile(
          onTap: () {
            bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: item.unvan ?? "",
              children: [
                BottomSheetModel(
                  title: loc.generalStrings.edit,
                  iconWidget: Icons.edit_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed("/mainPage/paykerLinkEditDuzenle", arguments: item.editModel);
                    if (result == true) await _viewModel.getData();
                  },
                ),
                BottomSheetModel(
                  title: loc.generalStrings.delete,
                  iconWidget: Icons.delete_outline_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showAreYouSureDialog(
                      onYes: () async {
                        final result = await _viewModel.deleteLink(item.guid ?? "");
                        if (result) {
                          dialogManager.showSuccessSnackBar(
                            "Link başarıyla silindi.",
                          );
                        }
                      },
                    );
                  },
                ),
                BottomSheetModel(
                  title: "Paylaş",
                  iconWidget: Icons.adaptive.share_outlined,
                  onTap: () async {
                    Get.back();
                    await Share.shareUri(Uri.parse(item.url ?? ""));
                  },
                ),
                BottomSheetModel(
                  title: "QR oluştur",
                  iconWidget: Icons.qr_code,
                  onTap: () async {
                    Get.back();
                    final result = await networkManager.getPaykerPaymentLinkQrCode(item.guid ?? "");
                    if (result != null) {
                      Get.to(
                        () => Scaffold(
                          appBar: AppBar(
                            title: Text(item.unvan ?? "QR Kodu"),
                          ),
                          body: Center(
                            child: Image.memory(
                              result,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            );
          },
          title: Text(
            "${item.id.toStringIfNotNull ?? "(ID bulunamadı)"} - ${item.unvan ?? "(Unvan bulunamadı)"}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: UIHelper.lowSize),
                child: Row(
                  children: [
                    ColorfulBadge(
                      label: Text(item.alindiMi ? "Alındı" : "Alınmadı"),
                      badgeColorEnum: item.alindiMi ? BadgeColorEnum.basarili : BadgeColorEnum.hata,
                    ),
                  ],
                ),
              ),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  if (item.bayiId case final value?) Text("Bayi ID: $value"),
                  if (item.tutar case final value?)
                    Text("Tutar: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                  if (item.bittar case final value?) Text("Bitiş Tarihi: ${value.toDateString}"),
                  if (item.kullanimSayisi case final value?) Text("Kullanım Sayısı: $value"),
                ],
              ),

              if (item.email case final value?) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: UIHelper.lowSize),
                  child: Divider(endIndent: 0, indent: 0),
                ),
                Text("E-mail: $value"),
              ],
            ],
          ),
          trailing: Icon(Icons.adaptive.more_outlined),
        ),
      ),
    ),
  );
}
