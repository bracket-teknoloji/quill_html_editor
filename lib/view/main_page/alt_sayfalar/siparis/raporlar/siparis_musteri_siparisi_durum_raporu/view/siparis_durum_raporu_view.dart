import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparisler/model/siparis_edit_request_model.dart";
import "../view_model/siparis_durum_raporu_view_model.dart";

class SiparisDurumRaporuView extends StatefulWidget {
  final EditTipiEnum editTipiEnum;
  const SiparisDurumRaporuView({super.key, required this.editTipiEnum});

  @override
  State<SiparisDurumRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<SiparisDurumRaporuView> {
  late final SiparisDurumRaporuViewModel viewModel;
  late final ScrollController scrollController;
  late final TextEditingController belgeNoController;
  late final TextEditingController stokController;
  late final TextEditingController cariController;
  late final TextEditingController gorunecekAlanlarController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController searchBarController;
  late final FocusNode focusNode;

  @override
  void initState() {
    viewModel = SiparisDurumRaporuViewModel(widget.editTipiEnum);
    belgeNoController = TextEditingController();
    stokController = TextEditingController();
    cariController = TextEditingController();
    gorunecekAlanlarController = TextEditingController();
    baslangicTarihiController = TextEditingController(text: viewModel.siparislerRequestModel.baslamaTarihi ?? "");
    bitisTarihiController = TextEditingController(text: viewModel.siparislerRequestModel.bitisTarihi ?? "");
    searchBarController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        await Future.delayed(const Duration(milliseconds: 500), getData);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => filterBottomSheet());
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    stokController.dispose();
    cariController.dispose();
    gorunecekAlanlarController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    searchBarController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomTextField(labelText: "Ara", controller: searchBarController, onChanged: (p0) => viewModel.setSearchKey(p0), focusNode: focusNode);
            }
            return AppBarTitle(title: "${widget.editTipiEnum.getName} (${viewModel.kalemListComputed?.length ?? 0})");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.setSearchBar();
              if (!viewModel.searchBar) {
                viewModel.setSearchKey(null);
                searchBarController.clear();
              } else {
                focusNode.requestFocus();
              }
            },
            icon: Observer(
              builder: (_) {
                if (viewModel.searchBar) {
                  return const Icon(Icons.search_off_outlined);
                }
                return const Icon(Icons.search_outlined);
              },
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              onPressed: filterBottomSheet,
              child: Text(loc.generalStrings.filter),
            ),
            AppBarButton(
              child: Text(loc.generalStrings.sort),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.sort,
                  children: List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.values.toList()[index])),
                );
                if (result != null) {
                  viewModel.setSiralama(result);
                  viewModel.resetSayfa();
                  viewModel.setKalemList(null);
                  getData();
                }
              },
            ),
            AppBarButton(
              child: Text(loc.generalStrings.refresh),
              onPressed: () {
                viewModel.setKalemList(null);
                getData();
              },
            ),
          ],
        ),
      );

  Widget body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setKalemList(null);
          viewModel.resetSayfa();
          getData();
        },
        child: Observer(
          builder: (_) => viewModel.kalemListComputed.ext.isNullOrEmpty
              ? viewModel.kalemListComputed != null
                  ? const Center(child: Text("Sonuç Bulunamadı."))
                  : const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  itemCount: (viewModel.kalemListComputed?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index != viewModel.kalemListComputed?.length) {
                      final KalemModel? kalemModel = viewModel.kalemListComputed?[index];
                      return siparisDurumListTile(kalemModel, context);
                    }
                    return Observer(builder: (_) => Visibility(visible: viewModel.dahaVarMi, child: const Center(child: CircularProgressIndicator.adaptive())));
                  },
                ),
        ),
      );

  Card siparisDurumListTile(KalemModel? kalemModel, BuildContext context) => Card(
        child: ListTile(
          title: Column(
            children: [
              Text(kalemModel?.stokAdi ?? ""),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(kalemModel?.cariAdi ?? ""),
              Text(kalemModel?.belgeNo ?? "").yetkiVarMi(viewModel.gorunecekAlanlarMap["Belge No"] ?? false),
              Text("Stok kodu: ${kalemModel?.stokKodu ?? ""}").yetkiVarMi(viewModel.gorunecekAlanlarMap["Stok"] ?? false),
              Text(kalemModel?.cariKodu ?? ""),
              Wrap(
                children: [
                  Text("Cari kodu: ${kalemModel?.cariKodu ?? ""}").yetkiVarMi(viewModel.gorunecekAlanlarMap["Cari"] ?? false),
                  Text("Net tutar: ${kalemModel?.netFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                  Text("Miktar: ${kalemModel?.miktar.toIntIfDouble ?? "0"}"),
                  Text("Kalan miktar: ${kalemModel?.kalan.toIntIfDouble ?? "0"}"),
                  Text("Döviz kuru: ${kalemModel?.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                  Text("Döviz cinsi: ${(kalemModel?.miktar ?? 0) - (kalemModel?.kalan ?? 0)}"),
                ].map((e) => SizedBox(width: width / 2.4, child: e)).toList(),
              ),
            ],
          ),
          onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              BottomSheetModel(
                title: "Belgeyi Görüntüle",
                iconWidget: Icons.search_outlined,
                onTap: () {
                  Get.back();
                  return Get.toNamed(
                    "mainPage/siparisEdit",
                    arguments: BaseEditModel(model: SiparisEditRequestModel.fromKalemModel(kalemModel!), baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: widget.editTipiEnum),
                  );
                },
              ),
              BottomSheetModel(
                title: "Stok İşlemleri",
                iconWidget: Icons.list_alt_outlined,
                onTap: () => dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = kalemModel?.stokKodu ?? ""),
              ),
              BottomSheetModel(
                title: "Cari İşlemleri",
                iconWidget: Icons.person_2_outlined,
                onTap: () => dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = kalemModel?.cariKodu ?? ""),
              ),
            ],
          ),
          onLongPress: () => dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = kalemModel?.cariKodu ?? ""),
        ),
      );

  Future filterBottomSheet() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaporFiltreDateTimeBottomSheetView(
            filterOnChanged: (int? index) {
              viewModel.setBaslamaTarihi(baslangicTarihiController.text != "" ? baslangicTarihiController.text : null);
              viewModel.setBitisTarihi(bitisTarihiController.text != "" ? bitisTarihiController.text : null);
            },
            baslangicTarihiController: baslangicTarihiController,
            bitisTarihiController: bitisTarihiController,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Belge No",
                  readOnly: true,
                  suffixMore: true,
                  controller: belgeNoController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.siparislerRequestModel.belgeNo ?? "")),
                  onTap: () async {
                    final result = await Get.toNamed(widget.editTipiEnum.getRoute, arguments: true);
                    if (result is BaseSiparisEditModel) {
                      belgeNoController.text = result.belgeNo ?? "";
                      viewModel.setBelgeNo(result.belgeNo);
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Stok",
                  readOnly: true,
                  suffixMore: true,
                  controller: stokController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.siparislerRequestModel.referansStokKodu ?? "")),
                  onClear: () {
                    viewModel.setStokKodu(null);
                    stokController.clear();
                  },
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                    if (result is StokListesiModel) {
                      stokController.text = result.stokAdi ?? "";
                      viewModel.setStokKodu(result.stokKodu);
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Cari",
                  readOnly: true,
                  suffixMore: true,
                  controller: cariController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.siparislerRequestModel.cariKodu ?? "")),
                  suffix: IconButton(
                    onPressed: () {
                      if (viewModel.siparislerRequestModel.cariKodu != null) {
                        dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = viewModel.siparislerRequestModel.cariKodu);
                      } else {
                        dialogManager.showAlertDialog("Cari Kodu Boş Olamaz");
                      }
                    },
                    icon: const Icon(Icons.data_exploration_outlined, color: UIHelper.primaryColor),
                  ),
                  onClear: () {
                    viewModel.setCariKodu(null);
                    cariController.clear();
                  },
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                    if (result is CariListesiModel) {
                      cariController.text = result.cariAdi ?? "";
                      viewModel.setCariKodu(result.cariKodu);
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Görünecek Alanlar",
                  readOnly: true,
                  suffixMore: true,
                  controller: gorunecekAlanlarController,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
                      context,
                      title: "Görünecek Alanlar",
                      groupValues: viewModel.gorunecekAlanlarMap.values.toList(),
                      children: List.generate(
                        viewModel.gorunecekAlanlarMap.length,
                        (index) => BottomSheetModel(title: viewModel.gorunecekAlanlarMap.keys.toList()[index], value: viewModel.gorunecekAlanlarMap.keys.toList()[index]),
                      ),
                    );
                    if (result != null) {
                      gorunecekAlanlarController.text = result.join(", ");
                      for (final item in result) {
                        if (viewModel.gorunecekAlanlarMap.containsKey(item)) {
                          //other values false
                          for (final key in viewModel.gorunecekAlanlarMap.keys) {
                            if (!result.contains(key)) {
                              viewModel.gorunecekAlanlarMap[key] = false;
                            }
                          }
                          viewModel.gorunecekAlanlarMap[item] = true;
                        }
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          Observer(
            builder: (_) => SlideControllerWidget(
              title: "Karşılanma Durumu",
              groupValue: viewModel.karsilanmaGroupValue,
              childrenTitleList: const ["Tümü", "Kalanlar", "Tamamlananlar"],
              childrenValueList: const [1, 2, 3],
              filterOnChanged: (int? index) => viewModel.setKarsilanmaGroupValue(index ?? 0),
            ),
          ),
          Observer(
            builder: (_) => SlideControllerWidget(
              title: "Sipariş Durumu",
              groupValue: viewModel.durumGroupValue,
              childrenTitleList: const ["Tümü", "Açık", "Kapalı"],
              childrenValueList: const [1, 2, 3],
              filterOnChanged: (int? index) => viewModel.setDurumGroupValue(index ?? 0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.setKalemList(null);
              getData();
              Get.back();
            },
            child: Text(loc.generalStrings.apply),
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
  }

  Future<void> getData() async {
    final result = await networkManager.dioGet<KalemModel>(path: ApiUrls.getFaturaKalemleri, bodyModel: KalemModel(), queryParameters: viewModel.siparislerRequestModel.toJson());
    if (result.isSuccess) {
      final List<KalemModel?> kalemList = result.dataList;
      if (viewModel.siparislerRequestModel.sayfa == 1) {
        viewModel.setKalemList(kalemList);
      } else {
        viewModel.addKalemList(kalemList);
      }
      if (kalemList.length < parametreModel.sabitSayfalamaOgeSayisi) {
        viewModel.setDahaVarMi(false);
      } else {
        viewModel.increaseSayfa();
        viewModel.setDahaVarMi(true);
      }
    }
  }
}
