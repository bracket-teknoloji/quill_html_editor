import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart';
import 'package:picker/core/components/bottom_bar/bottom_bar.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/core/components/button/elevated_buttons/footer_button.dart';
import 'package:picker/core/components/card/siparisler_card.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/floating_action_button/custom_floating_action_button.dart';
import 'package:picker/core/components/helper_widgets/custom_label_widget.dart';
import 'package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart';
import 'package:picker/core/components/textfield/custom_app_bar_text_field.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/view_model/siparisler_view_model.dart';

class SiparislerView extends StatefulWidget {
  final bool isSiparisler;
  const SiparislerView({super.key, required this.isSiparisler});

  @override
  State<SiparislerView> createState() => _SiparislerViewState();
}

class _SiparislerViewState extends BaseState<SiparislerView> {
  late ScrollController scrollController;
  late TextEditingController baslangicTarihiController;
  late TextEditingController bitisTarihiController;
  late TextEditingController cariController;
  late TextEditingController cariTipiController;
  late TextEditingController plasiyerController;
  late TextEditingController projeController;
  late TextEditingController ozelKod1Controller;
  late TextEditingController ozelKod2Controller;
  late SiparislerViewModel viewModel;
  List<SiparislerModel?>? get musteriSiparisleriList => viewModel.musteriSiparisleriList;

  @override
  void initState() {
    viewModel = SiparislerViewModel(pickerBelgeTuru: widget.isSiparisler ? "MS" : "SS");
    scrollController = ScrollController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    cariController = TextEditingController();
    cariTipiController = TextEditingController();
    plasiyerController = TextEditingController();
    projeController = TextEditingController();
    ozelKod1Controller = TextEditingController();
    ozelKod2Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        Future.delayed(const Duration(milliseconds: 500), () => getData());
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        viewModel.changeIsScrolledDown(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    cariController.dispose();
    cariTipiController.dispose();
    plasiyerController.dispose();
    projeController.dispose();
    ozelKod1Controller.dispose();
    ozelKod2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: appBar(context),
      floatingActionButton: fab(),
      body: body(),
      bottomNavigationBar: Observer(
          builder: (_) => BottomBarWidget(isScrolledDown: viewModel.isScrolledDown, visible: viewModel.paramData.isNotEmpty, children: [
                FooterButton(children: [const Text("KDV Hariç"), Text("${viewModel.paramData["ARA_TOPLAM"] ?? ""} TL")]),
                FooterButton(children: [const Text("KDV"), Text("${viewModel.paramData["KDV"] ?? ""} TL")]),
                FooterButton(children: [const Text("KDV Dahil"), Text("${viewModel.paramData["GENEL_TOPLAM"] ?? ""} TL")]),
              ])),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      //*Title
      title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  onFieldSubmitted: (value) {
                    viewModel.setSearchText(value);
                    viewModel.setSiparislerList(null);
                    viewModel.setDahaVarMi(true);
                    viewModel.resetSayfa();
                    getData();
                  },
                )
              : AppBarTitle(title: "${widget.isSiparisler ? "Müşteri" : "Satıcı"} Siparişleri", subtitle: viewModel.musteriSiparisleriList?.length.toString())),
      //*Actions
      actions: [
        IconButton(
            onPressed: () {
              viewModel.changeSearchBar();
              getData();
            },
            icon: Observer(builder: (_) => viewModel.searchBar ? const Icon(Icons.search_off_outlined) : const Icon(Icons.search_outlined)))
      ],
      //*Bottom
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarPreferedSizedBottom(
            children: [
              AppBarButton(
                icon: Icons.filter_alt_outlined,
                onPressed: () async => await bottomSheetDialogManager.showBottomSheetDialog(context,
                    title: "Filtrele",
                    body: Column(
                      children: [
                        RaporFiltreDateTimeBottomSheetView(
                          filterOnChanged: (index) {
                            viewModel.setSiparislerList(null);
                            viewModel.setDahaVarMi(true);
                            viewModel.resetSayfa();
                            getData();
                          },
                          baslangicTarihiController: baslangicTarihiController,
                          bitisTarihiController: bitisTarihiController,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                    labelText: "Cari",
                                    controller: cariController,
                                    suffixMore: true,
                                    readOnly: true,
                                    onTap: () async {
                                      var result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                                      if (result != null) {
                                        cariController.text = result.cariAdi;
                                        viewModel.musteriSiparisleriRequestModel.cariKodu = result.cariKodu;
                                      }
                                    })),
                            Expanded(
                                child: CustomTextField(
                                    labelText: "Cari Tipi",
                                    controller: cariTipiController,
                                    suffixMore: true,
                                    readOnly: true,
                                    onTap: () async {
                                      var result = await bottomSheetDialogManager.showCariTipiBottomSheetDialog(context);
                                      if (result != null) {
                                        cariTipiController.text = result;
                                        //😳 Bunu düzenle
                                        viewModel.musteriSiparisleriRequestModel.cariTipi = result;
                                      }
                                    })),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                    labelText: "Plasiyer",
                                    controller: plasiyerController,
                                    suffixMore: true,
                                    readOnly: true,
                                    onTap: () async {
                                      var result = await bottomSheetDialogManager.showPlasiyerDialog(context);
                                      if (result != null) {
                                        plasiyerController.text = result.map((e) => e.plasiyerAciklama).join(", ");
                                        //😳 Bunu düzenle
                                        viewModel.musteriSiparisleriRequestModel.arrPlasiyerKodu = result.map((e) => e.plasiyerKodu).toList();
                                      }
                                    })),
                            Expanded(child: CustomTextField(labelText: "Proje", controller: projeController, suffixMore: true, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: CustomTextField(labelText: "Özel Kod 1", controller: ozelKod1Controller, suffixMore: true)),
                            Expanded(child: CustomTextField(labelText: "Özel Kod 2", controller: ozelKod2Controller, suffixMore: true)),
                          ],
                        ),
                        CustomWidgetWithLabel(
                          isVertical: true,
                          text: "Kapalı Belgeler Listelenmesin",
                          child: Observer(builder: (_) => Switch.adaptive(value: viewModel.kapaliBelgelerListelenmesin, onChanged: (value) => viewModel.setKapaliBelgelerListelenmesin(value))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [const Text("Cari Rapor Kodları"), IconButton(onPressed: () => viewModel.changeGrupKodlariGoster(), icon: const Icon(Icons.arrow_drop_down))],
                        ),
                        Observer(
                          builder: (_) => AnimatedContainer(
                            height: viewModel.grupKodlariGoster ? null : 0,
                            duration: const Duration(seconds: 1),
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: CustomTextField(labelText: "Grup Kodu", suffixMore: true)),
                                    Expanded(child: CustomTextField(labelText: "Kod 1", suffixMore: true)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: CustomTextField(labelText: "Kod 2", suffixMore: true)),
                                    Expanded(child: CustomTextField(labelText: "Kod 3", suffixMore: true)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: CustomTextField(labelText: "kod 4", suffixMore: true)),
                                    Expanded(child: CustomTextField(labelText: "kod 5", suffixMore: true)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(onPressed: () {}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))), child: const Text("Temizle"))),
                            SizedBox(width: context.dynamicWidth(0.02)),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.setSiparislerList(null);
                                      viewModel.setDahaVarMi(true);
                                      viewModel.resetSayfa();
                                      getData();
                                      Get.back();
                                    },
                                    child: const Text("Kaydet"))),
                          ],
                        )
                      ],
                    )),
                child: const Text("Filtrele"),
              ),
              AppBarButton(
                icon: Icons.sort_by_alpha_outlined,
                onPressed: () async {
                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Sıralama",
                      children:
                          List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.values.toList()[index])));
                  if (result != null) {
                    viewModel.setSiralama(result);
                    viewModel.resetSayfa();
                    viewModel.setSiparislerList(null);
                    viewModel.setDahaVarMi(true);
                    getData();
                  }
                },
                child: const Text("Sırala"),
              ),
            ],
          )),
    );
  }

  Observer fab() => Observer(builder: (_) => CustomFloatingActionButton(isScrolledDown: viewModel.isScrolledDown));

  RefreshIndicator body() {
    return RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setSiparislerList(null);
          viewModel.setDahaVarMi(true);
          getData();
        },
        child: Observer(
            builder: (_) => musteriSiparisleriList.isNullOrEmpty
                ? (viewModel.musteriSiparisleriList?.isEmpty ?? false)
                    ? const Center(child: Text("Stok Bulunamadı"))
                    : const Center(child: CircularProgressIndicator.adaptive())
                : Observer(builder: (_) {
                    return ListView.builder(
                      primary: false,
                      padding: UIHelper.lowPadding,
                      controller: scrollController,
                      itemCount: musteriSiparisleriList?.length != null ? musteriSiparisleriList!.length + 1 : 0,
                      itemBuilder: (context, index) {
                        if (index == (viewModel.musteriSiparisleriList?.length ?? 0)) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: (viewModel.dahaVarMi) ? 50 : 0,
                            child: const Center(child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        return SiparislerCard(model: viewModel.musteriSiparisleriList?[index]);
                      },
                    );
                  })));
  }

  void getData() async {
    viewModel.setDahaVarMi(false);
    var result = await networkManager.dioGet<SiparislerModel>(path: ApiUrls.getFaturalar, bodyModel: SiparislerModel(), queryParameters: viewModel.musteriSiparisleriRequestModel.toJson());
    if (result.data != null) {
      viewModel.setParamData(result.paramData?.map((key, value) => MapEntry(key, value.toString())) ?? {});
      List<SiparislerModel?>? list = result.data.map((e) => e as SiparislerModel).toList().cast<SiparislerModel?>();
      if (list!.length < 25) {
        viewModel.setDahaVarMi(false);
      } else {
        viewModel.setDahaVarMi(true);
        viewModel.increaseSayfa();
      }
      if (viewModel.musteriSiparisleriList == null) {
        viewModel.setSiparislerList(list);
      } else {
        viewModel.addSiparislerList(list);
      }
      // if (viewModel.sayfa == 1) {
      //   viewModel.setSiparislerList(list);
      //   viewModel.setDahaVarMi(true);
      //   viewModel.increaseSayfa();
      // } else if (viewModel.sayfa > 1) {
      // if (list!.length < 25) {
      //   viewModel.setDahaVarMi(false);
      // } else {
      //   viewModel.setDahaVarMi(true);
      //   viewModel.increaseSayfa();
      // }
      //   viewModel.addSiparislerList(list);
      // }
    }
  }
}
