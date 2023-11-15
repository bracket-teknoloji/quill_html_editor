import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/card/cek_senet_listesi_card.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/banka_constants.dart";
import "../../../../../../../core/constants/enum/cek_senet_listesi_enum.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../banka/banka_listesi/model/banka_listesi_request_model.dart";
import "../view_model/cek_senet_listesi_view_model.dart";

class CekSenetListesiView extends StatefulWidget {
  final CekSenetListesiEnum cekSenetListesiEnum;
  const CekSenetListesiView({super.key, required this.cekSenetListesiEnum});

  @override
  State<CekSenetListesiView> createState() => _CekSenetListesiViewState();
}

class _CekSenetListesiViewState extends BaseState<CekSenetListesiView> {
  CekSenetListesiViewModel viewModel = CekSenetListesiViewModel();
  late final TextEditingController _searchController;
  late final TextEditingController _verenCariController;
  late final TextEditingController _verilenCariController;
  late final TextEditingController _bankaController;
  late final TextEditingController _vadeTarihiController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _searchController = TextEditingController();
    _verenCariController = TextEditingController();
    _verilenCariController = TextEditingController();
    _bankaController = TextEditingController();
    _vadeTarihiController = TextEditingController();
    _scrollController = ScrollController();
    viewModel.setBelgeTipi(widget.cekSenetListesiEnum.belgeTipi);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.hasClients) {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            await viewModel.getData();
            viewModel.setIsScrolledDown(true);
          }
          if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
            viewModel.setIsScrolledDown(false);
          } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
            viewModel.setIsScrolledDown(true);
          }
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            viewModel.setIsScrolledDown(false);
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _verenCariController.dispose();
    _verilenCariController.dispose();
    _bankaController.dispose();
    _vadeTarihiController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: appBar,
        floatingActionButton: fab(),
        body: body,
        bottomNavigationBar: bottomAppBar(),
      );

  AppBar get appBar => AppBar(
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  controller: _searchController,
                  onFieldSubmitted: (value) async {
                    viewModel.setSearchText(value);
                    await viewModel.getData();
                  },
                )
              : AppBarTitle(title: "${widget.cekSenetListesiEnum.title} (${viewModel.cekSenetListesiListesi?.length ?? 0})"),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              viewModel.setSearchBar();
              if (!viewModel.searchBar) {
                viewModel.setSearchText(null);
                await viewModel.getData();
              }
            },
            icon: Observer(
              builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              child: const Text("Filtrele"),
              onPressed: () async => await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: "Filtrele",
                body: Observer(
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomWidgetWithLabel(
                        text: "Yeri",
                        child: Observer(
                          builder: (_) => SlideControllerWidget(
                            childrenTitleList: viewModel.yeriMap.keys.toList(),
                            childrenValueList: viewModel.yeriMap.values.toList(),
                            filterOnChanged: (index) {
                              viewModel.setYeri(viewModel.yeriMap.values.toList()[index ?? 0]);
                              if (viewModel.cekSenetListesiRequestModel.yer == "C") {
                                _bankaController.text = "";
                              } else if (viewModel.cekSenetListesiRequestModel.yer == "T" || viewModel.cekSenetListesiRequestModel.yer == "E") {
                                _verilenCariController.text = "";
                              } else {
                                _verilenCariController.text = "";
                                _bankaController.text = "";
                                viewModel.setVerilenCari(null);
                              }
                            },
                            groupValue: viewModel.cekSenetListesiRequestModel.yer,
                          ),
                        ),
                      ),
                      CustomWidgetWithLabel(
                        text: "Durumu",
                        child: Observer(
                          builder: (_) => SlideControllerWidget(
                            childrenTitleList: viewModel.durumuMap.keys.toList(),
                            childrenValueList: viewModel.durumuMap.values.toList(),
                            filterOnChanged: (index) => viewModel.setDurumu(viewModel.durumuMap.values.toList()[index ?? 0]),
                            groupValue: viewModel.cekSenetListesiRequestModel.durum,
                          ),
                        ),
                      ),
                      CustomTextField(
                        labelText: "Veren Cari",
                        controller: _verenCariController,
                        suffixMore: true,
                        readOnly: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.cekSenetListesiRequestModel.verenKodu ?? "")),
                        onClear: () => viewModel.setVerenCari(null),
                        onTap: () async {
                          final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                          if (result is CariListesiModel) {
                            viewModel.setVerenCari(result.cariKodu);
                            _verenCariController.text = result.cariAdi ?? "";
                          }
                        },
                        suffix: IconButton(
                          onPressed: () async {
                            if (viewModel.cekSenetListesiRequestModel.verenKodu != null) {
                              return showCariIslemler(true);
                            } else {
                              dialogManager.showInfoDialog("Veren cari seçiniz");
                            }
                          },
                          icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                        ),
                      ),
                      CustomTextField(
                        labelText: "Verilen Cari",
                        controller: _verilenCariController,
                        suffixMore: true,
                        readOnly: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.cekSenetListesiRequestModel.verilenKodu ?? "")),
                        onClear: () => viewModel.setVerilenCari(null),
                        onTap: () async {
                          final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                          if (result is CariListesiModel) {
                            viewModel.setVerilenCari(result.cariKodu);
                            _verilenCariController.text = result.cariAdi ?? "";
                          }
                        },
                        suffix: IconButton(
                          onPressed: () async {
                            if (viewModel.cekSenetListesiRequestModel.verilenKodu != null) {
                              return showCariIslemler(false);
                            } else {
                              dialogManager.showInfoDialog("Verilen cari seçiniz");
                            }
                          },
                          icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                        ),
                      ).yetkiVarMi(viewModel.cekSenetListesiRequestModel.yer == "C"),
                      CustomTextField(
                        labelText: "Banka",
                        controller: _bankaController,
                        suffixMore: true,
                        readOnly: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.cekSenetListesiRequestModel.verilenKodu ?? "")),
                        onClear: () => viewModel.setBanka(null),
                        onTap: () async {
                          final List<int> arrHesapTipi = [];
                          if (widget.cekSenetListesiEnum == CekSenetListesiEnum.cekMusteri &&
                              (yetkiController.kayitliHesapTipiMi(BankaConstants.tahsilCekleri) || yetkiController.kayitliHesapTipiMi(BankaConstants.teminatCekleri))) {
                            arrHesapTipi.add(BankaConstants.tahsilCekleri);
                            arrHesapTipi.add(BankaConstants.teminatCekleri);
                          } else if (widget.cekSenetListesiEnum == CekSenetListesiEnum.senetMusteri &&
                              (yetkiController.kayitliHesapTipiMi(BankaConstants.tahsilSenetleri) || yetkiController.kayitliHesapTipiMi(BankaConstants.teminatSenetleri))) {
                            arrHesapTipi.add(BankaConstants.tahsilSenetleri);
                            arrHesapTipi.add(BankaConstants.teminatSenetleri);
                          } else if (widget.cekSenetListesiEnum == CekSenetListesiEnum.cekBorc && yetkiController.kayitliHesapTipiMi(BankaConstants.borcCekleri)) {
                            arrHesapTipi.add(BankaConstants.borcCekleri);
                          } else if (widget.cekSenetListesiEnum == CekSenetListesiEnum.senetBorc && yetkiController.kayitliHesapTipiMi(BankaConstants.borcSenetleri)) {
                            arrHesapTipi.add(BankaConstants.borcSenetleri);
                          }
                          final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
                            context,
                            BankaListesiRequestModel(
                              arrHesapTipi: jsonEncode(arrHesapTipi),
                              ekranTipi: "R",
                              belgeTipi: widget.cekSenetListesiEnum.belgeTipi,
                              menuKodu: "YONE_BHRE",
                            ),
                            viewModel.cekSenetListesiRequestModel.verilenKodu,
                          );
                          if (result != null) {
                            viewModel.setBanka(result.hesapKodu);
                            _bankaController.text = result.hesapAdi ?? "";
                          }
                        },
                      ).yetkiVarMi(viewModel.cekSenetListesiRequestModel.yer == "T" || viewModel.cekSenetListesiRequestModel.yer == "E"),
                      CustomTextField(
                        labelText: "Vade Tarihi",
                        controller: _vadeTarihiController,
                        suffixMore: true,
                        readOnly: true,
                        onClear: () => viewModel.setVadeTarihi(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showBottomSheetDialog(
                            context,
                            title: "Vade Tarihi",
                            children: List.generate(
                              viewModel.donemTipiMap.length,
                              (index) => BottomSheetModel(title: viewModel.donemTipiMap.keys.toList()[index], value: viewModel.donemTipiMap.entries.toList()[index]),
                            ),
                          );
                          if (result is MapEntry) {
                            viewModel.setVadeTarihi(result.value);
                            _vadeTarihiController.text = result.key;
                          }
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Get.back();
                          await viewModel.getData();
                        },
                        child: const Text("Uygula"),
                      ).paddingAll(UIHelper.lowSize),
                    ],
                  ),
                ),
              ),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: const Text("Sırala"),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sırala",
                  groupValue: viewModel.cekSenetListesiRequestModel.sirala,
                  children: List.generate(
                    viewModel.siralaMap.length,
                    (index) => BottomSheetModel(
                      title: viewModel.siralaMap.keys.toList()[index],
                      value: viewModel.siralaMap.values.toList()[index],
                      groupValue: viewModel.siralaMap.values.toList()[index],
                    ),
                  ),
                );
                if (result != null) {
                  viewModel.setSirala(result);
                  await viewModel.getData();
                }
              },
            ),
            AppBarButton(icon: Icons.refresh_outlined, onPressed: () async => await viewModel.getData(), child: const Text("Yenile")),
          ],
        ),
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(isScrolledDown: !viewModel.isScrollDown).yetkiVarMi(widget.cekSenetListesiEnum.eklenebilirMi),
      );

  RefreshIndicator get body => RefreshIndicator.adaptive(
        onRefresh: viewModel.getData,
        child: Observer(
          builder: (_) {
            if (viewModel.cekSenetListesiListesi == null) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (viewModel.cekSenetListesiListesi.ext.isNullOrEmpty) {
              return const Center(child: Text("Veri bulunamadı", textAlign: TextAlign.center));
            }
            return ListView.builder(
              controller: _scrollController,
              padding: UIHelper.lowPadding,
              itemCount: viewModel.cekSenetListesiListesi?.length ?? 0,
              itemBuilder: (context, index) {
                final model = viewModel.cekSenetListesiListesi![index];
                return CekSenetListesiCard(
                  model: model,
                  cekSenetListesiEnum: widget.cekSenetListesiEnum,
                  onUpdate: (value) async {
                    await viewModel.getData();
                  },
                );
              },
            );
          },
        ),
      );

  Observer bottomAppBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: !viewModel.isScrollDown,
          children: [
            FooterButton(
              children: [
                Observer(
                  builder: (_) => Text("Toplam Tutar: ${viewModel.toplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                ),
              ],
            ),
          ],
        ),
      );

  Future<void> showCariIslemler(bool verenMi) async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getCariler,
      bodyModel: CariListesiModel(),
      showLoading: true,
      queryParameters: {
        "filterText": "",
        "Kod": verenMi ? viewModel.cekSenetListesiRequestModel.verenKodu : viewModel.cekSenetListesiRequestModel.verilenKodu,
        "EFaturaGoster": true,
        "KisitYok": true,
        "BelgeTuru": widget.cekSenetListesiEnum.belgeTipi,
        "PlasiyerKisitiYok": true,
      },
    );

    dialogManager.showCariGridViewDialog(result.data.first);
  }
}
