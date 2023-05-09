import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/core/components/button/elevated_buttons/footer_button.dart';
import 'package:picker/core/components/card/cari_hareketler_card.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
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
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.dispose();
  }

  void init() async {
    viewModel.setCariHareketleri(await getData());
  }

  @override
  Widget build(BuildContext context) {
    viewModel.resetAlacaklarBorclar();
    return Scaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        bottomNavigationBar: bottomButtonBar(),
        body: Observer(
          builder: (_) => (viewModel.cariHareketleriList.isNullOrEmpty
              ? (viewModel.cariHareketleriList?.isEmpty ?? false)
                  ? const Center(child: Text("Cari Bulunamadı"))
                  : const Center(child: CircularProgressIndicator())
              : Observer(builder: (_) {
                  return ListView.builder(
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
        )
        // : Observer(builder: (_) {
        // var list = viewModel.cariHareketleriList;

        );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      onPressed: () {},
      child: ValueListenableBuilder<bool>(
        valueListenable: scrollController!.appBar.pinNotifier,
        child: const Icon(Icons.add),
        builder: (context, value, child) {
          if (!value) return child!;
          return Transform.rotate(angle: pi / 2, child: child);
        },
      ),
    );
  }

  ScrollAppBar appBar(BuildContext context) {
    Platform.isLinux || Platform.isWindows || Platform.isMacOS ? scrollController?.appBar.setPinState(true) : scrollController?.appBar.setPinState(false);
    return ScrollAppBar(
      controller: scrollController!,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Observer(builder: (_) => Text("Cari Hareketleri ${viewModel.cariHareketleriList?.isNotEmpty ?? false ? '(${viewModel.cariHareketleriList!.length})' : ''}")),
          Text(
            widget.cari?.cariAdi.toString() ?? "",
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: SizedBox(
          height: height * 0.07,
          child: ListView(
              shrinkWrap: true,
              itemExtent: width * 0.33,
              scrollDirection: Axis.horizontal,
              children: [
                AppBarButton(child: const Text("Cari İşlemleri"), onPressed: () {}),
                AppBarButton(
                    child: const Text("Sırala"),
                    onPressed: () async {
                      var siralama = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Sıralama seçiniz", children: [
                        BottomSheetModel(title: "Tarih (Eskiden-Yeniye)", onTap: () => Get.back(result: "TARIH_AZ")),
                        BottomSheetModel(title: "Tarih (Yeniden-Eskiye)", onTap: () => Get.back(result: "TARIH_ZA")),
                      ]);
                      if (siralama != viewModel.siralama && siralama != null) {
                        viewModel.setSiralama(siralama!);
                        viewModel.setCariHareketleri(null);
                        getData().then((value) => viewModel.setCariHareketleri(value));
                      }
                    }),
                AppBarButton(
                    child: const Text("Yenile"),
                    onPressed: () async {
                      viewModel.setCariHareketleri(null);
                      getData().then((value) => viewModel.setCariHareketleri(value));
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
        child: Row(
          children: [
            Expanded(child: FooterButton(children: [const Text("borç"), Text("${viewModel.borclar?.dotSeparatedWithFixedDigits} TL")])),
            Expanded(child: FooterButton(children: [const Text("Alacak"), Text("${viewModel.alacaklar?.dotSeparatedWithFixedDigits} TL")])),
            Expanded(
                child: FooterButton(children: [
              const Text("Tahsil Edilecek"),
              Text(
                "${(viewModel.borclar! - viewModel.alacaklar!).dotSeparatedWithFixedDigits} TL",
                style: TextStyle(color: (viewModel.borclar! - viewModel.alacaklar!) < 0 ? Colors.red : Colors.green),
              )
            ]))
          ],
        ),
      ),
    );
  }

  Future<List<CariHareketleriModel>> getData() async {
    viewModel.resetAlacaklarBorclar();
    var response = await networkManager.dioGet<CariHareketleriModel>(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      addTokenKey: true,
      queryParameters: {"SIRALAMA": viewModel.siralama, "EkranTipi": "L", "CariKodu": widget.cari?.cariKodu ?? ""},
      addSirketBilgileri: true,
    );
    double toplamBorc = 0.0;
    double toplamAlacak = 0.0;
    response.data?.forEach((element) {
      toplamAlacak += element.alacak ?? 0.0;
      toplamBorc += element.borc ?? 0.0;
    });
    viewModel.addAlacaklar(toplamAlacak);
    viewModel.addBorclar(toplamBorc);
    setState(() {});
    return (response.data).map((e) => e as CariHareketleriModel).toList().cast<CariHareketleriModel>();
  }
}
