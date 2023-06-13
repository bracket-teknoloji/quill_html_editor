import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/textfield/custom_app_bar_text_field.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';

import '../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../core/init/network/login/api_urls.dart';
import '../model/cari_stok_satis_ozeti_model.dart';
import '../view_model/cari_stok_satis_ozeti_view_model.dart';

class CariStokSatisOzetiView extends StatefulWidget {
  final CariListesiModel? model;
  const CariStokSatisOzetiView({super.key, this.model});

  @override
  State<CariStokSatisOzetiView> createState() => _CariStokSatisOzetiViewState();
}

class _CariStokSatisOzetiViewState extends BaseState<CariStokSatisOzetiView> {
  CariStokSatisOzetiViewModel viewModel = CariStokSatisOzetiViewModel();
  TextEditingController? cariController;
  @override
  void initState() {
    cariController = TextEditingController();
    Future.delayed(Duration.zero, () {
      getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    cariController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return viewModel.searchBar ? const CustomAppBarTextField() : const Text("Cari Stok Satış Özeti");
        }),
        actions: [
          IconButton(onPressed: () async => viewModel.setSearchBar(), icon: const Icon(Icons.search_outlined)),
          IconButton(onPressed: () async {}, icon: const Icon(Icons.sort_by_alpha_outlined)),
          IconButton(onPressed: () async {}, icon: const Icon(Icons.filter_alt_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          return Column(
            children: [
              CustomTextField(labelText: "Cari", isMust: true, controller: cariController, suffix: const Icon(Icons.more_horiz_outlined), onTap: () => getData()),
              viewModel.modelList != null
                  ? (viewModel.modelList!.isNotEmpty
                      ? SizedBox(
                          height: context.dynamicHeight(0.8),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.modelList?.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(viewModel.modelList?[index].stokAdi ?? ""),
                                  subtitle: Text(viewModel.modelList?[index].stokKodu ?? ""),
                                  trailing: Text(viewModel.modelList?[index].miktar.toStringIfNull ?? ""),
                                  onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: [
                                    BottomSheetModel(
                                        title: "Cari Stok Satış Hareketleri",
                                        iconWidget: Icons.inventory,
                                        onTap: () => Get.toNamed("/mainPage/stokHareketleri", arguments: viewModel.modelList?[index].stokKodu)),
                                    BottomSheetModel(title: "Stok İşlemleri", iconWidget: Icons.inventory, onTap: () {}),
                                  ]),
                                ),
                              );
                            },
                          ),
                        )
                      : const Center(child: Text("Sonuç Bulunamadı")))
                  : const Center(child: CircularProgressIndicator()),
            ],
          );
        }),
      ),
    );
  }

  void getData() async {
    var cari = widget.model ?? await Get.toNamed("mainPage/cariListesi", arguments: true) as CariListesiModel?;

    if (cari != null) {
      cariController?.text = cari.cariAdi ?? "";
      var result = await networkManager.dioGet<CariStokSatisOzetiModel>(
          path: ApiUrls.getFaturaKalemleri,
          bodyModel: CariStokSatisOzetiModel(),
          queryParameters: {"CariKodu": cari.cariKodu, "SIRALAMA": "STOK_ADI_AZ", "EkranTipi": "L", "FiltreKodu": 1, "PickerBelgeTuru": "", "BelgeNo": ""});
      if (result.data != null) {
        print(result.data);
        viewModel.setModelList(result.data.map((e) => e as CariStokSatisOzetiModel).toList().cast<CariStokSatisOzetiModel>());
      }
    }
  }
}
