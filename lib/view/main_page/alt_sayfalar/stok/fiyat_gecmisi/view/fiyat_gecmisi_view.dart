import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/card/stok_fiyat_gecmisi_card.dart';
import 'package:picker/core/components/textfield/custom_app_bar_text_field.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/fiyat_gecmisi/model/fiyat_gecmisi_response_model.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart';
import '../../../../../../core/components/slide_controller/view/slide_controller_view.dart';
import '../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../core/init/network/login/api_urls.dart';
import '../model/fiyat_gecmisi_model.dart';
import '../view_model/fiyat_gecmisi_view_model.dart';

class FiyatGecmisiView extends StatefulWidget {
  const FiyatGecmisiView({super.key});

  @override
  State<FiyatGecmisiView> createState() => _FiyatGecmisiViewState();
}

class _FiyatGecmisiViewState extends BaseState<FiyatGecmisiView> {
  FiyatGecmisiViewModel viewModel = FiyatGecmisiViewModel();
  late TextEditingController searchBarController;
  late TextEditingController dizaynController;
  late TextEditingController yaziciController;
  late TextEditingController baslangicTarihiController;
  late TextEditingController bitisTarihiController;
  late TextEditingController fiyatTipiController;

  @override
  void initState() {
    searchBarController = TextEditingController();
    dizaynController = TextEditingController();
    yaziciController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    fiyatTipiController = TextEditingController();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    dizaynController.dispose();
    yaziciController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    fiyatTipiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return viewModel.searchBar
                ? CustomAppBarTextField(controller: searchBarController, onChanged: (p0) => viewModel.filterModelList(p0))
                : AppBarTitle(title: "Fiyat Geçmişi", subtitle: "${viewModel.modelList?.length ?? 0} kayıt");
          }),
          actions: [
            IconButton(icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)), onPressed: () => viewModel.setSearchBar()),
            IconButton(
                icon: const Icon(Icons.sort_by_alpha_outlined),
                onPressed: () async {
                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Sırala",
                      children: List.generate(viewModel.siralaTitleList.length,
                          (index) => BottomSheetModel(title: viewModel.siralaTitleList[index].title, onTap: () => Get.back(result: viewModel.siralaTitleList[index].value))));
                  if (result != null) {
                    viewModel.model.sirala = result;
                    getData();
                  }
                }),
            IconButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: () async {
                  await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Filtrele",
                      body: Column(
                        children: [
                          RaporFiltreDateTimeBottomSheetView(filterOnChanged: (index) => print(""), baslangicTarihiController: baslangicTarihiController, bitisTarihiController: bitisTarihiController),
                          Observer(builder: (_) {
                            return SlideControllerWidget(
                              title: "Yazdırma Durumu",
                              childrenTitleList: viewModel.yazdirmaDurumuMap.keys.toList(),
                              childrenValueList: viewModel.yazdirmaDurumuMap.values.toList(),
                              filterOnChanged: (index) => viewModel.setYazdirmaGroupValue(index ?? 0),
                              groupValue: viewModel.yazdirmaGroupValue,
                            );
                          }),
                          Observer(builder: (_) {
                            return SlideControllerWidget(
                              title: "Alış/Satış Fiyat Tipi",
                              childrenTitleList: viewModel.alisSatisDurumuMap.keys.toList(),
                              childrenValueList: viewModel.alisSatisDurumuMap.values.toList(),
                              filterOnChanged: (index) => viewModel.setAlisSatisGroupValue(index ?? 0),
                              groupValue: viewModel.alisSatisGroupValue,
                            );
                          }),
                          CustomTextField(
                            labelText: "Fiyat Tipi",
                            readOnly: true,
                            controller: fiyatTipiController,
                            suffixMore: true,
                            onTap: () async {
                              var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                  title: "Fiyat Tipi",
                                  children: List.generate(viewModel.fiyatTipiMap.length,
                                      (index) => BottomSheetModel(title: viewModel.fiyatTipiMap.keys.toList()[index], onTap: () => Get.back(result: viewModel.fiyatTipiMap.values.toList()[index]))));
                              if (result != null) {
                                viewModel.model.fiyatTipi = result;
                                fiyatTipiController.text = viewModel.fiyatTipiMap.keys.toList()[viewModel.fiyatTipiMap.values.toList().indexOf(result)];
                              }
                            },
                          ),
                          Row(children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                                  onPressed: () {
                                    viewModel.model = FiyatGecmisiModel();
                                    baslangicTarihiController.clear();
                                    bitisTarihiController.clear();
                                    fiyatTipiController.clear();
                                    viewModel.yazdirmaGroupValue = "";
                                    viewModel.alisSatisGroupValue = "";
                                    viewModel.model.sirala = "";
                                    Get.back();
                                  },
                                  child: const Text("Temizle")),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.model.baslamaTarihi = baslangicTarihiController.text;
                                    viewModel.model.bitisTarihi = bitisTarihiController.text;
                                    getData();
                                    Get.back();
                                  },
                                  child: const Text("Uygula")),
                            )
                          ])
                        ],
                      ));
                }),
          ],
        ),
        body: Observer(builder: (_) {
          return viewModel.modelList.isNullOrEmpty
              ? (viewModel.modelList?.isEmpty ?? false)
                  ? const Center(child: Text("Kayıt Bulunamadı"))
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
              : ListView.builder(
                  itemCount: (viewModel.filteredModelList?.length ?? 0) + 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                            labelText: "Dizayn",
                            controller: dizaynController,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () {},
                          )),
                          Expanded(
                              child: CustomTextField(
                            labelText: "Yazıcı",
                            controller: yaziciController,
                            suffixMore: true,
                            readOnly: true,
                            onTap: () {},
                          ))
                        ],
                      );
                    }
                    return StokFiyatGecmisiCard(model: viewModel.modelList?[index - 1]);
                  },
                );
        }));
  }

  void getData() async {
    viewModel.setModelList(null);
    var result = await networkManager.dioPost<FiyatGecmisiResponseModel>(path: ApiUrls.getStokFiyatGecmisi, bodyModel: FiyatGecmisiResponseModel(), data: viewModel.model.toJson());
    if (result.success == true) {
      viewModel.setModelList(result.data.map((e) => e as FiyatGecmisiResponseModel).toList().cast<FiyatGecmisiResponseModel>());
    }
  }

  void deleteData(int id, int islemKodu) async {
    var result = await networkManager.dioPost<FiyatGecmisiResponseModel>(path: ApiUrls.savestokFiyatGecmisi, bodyModel: FiyatGecmisiResponseModel(), data: {"ID": id, "ISLEM_KODU": islemKodu});
    if (result.success == true) {
      dialogManager.showSnackBar("Silindi");
      getData();
    }
  }
}
