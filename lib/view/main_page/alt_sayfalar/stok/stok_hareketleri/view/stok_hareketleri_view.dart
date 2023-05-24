import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart';
import '../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart';
import '../../../../../../core/components/wrap/appbar_title.dart';
import '../model/stok_hareketleri_model.dart';
import '../view_model/stok_hareketleri_view_model.dart';

class StokHareketleriView extends StatefulWidget {
  final StokListesiModel? model;
  const StokHareketleriView({super.key, this.model});

  @override
  State<StokHareketleriView> createState() => _StokHareketleriViewState();
}

class _StokHareketleriViewState extends BaseState<StokHareketleriView> {
  StokHareketleriViewModel viewModel = StokHareketleriViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.setFuture(getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: fab(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Observer(
          builder: (_) => viewModel.searchBar
              ? SizedBox(
                  height: kToolbarHeight * 0.9,
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Ara", border: InputBorder.none),
                    onChanged: (value) {
                      viewModel.setStokHareketleri(viewModel.stokHareketleri!.where((element) => element.stokAdi!.toLowerCase().contains(value.toLowerCase())).toList());
                    },
                  ))
              : AppBarTitle(title: "Stok Hareketleri", subtitle: widget.model?.stokAdi ?? "")),
      actions: [
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: [
                BottomSheetModel(
                    iconWidget: viewModel.dovizliFiyat ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                    title: "Dövizli Fiyat Göster",
                    onTap: () {
                      viewModel.changeDovizliFiyat();
                      Get.back();
                    }),
                BottomSheetModel(iconWidget: Icons.visibility_off_outlined, title: "Gizlenecek Alanlar", onTap: () async {}),
              ]);
            },
            icon: const Icon(Icons.more_vert_outlined)),
        IconButton(onPressed: () => viewModel.changeSearchBar(), icon: const Icon(Icons.search_outlined))
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarPreferedSizedBottom(children: [
            AppBarButton(
                child: const Text("Filtrele"),
                onPressed: () async {
                  //TODO! viewModel.arrHareketTuru bağla
                }),
            AppBarButton(
                child: const Text("Sırala"),
                onPressed: () async {
                  String? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Sırala", children: [
                    BottomSheetModel(title: "Tarih (Artan)", onTap: () => Get.back(result: "TARIH_AZ")),
                    BottomSheetModel(title: "Tarih (Azalan)", onTap: () => Get.back(result: "TARIH_ZA")),
                    BottomSheetModel(title: "Stok Kodu (A-Z)", onTap: () => Get.back(result: "KOD_AZ")),
                    BottomSheetModel(title: "Stok Kodu (Z-A)", onTap: () => Get.back(result: "KOZ_ZA")),
                  ]);
                  if (result != null) {
                    viewModel.setSiralama(result);
                    viewModel.setStokHareketleri(await getData()!);
                  }
                }),
            AppBarButton(
                child: const Text("Yenile"),
                onPressed: () {
                  getData();
                }),
          ])),
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }

  FutureBuilder<dynamic> body() {
    return FutureBuilder(
        future: viewModel.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () async {
                viewModel.setStokHareketleri(await getData()!);
              },
              child: Observer(builder: (_) {
                return viewModel.stokHareketleri.isNullOrEmpty
                    ? const Center(child: Text("Stok Hareket Kaydı Bulunamadı."))
                    : RefreshIndicator(
                        onRefresh: () async {
                          viewModel.setStokHareketleri(await getData()!);
                        },
                        child: ListView.builder(
                          itemCount: viewModel.stokHareketleri?.length ?? 0,
                          itemBuilder: (context, index) {
                            StokHareketleriModel model = viewModel.stokHareketleri![index];
                            return GestureDetector(
                              onTap: () async {
                                await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: [
                                  BottomSheetModel(title: "Belgeyi Göster"),
                                  BottomSheetModel(title: "Stok İşlemleri"),
                                ]);
                              },
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Wrap(
                                            children: [
                                              Text(model.stharTarih.toDateString()),
                                              model.dovizTipi == 1 ? const Badge(label: Text("Dövizli")) : Container(),
                                            ],
                                          ),
                                        ),
                                        Text(model.fisno ?? ""),
                                      ],
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: "${model.belgeTipiAciklama ?? model.hareketTuruAciklama}  ", style: TextStyle(color: (model.cikisIslemi ?? false) ? Colors.red : Colors.green)),
                                          TextSpan(text: "(${model.hareketTuruAciklama})", style: const TextStyle(color: Colors.white30)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Miktar: ${model.stharGcmik?.toInt() ?? 0}")),
                                        Expanded(child: Text("Depo: ${model.depoKodu ?? ""} (${model.depoAdi ?? ""})")),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Plasiyer: ${model.plasiyerAciklama ?? ""}")),
                                        Expanded(child: Text("KDV %: ${model.stharKdv?.toInt() ?? 0}")),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Net Fiyat: ${(model.stharNf ?? 0).commaSeparatedWithFixedDigits}")),
                                        Expanded(child: Text("Brüt Fiyat: ${(model.stharBf ?? 0).commaSeparatedWithFixedDigits}")),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Net Tutar: ${((model.stharNf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithFixedDigits}")),
                                        Expanded(child: Text("Brüt Tutar: ${((model.stharBf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithFixedDigits}")),
                                      ],
                                    ),
                                  ],
                                ).paddingAll(UIHelper.lowSize),
                              ),
                            );
                          },
                        ).paddingAll(UIHelper.lowSize),
                      );
              }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<List<StokHareketleriModel>>? getData() async {
    viewModel.setFuture(null);
    setState(() {});
    Map<String, dynamic> queryParameters = {"FilterModel": '{"EkranTipi": "L", "siralama": "${viewModel.siralama}", "stokKodu": "${widget.model?.stokKodu ?? ""}"}'};

    var result = await networkManager.dioGet<StokHareketleriModel>(
        path: ApiUrls.getStokHareketleri, bodyModel: StokHareketleriModel(), addCKey: true, addSirketBilgileri: true, queryParameters: queryParameters);
    viewModel.setFuture(Future.value(result.data));
    setState(() {});
    List<StokHareketleriModel> list = result.data.map((e) => e as StokHareketleriModel).toList().cast<StokHareketleriModel>();
    viewModel.setStokHareketleri(list);

    return list;
  }
}
