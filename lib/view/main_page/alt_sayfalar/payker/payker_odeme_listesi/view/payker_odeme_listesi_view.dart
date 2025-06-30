import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_pdf_model.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_detay/view/payker_odeme_detay_view.dart";
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
  final TextEditingController _basTarController = TextEditingController();
  final TextEditingController _bitTarController = TextEditingController();
  final TextEditingController _firmaController = TextEditingController();

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
          result.paykerModule?.sozlesmeUyari ?? "Payker modülü sözleşmesi aktif değil. Lütfen sözleşmeyi kontrol edin.",
        );
        Get.back();
        return;
      }
      if (result.paykerModule?.sozlesmeUyari != null) {
        dialogManager.showAlertDialog(result.paykerModule!.sozlesmeUyari!);
      }
      if (result.kayitTarihi != null && result.kayitTarihi!.isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
        _scrollController.addListener(() async => _viewModel.changeScrollStatus(_scrollController.position));
        await _viewModel.getData();
      } else {
        return dialogManager.showAlertDialog(
          "Payker Ödeme Listesi verileri güncel değil. Lütfen verileri güncelleyin.",
        );
      }
      if (_viewModel.observableList == null) {
        Get.back();
        return;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _basTarController.dispose();
    _bitTarController.dispose();
    _firmaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(),
    floatingActionButton: _fab(),
    body: _body(),
    bottomNavigationBar: _bottomNavigationBar(),
  );

  AppBar _appBar() => AppBar(
    title: Observer(
      builder: (_) => _viewModel.isSearchBarOpen
          ? CustomAppBarTextField(
              onFieldSubmitted: (value) {
                _viewModel
                  ..setSearchText(value)
                  ..setObservableList(null)
                  ..resetList();
              },
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
              body: Padding(
                padding: UIHelper.lowPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomLayoutBuilder.divideInHalf(
                      children: [
                        // CustomTextField(
                        //   labelText: "Firma",
                        //   controller: _firmaController,
                        //   valueWidget: Observer(
                        //     builder: (_) {
                        //       final firma = _viewModel.filterModel.filterModels?.firstWhereOrNull(
                        //         (element) => element.name == "FirmaId",
                        //       );
                        //       return firma != null ? Text(firma.value ?? "") : const SizedBox.shrink();
                        //     },
                        //   ),
                        //   readOnly: true,
                        //   suffixMore: true,
                        //   onTap: () async {
                        //     final result = await Get.toNamed("/mainPage/paykerFirmaBayiListesiOzel");
                        //     if (result is PaykerFirmaModel) {
                        //       _firmaController.text = result.text ?? "";
                        //       // _viewModel.setFirmaKodu(result.id);
                        //     }
                        //   },
                        // ),
                        CustomTextField(
                          isDateTime: true,
                          labelText: "Başlangıç Tarihi",
                          controller: _basTarController,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker(
                              initialDate: _basTarController.text.isNotEmpty
                                  ? _basTarController.text.toDateTimeDDMMYYYY()
                                  : null,
                            );
                            if (result != null) {
                              _basTarController.text = result.toDateString;
                              _viewModel.setBasTar(result);
                            }
                          },
                        ),
                        CustomTextField(
                          isDateTime: true,
                          labelText: "Bitiş Tarihi",
                          controller: _bitTarController,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker(
                              initialDate: _bitTarController.text.isNotEmpty
                                  ? _bitTarController.text.toDateTimeDDMMYYYY()
                                  : null,
                            );
                            if (result != null) {
                              _bitTarController.text = result.toDateString;
                              _viewModel.setBitTar(result);
                            }
                          },
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.back();
                        _viewModel.resetList();
                      },
                      icon: const Icon(Icons.clear_all_outlined),
                      label: Text(loc.generalStrings.apply),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(loc.generalStrings.filter),
        ),
        AppBarButton(
          icon: Icons.sort_by_alpha_outlined,
          onPressed: () async {
            final bottomSheetList = _viewModel.sortValues.entries
                .map((e) => BottomSheetModel(title: e.key, value: e, groupValue: e.value))
                .toList();
            final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
              context,
              groupValue: _viewModel.selectedSort,
              title: "Sıralama",
              children: bottomSheetList,
            );
            if (result != null) {
              _viewModel
                ..setSelectedSort(result)
                ..resetList();
            }
          },
          child: Text(loc.generalStrings.sort),
        ),
      ],
    ),
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
      // scrollController: _scrollController,
      // dahaVarMi: _viewModel.dahaVarMi,
      onRefresh: _viewModel.resetList,
      items: _viewModel.observableList,
      itemBuilder: _paykerOdemeCard,
    ),
  );

  Card _paykerOdemeCard(PaykerOdemeListesiModel item) => Card(
    child: ListTile(
      onTap: () async {
        bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: "Ödeme Detayları",
          children: [
            BottomSheetModel(
              title: "Detay görüntüle",
              iconWidget: Icons.preview_outlined,
              onTap: () {
                Get
                  ..back()
                  ..to(() => PaykerOdemeDetayView(model: item));
              },
            ),

            if (item.durum == "ALINDI") ...[
              if (item.firmaKodu != null)
                BottomSheetModel(
                  title: "Tahsilat Oluştur",
                  iconWidget: Icons.add_outlined,
                  onTap: () {
                    Get
                      ..back()
                      ..toNamed(
                        "/mainPage/krediKartiTahsilatiWithRequest",
                        arguments: TahsilatRequestModel.fromPaykerOdemeListesiModel(item),
                      );
                  },
                ),
              BottomSheetModel(
                title: "Tahsilat Makbuzu",
                iconWidget: Icons.picture_as_pdf_outlined,
                onTap: () {
                  final id = item.siparisNo;
                  Get
                    ..back()
                    ..to(
                      () => GenelPdfView(
                        model: BasePdfModel(
                          byteData: "${ApiUrls.paykerTahsilatMakbuzu}/${id ?? ""}",
                          fromMemory: true,
                          uzanti: ".pdf",
                          dosyaAdi: "Payker Tahsilat Makbuzu - ${id ?? ""}",
                        ),
                      ),
                    );
                },
              ),
            ],
          ],
        );
      },
      leading: Hero(
        tag: item.id ?? "",
        child: CircleAvatar(
          foregroundImage: Image.network(
            ApiUrls.basePaykerURLWithoutApi + (item.banka?.logoUrl ?? ""),
          ).image,
          child: Text(item.kartIsim?.substring(0, 1) ?? ""),
          onForegroundImageError: (_, _) => const Icon(Icons.credit_card_outlined),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.kartIsim ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          Text("${item.kayittarihi?.toDateString ?? ""} ${item.kayittarihi?.toTimeString ?? ""}"),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (item.tutar case final value?)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tutar: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Taksit: ${item.taksitSayisi ?? 1}"),
                  ],
                ),
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

          const SizedBox(height: UIHelper.lowSize),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: UIHelper.midSize),
            child: Divider(
              endIndent: 0,
              indent: 0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Kart No: ${item.kartNo ?? ""}"),
              if (item.banka?.adi case final value?) Text("Banka: $value"),
            ],
          ),
          if (item.belgeNo case final value?) Text("Belge No: $value"),
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
      // trailing: IconButton.filledTonal(
      //   tooltip: "Tahsilat Makbuzunu görüntüle",
      //   onPressed: () async {
      //     Get.to(
      //       () => GenelPdfView(
      //         model: BasePdfModel(
      //           byteData: "${ApiUrls.paykerTahsilatMakbuzu}/${item.enrollmentId}",
      //           fromMemory: true,
      //           uzanti: ".pdf",
      //           dosyaAdi: "Payker Tahsilat Makbuzu - ${item.enrollmentId ?? ""}",
      //         ),
      //       ),
      //     );
      //   },
      //   icon: const Icon(Icons.picture_as_pdf_outlined),
      // ),
    ),
  );

  Widget _bottomNavigationBar() => BottomBarWidget(
    isScrolledDown: true,
    children: [
      FooterButton(
        onPressed: () async {
          _viewModel
            ..setDurum(true)
            ..resetList();
        },
        children: [
          const Icon(
            Icons.check_circle_outline_outlined,
            color: ColorPalette.mantis,
          ),
          const Text(
            "Tamamlandı",
            style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.mantis),
          ),
        ],
      ),
      FooterButton(
        onPressed: () async {
          _viewModel
            ..setDurum(false)
            ..resetList();
        },
        children: [
          const Icon(
            Icons.cancel_outlined,
            color: ColorPalette.persianRed,
          ),
          const Text(
            "Tamamlanmadı",
            style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.persianRed),
          ),
        ],
      ),
      FooterButton(
        onPressed: () async {
          _viewModel
            ..setDurum(null)
            ..resetList();
        },
        children: [
          const Icon(
            Icons.refresh_outlined,
          ),
          const Text("Tümü", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ],
  );

  List<Widget> detailsWidgets(PaykerOdemeListesiModel item) => [
    if (item.aciklama case final value?) Text("Açıklama: $value"),
    if (item.durumAciklama case final value?) Text("Durum: $value"),
  ];
}
