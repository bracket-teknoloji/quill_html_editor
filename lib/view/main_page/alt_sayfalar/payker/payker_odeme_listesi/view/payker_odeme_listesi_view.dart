import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_pdf_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/payker_odeme_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/view_model/payker_odeme_listesi_view_model.dart";

class PaykerOdemeListesiView extends StatefulWidget {
  const PaykerOdemeListesiView({super.key, this.isGetData = false});
  final bool isGetData;

  @override
  State<PaykerOdemeListesiView> createState() => _PaykerOdemeListesiViewState();
}

class _PaykerOdemeListesiViewState extends BaseState<PaykerOdemeListesiView> {
  final PaykerOdemeListesiViewModel _viewModel = PaykerOdemeListesiViewModel();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() async {
      _viewModel.changeScrollStatus(_scrollController.position);
    });
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
      if (result.kayitTarihi != null && result.kayitTarihi!.isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
        await _viewModel.getData();
      } else {
        return dialogManager.showAlertDialog(
          "Payker Ödeme Listesi verileri güncel değil. Lütfen verileri güncelleyin.",
        );
      }
      if (result.moduller
              ?.firstWhereOrNull((element) => element.modulBaslik == "Payker")
              ?.ekLisanslar
              ?.firstWhereOrNull((element) => element.sira == 2) ==
          null) {
        dialogManager.showAlertDialog(
          "Payker için gerekli ek lisanslar bulunamadı. Lütfen Payker modülünü kontrol edin.",
        );
        Get.back();
        return;
      }
      if (_viewModel.observableList == null) {
        Get.back();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Observer(
        builder: (_) => _viewModel.isSearchBarOpen
            ? CustomAppBarTextField(
                onChanged: _viewModel.setSearchText,
              )
            : AppBarTitle(
                title: "Payker Ödeme Listesi",
                subtitle: (_viewModel.filteredList?.length ?? 0).toStringIfNotNull,
              ),
      ),
      actions: [
        IconButton(
          icon: Observer(
            builder: (_) => Icon(_viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
          ),
          onPressed: _viewModel.changeSearchBarStatus,
        ),
      ],
      bottom: AppBarPreferedSizedBottom(
        children: [
          AppBarButton(
            icon: Icons.filter_alt_outlined,
            onPressed: () async {
              bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.filter,
                body: Column(
                  children: [
                    FilledButton.icon(
                      onPressed: () {
                        _viewModel.setSearchText(null);
                        Get.back();
                      },
                      icon: const Icon(Icons.clear_all_outlined),
                      label: Text(loc.generalStrings.apply),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        _viewModel.setSearchText(null);
                        Get.back();
                      },
                      icon: const Icon(Icons.clear_all_outlined),
                      label: Text(loc.generalStrings.apply),
                    ),
                  ],
                ),
              );
            },
            child: Text(loc.generalStrings.filter),
          ),
          AppBarButton(
            icon: Icons.sort_by_alpha_outlined,
            onPressed: () async {},
            child: Text(loc.generalStrings.sort),
          ),
        ],
      ),
    ),
    floatingActionButton: _fab(),
    body: _body(),
  );

  Widget _fab() => Observer(
    builder: (_) => CustomFloatingActionButton(
      isScrolledDown: _viewModel.isScrollDown,
      onPressed: () async {
        final result = await Get.toNamed(
          "/mainPage/paykerTahsilat",
        );
        if (result == true) {
          await _viewModel.getData();
        }
      },
    ),
  );

  Observer _body() => Observer(
    builder: (_) => RefreshableListView<PaykerOdemeListesiModel>(
      onRefresh: () async => _viewModel.getData(),
      items: _viewModel.filteredList,
      itemBuilder: (item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: UIHelper.lowSize),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.only(top: UIHelper.lowSize, bottom: UIHelper.lowSize, left: UIHelper.midSize),
          backgroundColor: theme.cardTheme.color,
          collapsedBackgroundColor: theme.cardTheme.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIHelper.highSize * 2),
          ),
          expansionAnimationStyle: const AnimationStyle(
            curve: Curves.easeInOutCubicEmphasized,
            duration: Duration(milliseconds: 300),
            reverseCurve: Curves.easeInOutCubicEmphasized,
            reverseDuration: Duration(milliseconds: 300),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIHelper.midSize),
          ),
          title: ListTile(
            leading: CircleAvatar(
              foregroundImage: Image.network(
                ApiUrls.basePaykerURLWithoutApi + (item.banka?.logoUrl ?? ""),
              ).image,
              child: Text(item.kartNo?.substring(0, 1) ?? "N"),
            ),
            title: Text(
              item.kartIsim ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.tutar case final value?)
                  Text("Tutar: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),

                Text(item.kayittarihi?.toDateTimeString() ?? ""),
                const SizedBox(height: UIHelper.lowSize),
                ColorfulBadge(
                  label: Text(item.durum ?? "", style: const TextStyle(fontWeight: FontWeight.w500)),
                  badgeColorEnum: item.badgeColor,
                  onTap: () async {
                    if (item.durumAciklama case final value?) {
                      dialogManager.showInfoSnackBar(value);
                    }
                  },
                ),
              ],
            ),
            trailing: IconButton.filledTonal(
              tooltip: "Tahsilat Makbuzunu görüntüle",
              onPressed: () async {
                Get.to(
                  () => GenelPdfView(
                    model: BasePdfModel(
                      byteData: "${ApiUrls.paykerTahsilatMakbuzu}/${item.enrollmentId}",
                      fromMemory: true,
                      uzanti: ".pdf",
                      dosyaAdi: "Payker Tahsilat Makbuzu - ${item.enrollmentId ?? ""}",
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.picture_as_pdf_outlined),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(UIHelper.highSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: UIHelper.midSize),
                    child: Divider(
                      endIndent: 0,
                      indent: 0,
                    ),
                  ),
                  CustomLayoutBuilder.divideInHalf(
                    children: [
                      Text("Kart No: ${item.kartNo ?? ""}"),
                      if (item.banka?.adi case final value?) Text("Banka: $value"),
                    ],
                  ),
                  if (detailsWidgets(item).isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: UIHelper.midSize),
                      child: Divider(
                        endIndent: 0,
                        indent: 0,
                      ),
                    ),

                  ...detailsWidgets(item),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  List<Widget> detailsWidgets(PaykerOdemeListesiModel item) => [
    if (item.enrollmentId case final value?) SelectableText("Kayıt ID: $value"),
    if (item.aciklama case final value?) Text("Açıklama: $value"),
    if (item.durumAciklama case final value?) Text("Durum açıklama: $value"),
  ];
}
