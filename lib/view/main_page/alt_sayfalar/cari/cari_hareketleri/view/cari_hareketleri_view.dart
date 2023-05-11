import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/core/components/button/elevated_buttons/footer_button.dart';
import 'package:picker/core/components/card/cari_hareketler_card.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/view_model/cari_hareketleri_view_model.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../cari_listesi/model/cari_listesi_model.dart';

class CariHareketleriView extends StatefulWidget {
  final CariListesiModel? cari;
  const CariHareketleriView({super.key, this.cari});

  @override
  State<CariHareketleriView> createState() => _CariHareketleriViewState();
}

class _CariHareketleriViewState extends BaseState<CariHareketleriView> {
  CariHareketleriViewModel viewModel = CariHareketleriViewModel();
  ScrollController? scrollController;
  TextEditingController? searchController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    searchController = TextEditingController();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.dispose();
    searchController?.dispose();
  }

  void init() async {
    viewModel.setCariHareketleri(await getData());
    scrollController?.addListener(() {
      if (scrollController!.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeScrollDown(true);
      }
      if (scrollController!.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeScrollDown(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        bottomNavigationBar: bottomButtonBar(),
        body: Snap(
          controller: scrollController!.appBar,
          child: RefreshIndicator(
            onRefresh: () async {
              viewModel.setCariHareketleri(null);
              return getData().then((value) => viewModel.setCariHareketleri(value));
            },
            child: Observer(
              builder: (_) => (viewModel.cariHareketleriList.isNullOrEmpty
                  ? (viewModel.cariHareketleriList?.isEmpty ?? false)
                      ? const Center(child: Text("Cari Bulunamadı"))
                      : const Center(child: CircularProgressIndicator())
                  : Observer(builder: (_) {
                      return ListView.builder(
                        primary: false,
                        controller: scrollController,
                        itemCount: viewModel.cariHareketleriList != null ? viewModel.cariHareketleriList!.length : 0,
                        itemBuilder: (context, index) {
                          return CariHareketlerCard(
                            cariHareketleriModel: viewModel.cariHareketleriList![index],
                            onTap: () {
                              var children2 = [
                                BottomSheetModel(iconWidget: Icons.view_comfy_outlined, title: "Görüntüle", onTap: () {}),
                                BottomSheetModel(iconWidget: Icons.display_settings_outlined, title: "İşlemler", onTap: () {}),
                                BottomSheetModel(iconWidget: Icons.picture_as_pdf_outlined, title: "PDF Görüntüle", onTap: () {}),
                              ];
                              if (viewModel.cariHareketleriList![index].dovizBorc == null && viewModel.cariHareketleriList![index].dovizAlacak == null) {
                                children2.add(BottomSheetModel(iconWidget: Icons.picture_as_pdf_outlined, title: "Tahsilat Makbuzu", onTap: () {}));
                              }
                              bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: children2);
                            },
                          );
                        },
                      );
                    })),
            ),
          ),
        )
        // : Observer(builder: (_) {
        // var list = viewModel.cariHareketleriList;

        );
  }

  Widget fab() {
    // scrollController?.appBar.setPinState(false);
    return Observer(builder: (_) {
      return Visibility(visible: viewModel.isScrollDown, child: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add_outlined)));
    });
  }

  ScrollAppBar appBar(BuildContext context) {
    Platform.isLinux || Platform.isWindows || Platform.isMacOS ? scrollController?.appBar.setPinState(true) : scrollController?.appBar.setPinState(false);
    return ScrollAppBar(
      materialType: MaterialType.transparency,
      backgroundColor: Colors.transparent,
      controller: scrollController!,
      title: Observer(
          builder: (_) => viewModel.isSearchBarOpened
              ? SizedBox(
                  height: kToolbarHeight * 0.9,
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "Daha eklemedim :)",
                    ),
                  ).marginAll(5),
                )
              : AppBarTitle(
                  title: "Cari Hareketleri ${viewModel.cariHareketleriList?.isNotEmpty ?? false ? '(${viewModel.cariHareketleriList!.length})' : ''}",
                  subtitle: widget.cari?.cariAdi.toString() ?? "",
                )),
      leading: viewModel.isSearchBarOpened
          ? IconButton(
              onPressed: () {
                viewModel.changeSearchBar();
              },
              icon: const Icon(Icons.arrow_back))
          : null,
      actions: [
        IconButton(onPressed: () {
          viewModel.changeSearchBar();
        }, icon: Observer(builder: (_) {
          return Icon(viewModel.isSearchBarOpened ? Icons.search_off_outlined : Icons.search_outlined);
        }))
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: SizedBox(
          height: height * 0.07,
          child: ListView(
              shrinkWrap: true,
              itemExtent: width * 0.33,
              scrollDirection: Axis.horizontal,
              children: [
                AppBarButton(onPressed: () {}, icon: Icons.tune_outlined, child: const Text("Cari İşlemleri")),
                AppBarButton(
                    icon: Icons.sort_by_alpha_outlined,
                    onPressed: () async {
                      var siralama = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Sıralama seçiniz", children: [
                        BottomSheetModel(title: "Tarih (Eskiden-Yeniye)", onTap: () => Get.back(result: "TARIH_AZ")),
                        BottomSheetModel(title: "Tarih (Yeniden-Eskiye)", onTap: () => Get.back(result: "TARIH_ZA")),
                      ]);
                      if (siralama != viewModel.siralama && siralama != null) {
                        viewModel.setSiralama(siralama!);
                        viewModel.setCariHareketleri(null);
                        return getData().then((value) => viewModel.setCariHareketleri(value));
                      }
                    },
                    child: const Text("Sırala")),
                AppBarButton(
                    icon: Icons.refresh_outlined,
                    child: const Text("Yenile"),
                    onPressed: () {
                      viewModel.setCariHareketleri(null);
                      return getData().then((value) => viewModel.setCariHareketleri(value));
                    }),
              ].map((e) => e.paddingAll(UIHelper.lowSize)).toList()),
        ),
      ),
    );
  }

  SafeArea bottomButtonBar() {
    return SafeArea(
      child: SizedBox(
        height: context.isPortrait ? (height * 0.06) : height * 0.15,
        child: Observer(builder: (_) {
          return Row(
            children: [
              Expanded(
                  child: FooterButton(children: [
                const Text("Borç"),
                Observer(builder: (_) {
                  return Text("${viewModel.borclarToplami.dotSeparatedWithFixedDigits} TL");
                })
              ])),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: FooterButton(children: [const Text("Alacak"), Text("${viewModel.alacaklarToplami.dotSeparatedWithFixedDigits} TL")])),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                  child: FooterButton(children: [
                const Text("Tahsil Edilecek"),
                Text(
                  "${(viewModel.borclarToplami - viewModel.alacaklarToplami).dotSeparatedWithFixedDigits} TL",
                  style: TextStyle(color: (viewModel.borclarToplami - viewModel.alacaklarToplami) < 0 ? Colors.red : Colors.green),
                )
              ]))
            ],
          );
        }),
      ),
    );
  }

  bool getFilter(CariHareketleriModel model, String filter) {
    return model.belgeNo!.toLowerCase().contains(filter.toLowerCase()) ||
        model.hareketAciklama!.toLowerCase().contains(filter.toLowerCase()) ||
        model.aciklama!.toLowerCase().contains(filter.toLowerCase());
    // ("${"("})").toLowerCase().contains(filter.toLowerCase());
  }

  Future<List<CariHareketleriModel>> getData() async {
    var response = await networkManager.dioGet<CariHareketleriModel>(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      addTokenKey: true,
      queryParameters: {"SIRALAMA": viewModel.siralama, "EkranTipi": "L", "CariKodu": widget.cari?.cariKodu ?? ""},
      addSirketBilgileri: true,
    );
    // setState(() {});
    return (response.data).map((e) => e as CariHareketleriModel).toList().cast<CariHareketleriModel>();
  }
}
