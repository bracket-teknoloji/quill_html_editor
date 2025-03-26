import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/card/cari_hareketler_card.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/grid_tile/custom_animated_grid/view/custom_animated_grid_view.dart";
import "../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/enum/islem_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";
import "../model/cari_hareketleri_model.dart";
import "../view_model/cari_hareketleri_view_model.dart";

final class CariHareketleriView extends StatefulWidget {
  const CariHareketleriView({super.key, this.cari});
  final CariListesiModel? cari;

  @override
  State<CariHareketleriView> createState() => _CariHareketleriViewState();
}

final class _CariHareketleriViewState extends BaseState<CariHareketleriView> {
  final CariHareketleriViewModel viewModel = CariHareketleriViewModel();
  late final ScrollController scrollController;
  late final TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    viewModel.setCariListesiModel(widget.cari);
    scrollController = ScrollController();
    searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await init());
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    searchController.dispose();
  }

  Future<void> init() async {
    await viewModel.getData();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeScrollDown(true);
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeScrollDown(false);
      }
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        viewModel.changeScrollDown(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    // resizeToAvoidBottomInset: true,
    // extendBody: true,
    // extendBodyBehindAppBar: false,
    appBar: appBar(context),
    floatingActionButton: (yetkiController.cariHareketleriYeniKayit) ? fab() : null,
    bottomNavigationBar: bottomButtonBar(),
    body: body(),
  );

  AppBar appBar(BuildContext context) => AppBar(
    title: Observer(
      builder:
          (_) =>
              viewModel.isSearchBarOpen
                  ? CustomAppBarTextField(onChanged: viewModel.setSearchText)
                  : AppBarTitle(
                    title:
                        "Cari Hareketleri ${viewModel.observableList?.isNotEmpty ?? false ? '(${viewModel.observableList!.length})' : ''}",
                    subtitle: widget.cari?.cariAdi.toString() ?? "",
                  ),
    ),
    leading:
        viewModel.isSearchBarOpen
            ? IconButton(onPressed: viewModel.changeSearchBarStatus, icon: const Icon(Icons.arrow_back))
            : null,
    actions: [
      IconButton(
        onPressed: viewModel.changeSearchBarStatus,
        icon: Observer(
          builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
        ),
      ),
    ],
    bottom: AppBarPreferedSizedBottom(
      children: [
        AppBarButton(
          onPressed: () {
            dialogManager.showGridViewDialog(
              CustomAnimatedGridView(
                model: widget.cari,
                islemTipi: IslemTipiEnum.cari,
                title: widget.cari?.cariAdi,
                onSelected: (value) async {
                  if (value) {
                    await viewModel.getData();
                  }
                },
              ),
            );
          },
          icon: Icons.tune_outlined,
          child: const Text("Cari İşlemleri"),
        ),
        AppBarButton(
          icon: Icons.sort_by_alpha_outlined,
          onPressed: () async {
            final siralama = await bottomSheetDialogManager.showRadioBottomSheetDialog(
              context,
              title: "Sıralama seçiniz",
              groupValue: viewModel.siralama,
              children: [
                BottomSheetModel(title: "Tarih (Eskiden-Yeniye)", groupValue: "TARIH_AZ", value: "TARIH_AZ"),
                BottomSheetModel(title: "Tarih (Yeniden-Eskiye)", groupValue: "TARIH_ZA", value: "TARIH_ZA"),
              ],
            );
            if (siralama != viewModel.siralama && siralama != null) {
              viewModel.setSiralama(siralama);
              await viewModel.getData();
            }
          },
          child: Text(loc.generalStrings.sort),
        ),
        AppBarButton(
          icon: Icons.refresh_outlined,
          child: Text(loc.generalStrings.refresh),
          onPressed: () async {
            await viewModel.getData();
          },
        ),
      ],
    ),
  );

  // scrollController?.appBar.setPinState(false);
  Widget fab() => Observer(
    builder:
        (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            await Get.toNamed(
              "/mainPage/cariYeniKayit",
              arguments: BaseEditModel<CariHareketleriModel>(
                model:
                    CariHareketleriModel()
                      ..cariAdi = widget.cari!.cariAdi
                      ..cariKodu = widget.cari!.cariKodu,
                baseEditEnum: BaseEditEnum.ekle,
              ),
            );
            await viewModel.getData();
          },
        ),
  );

  Observer body() => Observer(
    builder:
        (_) => RefreshableListView(
          onRefresh: viewModel.getData,
          items: viewModel.filteredCariHareketleriList,
          itemBuilder:
              (item) => CariHareketlerCard(
                dovizTipi: widget.cari?.dovizAdi,
                cariHareketleriModel: item,
                onTap: () {
                  bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: loc.generalStrings.options,
                    children: [
                      if (!item.dekontMu && yetkiController.cariHareketleriHarDetayGorsun)
                        BottomSheetModel(
                          iconWidget: Icons.preview_outlined,
                          title: loc.generalStrings.view,
                          onTap: () async {
                            Get.back();
                            if (item.faturaMi) {
                              await Get.toNamed(
                                "/mainPage/faturaEdit",
                                arguments: BaseEditModel(
                                  baseEditEnum: BaseEditEnum.goruntule,
                                  editTipiEnum: EditTipiEnum.alisFatura.getEditTipiEnumWithRawValue(item.belgeTipi),
                                  model: SiparisEditRequestModel.fromCariHareketleriModel(item),
                                ),
                              );
                            } else if (item.kasaMi) {
                              await Get.toNamed("/mainPage/kasaHareketDetayi", arguments: item);
                            } else {
                              await Get.toNamed(
                                "/mainPage/cariYeniKayit",
                                arguments: BaseEditModel<CariHareketleriModel>(
                                  baseEditEnum: BaseEditEnum.goruntule,
                                  model: item,
                                ),
                              );
                            }
                          },
                        ),
                      if (item.resmiBelgeNo != null)
                        BottomSheetModel(
                          iconWidget: Icons.preview_outlined,
                          title: "E-Belge Görüntüle",
                          onTap: () async {
                            Get.back();
                            await Get.toNamed(
                              "/mainPage/eBelgePdf",
                              arguments: EBelgeListesiModel(
                                resmiBelgeNo: item.resmiBelgeNo,
                                belgeTuru: item.belgeTipi,
                                ebelgeTuru: item.ebelgeTuru,
                              ),
                            );
                          },
                        ),
                      BottomSheetModel(
                        iconWidget: Icons.list_alt_outlined,
                        title: loc.generalStrings.actions,
                        onTap: () async {
                          Get.back();
                          await dialogManager.showCariHareketleriGridViewDialog(
                            CariListesiModel.fromCariHareketleriModel(item),
                            onSelected: (value) async {
                              if (value) {
                                await viewModel.getData();
                              }
                            },
                          );
                        },
                      ),
                      if (item.devirMi && yetkiController.cariHareketleriDuzenleme)
                        BottomSheetModel(
                          iconWidget: Icons.edit_outlined,
                          title: loc.generalStrings.edit,
                          onTap: () async {
                            Get.back();
                            final result = await Get.toNamed(
                              "/mainPage/cariYeniKayit",
                              arguments: BaseEditModel<CariHareketleriModel>(
                                baseEditEnum: BaseEditEnum.duzenle,
                                model: item,
                              ),
                            );
                            if (result != null) {
                              await viewModel.getData();
                            }
                          },
                        ),
                      if (item.devirMi && yetkiController.cariHareketleriSilme)
                        BottomSheetModel(
                          title: loc.generalStrings.delete,
                          iconWidget: Icons.delete_outline_outlined,
                          onTap: () async {
                            Get.back();
                            await dialogManager.showAreYouSureDialog(
                              onYes: () async {
                                final result = await networkManager.dioPost(
                                  path: ApiUrls.deleteCariHareket,
                                  bodyModel: CariHareketleriModel(),
                                  queryParameters: {"INCKEYNO": item.inckeyno},
                                );
                                if (result.isSuccess) {
                                  dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                                  await viewModel.getData();
                                } else {
                                  dialogManager.showErrorSnackBar(result.message ?? "");
                                }
                              },
                              title: "Bu hareket kaydını silmek istediğinizden emin misiniz?",
                            );
                          },
                        ),
                      if (item.kasaMi)
                        BottomSheetModel(
                          iconWidget: Icons.receipt_long_outlined,
                          title: "Tahsilat Makbuzu",
                          onTap: () async => await showPdf("TahsilatMakbuzu", item),
                        ),
                      BottomSheetModel(
                        iconWidget: Icons.picture_as_pdf_outlined,
                        title: "PDF Görüntüle",
                        onTap: () async {
                          await showPdf("CariHareket", item);
                        },
                      ),
                    ],
                  );
                },
              ),
        ),
  );

  Widget bottomButtonBar() => Observer(
    builder:
        (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrollDown,
          children: [
            FooterButton(
              children: [
                const Text("Borç"),
                Observer(
                  builder:
                      (_) => Text(
                        "${viewModel.borclarToplami.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cari?.dovizAdi ?? mainCurrency}",
                        style: const TextStyle(color: ColorPalette.persianRed),
                      ),
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Alacak"),
                Observer(
                  builder:
                      (_) => Text(
                        "${viewModel.alacaklarToplami.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cari?.dovizAdi ?? mainCurrency}",
                        style: const TextStyle(color: ColorPalette.mantis),
                      ),
                ),
              ],
            ),
            FooterButton(
              children: [
                Observer(builder: (_) => Text((viewModel.toplamBakiye) < 0 ? "Ödenecek" : "Tahsil Edilecek")),
                Observer(
                  builder:
                      (_) => Text(
                        "${viewModel.toplamBakiye.abs().commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cari?.dovizAdi ?? mainCurrency}",
                        style: TextStyle(color: UIHelper.getColorWithValue(viewModel.toplamBakiye)),
                      ),
                ),
              ],
            ),
          ],
        ),
  );

  bool getFilter(CariHareketleriModel model, String filter) =>
      model.belgeNo!.toLowerCase().contains(filter.toLowerCase()) ||
      model.hareketAciklama!.toLowerCase().contains(filter.toLowerCase()) ||
      model.aciklama!.toLowerCase().contains(filter.toLowerCase());
  // ("${"("})").toLowerCase().contains(filter.toLowerCase());

  Future<void> showPdf(String ozelKod, CariHareketleriModel model) async {
    final PdfModel pdfModel = PdfModel(raporOzelKod: ozelKod, dicParams: DicParams(belgeNo: model.belgeNo ?? ""));
    final result = parametreModel.netFectDizaynList?.where((element) => element.ozelKod == ozelKod).toList();
    NetFectDizaynList? dizaynList;
    if (result.ext.isNotNullOrEmpty) {
      Get.back();
      if (result!.length == 1) {
        pdfModel
          ..dizaynId = result.firstOrNull?.id
          ..etiketSayisi = result.firstOrNull?.kopyaSayisi;
        pdfModel.dicParams?.caharInckey = model.inckeyno.toStringIfNotNull;
        dizaynList = result.first;
      } else {
        dizaynList = await bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: "Dizayn Seçiniz",
          children: result.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList(),
        );
        pdfModel
          ..dizaynId = dizaynList?.id
          ..etiketSayisi = dizaynList?.kopyaSayisi;
        pdfModel.dicParams?.caharInckey = model.inckeyno.toStringIfNotNull;
        // pdfModel.dicParams?.belgeNo = dizaynList?.;
      }
      Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
    }
  }
}
