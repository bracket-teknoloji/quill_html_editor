import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/model/base_edit_model.dart';
import 'package:picker/core/base/model/base_grup_kodu_model.dart';
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
import 'package:picker/core/components/slide_controller/view/slide_controller_view.dart';
import 'package:picker/core/components/textfield/custom_app_bar_text_field.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/view_model/siparisler_view_model.dart';

import '../../../../../../core/constants/enum/base_edit_enum.dart';
import '../model/siparis_edit_reuqest_model.dart';

class SiparislerView extends StatefulWidget {
  final bool isSiparisler;
  const SiparislerView({super.key, required this.isSiparisler});

  @override
  State<SiparislerView> createState() => _SiparislerViewState();
}

class _SiparislerViewState extends BaseState<SiparislerView> {
  List<BaseGrupKoduModel> grupKodList = [];
  late ScrollController scrollController;
  late TextEditingController baslangicTarihiController;
  late TextEditingController bitisTarihiController;
  late TextEditingController cariController;
  late TextEditingController cariTipiController;
  late TextEditingController plasiyerController;
  late TextEditingController projeController;
  late TextEditingController ozelKod1Controller;
  late TextEditingController ozelKod2Controller;
  late TextEditingController grupKoduController;
  late TextEditingController kod1Controller;
  late TextEditingController kod2Controller;
  late TextEditingController kod3Controller;
  late TextEditingController kod4Controller;
  late TextEditingController kod5Controller;
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
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
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
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
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
      bottomNavigationBar: bottomNavigationBar(),
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
                            viewModel.setBaslamaTarihi(baslangicTarihiController.text);
                            viewModel.setBitisTarihi(bitisTarihiController.text);
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
                                        viewModel.setCariKodu(result.cariKodu);
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
                                        viewModel.setCariTipi(result);
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

                                        viewModel.setArrPlasiyerKodu(result.map((e) => e.plasiyerKodu.toString()).toList().cast<String>());
                                      }
                                    })),
                            Expanded(
                                child: CustomTextField(
                                    labelText: "Proje",
                                    controller: projeController,
                                    suffixMore: true,
                                    readOnly: true,
                                    onTap: () async {
                                      var result = await bottomSheetDialogManager.showProjeDialog(context);
                                      if (result != null) {
                                        projeController.text = result.projeAciklama;
                                        viewModel.setProjeKodu(result.projeKodu);
                                      }
                                    })),
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
                        CustomWidgetWithLabel(
                            text: "Teslimat Durumu",
                            child: Observer(
                                builder: (_) => SlideControllerWidget(
                                    scroll: false,
                                    childrenTitleList: viewModel.teslimatDurumu,
                                    filterOnChanged: (x) => viewModel.setTeslimatDurumuGroupValue(x),
                                    childrenValueList: viewModel.teslimatDurumuValueList,
                                    groupValue: viewModel.teslimatDurumuGroupValue))),
                        InkWell(
                          onTap: () => viewModel.changeGrupKodlariGoster(),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Cari Rapor Kodları"), Icon(Icons.arrow_drop_down)],
                          ),
                        ),
                        // viewModel.musteriSiparisleriList.first.o
                        Observer(
                          builder: (_) => AnimatedContainer(
                            height: viewModel.grupKodlariGoster ? null : 0,
                            duration: const Duration(seconds: 1),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child:
                                            CustomTextField(labelText: "Grup Kodu", controller: grupKoduController, readOnly: true, suffixMore: true, onTap: () => getGrupKodu(0, grupKoduController))),
                                    Expanded(child: CustomTextField(labelText: "Kod 1", controller: kod1Controller, readOnly: true, suffixMore: true, onTap: () => getGrupKodu(1, kod1Controller))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: CustomTextField(labelText: "Kod 2", controller: kod2Controller, readOnly: true, suffixMore: true, onTap: () => getGrupKodu(2, kod2Controller))),
                                    Expanded(child: CustomTextField(labelText: "Kod 3", controller: kod3Controller, readOnly: true, suffixMore: true, onTap: () => getGrupKodu(3, kod3Controller))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: CustomTextField(labelText: "kod 4", controller: kod4Controller, readOnly: true, suffixMore: true, onTap: () => getGrupKodu(4, kod4Controller))),
                                    Expanded(child: CustomTextField(labelText: "kod 5", controller: kod5Controller, readOnly: true, suffixMore: true, onTap: () => getGrupKodu(5, kod5Controller))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.resetFilter();
                                      clearTextEditingControllers();
                                      getData();
                                      Get.back();
                                    },
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                                    child: const Text("Temizle"))),
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

  void clearTextEditingControllers() {
    baslangicTarihiController.clear();
    bitisTarihiController.clear();
    cariController.clear();
    cariTipiController.clear();
    plasiyerController.clear();
    projeController.clear();
    ozelKod1Controller.clear();
    ozelKod2Controller.clear();
    grupKoduController.clear();
    kod1Controller.clear();
    kod2Controller.clear();
    kod3Controller.clear();
    kod4Controller.clear();
    kod5Controller.clear();
  }

  Observer fab() => Observer(
      builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrolledDown, onPressed: () => Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: SiparisEditRequestModel(), baseEditEnum: BaseEditEnum.ekle))));

  RefreshIndicator body() {
    return RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setSiparislerList(null);
          viewModel.setDahaVarMi(true);
          viewModel.resetSayfa();
          getData();
        },
        child: Observer(
            builder: (_) => musteriSiparisleriList.ext.isNullOrEmpty
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
                          return Visibility(
                            visible: viewModel.dahaVarMi,
                            child: const Center(child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        return SiparislerCard(model: viewModel.musteriSiparisleriList![index]!);
                      },
                    );
                  })));
  }

  Observer bottomNavigationBar() {
    return Observer(
        builder: (_) => BottomBarWidget(isScrolledDown: viewModel.isScrolledDown, visible: viewModel.paramData.isNotEmpty, children: [
              FooterButton(children: [const Text("KDV Hariç"), Text("${int.tryParse(viewModel.paramData["ARA_TOPLAM"]?.split(",").first ?? "").commaSeparated} TL")]),
              FooterButton(children: [const Text("KDV"), Text("${int.tryParse(viewModel.paramData["KDV"]?.split(",").first ?? "").commaSeparated} TL")]),
              FooterButton(children: [const Text("KDV Dahil"), Text("${int.tryParse(viewModel.paramData["GENEL_TOPLAM"]?.split(",").first ?? "").commaSeparated} TL")]),
            ]));
  }

  void getData() async {
    viewModel.setDahaVarMi(false);
    var result = await networkManager.dioGet<SiparislerModel>(path: ApiUrls.getFaturalar, bodyModel: SiparislerModel(), queryParameters: viewModel.musteriSiparisleriRequestModel.toJson());
    if (result.data != null) {
      if (viewModel.sayfa == 1) {
        viewModel.setParamData(result.paramData?.map((key, value) => MapEntry(key, value.toString())) ?? {});
      }
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
    }
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.ext.isNullOrEmpty) {
      grupKodList = await networkManager.getGrupKod(name: "CARI", grupNo: -1);
    }
    List<BottomSheetModel>? bottomSheetList =
        grupKodList.where((e) => e.grupNo == grupNo).toList().cast<BaseGrupKoduModel>().map((e) => BottomSheetModel(title: e.grupKodu ?? "")).toList().cast<BottomSheetModel>();
    // ignore: use_build_context_synchronously
    var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(context, title: "Grup Kodu $grupNo", children: bottomSheetList);
    if (result != null) {
      controller?.text = result.join(", ");
      switch (grupNo) {
        case 0:
          viewModel.setArrGrupKodu(result.map((e) => e.toString()).toList().cast<String>() ?? "");
          break;
        case 1:
          viewModel.setArrKod1(result.map((e) => e.toString()).toList().cast<String>() ?? "");
          break;
        case 2:
          viewModel.setArrKod2(result.map((e) => e.toString()).toList().cast<String>() ?? "");
          break;
        case 3:
          viewModel.setArrKod3(result.map((e) => e.toString()).toList().cast<String>() ?? "");
          break;
        case 4:
          viewModel.setArrKod4(result.map((e) => e.toString()).toList().cast<String>() ?? "");
          break;
        case 5:
          viewModel.setArrKod5(result.map((e) => e.toString()).toList().cast<String>() ?? "");
          break;
      }
    }
    return null;
  }
}
