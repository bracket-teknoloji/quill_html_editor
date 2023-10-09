import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_hareketleri/view_model/kasa_hareketleri_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_listesi/model/kasa_listesi_model.dart";

class KasaHareketleriView extends StatefulWidget {
  const KasaHareketleriView({super.key, this.model});

  final KasaListesiModel? model;

  @override
  State<KasaHareketleriView> createState() => _KasaHareketleriViewState();
}

class _KasaHareketleriViewState extends BaseState<KasaHareketleriView> {
  KasaHareketleriViewModel viewModel = KasaHareketleriViewModel();
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    viewModel.setKasaKodu(widget.model?.kasaKodu);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrollDown(true);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return AppBarTitle(title: "Kasa Hareketleri (${viewModel.kasaIslemleriListesi?.length ?? 0})", subtitle: widget.model?.kasaKodu);
        }),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async => await viewModel.resetPage(),
        child: Observer(builder: (_) {
          if (viewModel.kasaIslemleriListesi.ext.isNullOrEmpty) {
            if (viewModel.kasaIslemleriListesi != null) {
              return const Center(child: Text("Kasa hareketi bulunamadı."));
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          }
          return Observer(builder: (_) {
            return ListView.builder(
              padding: UIHelper.lowPadding,
              primary: false,
              controller: _scrollController,
              shrinkWrap: false,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: viewModel.kasaIslemleriListesi != null ? ((viewModel.kasaIslemleriListesi?.length ?? 0) + (viewModel.dahaVarMi ? 1 : 0)) : 0,
              itemBuilder: (context, index) {
                if (index == (viewModel.kasaIslemleriListesi?.length ?? 0)) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                var item = viewModel.kasaIslemleriListesi?[index];
                return Card(
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text("${item?.tarih.toDateString ?? ""} "),
                            ColorfulBadge(
                              label: Text((item?.tipAciklama ?? "")),
                              badgeColorEnum: BadgeColorEnum.tipAciklama,
                            ).yetkiVarMi(item?.tipAciklama != null),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Wrap(
                      children: [
                        Text("Kasa: ${item?.kasaKodu ?? ""}").yetkiVarMi(item?.kasaKodu != null),
                        Text("Belge No: ${item?.belgeNo ?? ""}").yetkiVarMi(item?.belgeNo != null),
                        Text("Hesap Kodu: ${item?.cariKodu ?? ""}").yetkiVarMi(item?.cariKodu != null),
                        Text("Hesap Adı: ${item?.cariAdi ?? ""}").yetkiVarMi(item?.cariAdi != null),
                        Text("Proje: ${item?.projeKodu ?? ""}").yetkiVarMi(item?.projeKodu != null),
                        Text("Plasiyer: ${item?.plasiyerKodu ?? ""}").yetkiVarMi(item?.plasiyerKodu != null),
                        Text("Açıklama: ${item?.aciklama ?? ""}").yetkiVarMi(item?.aciklama != null),
                      ].whereType<Text>().toList().map((e) => SizedBox(width: width * 0.5, child: e)).toList(),
                    ),
                    trailing: Text(
                      "${item?.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} $mainCurrency",
                      style: TextStyle(color: item?.gc == "G" ? Colors.green : Colors.red),
                    ),
                  ),
                );
              },
            );
          });
        }),
      ),
    );
  }
}
