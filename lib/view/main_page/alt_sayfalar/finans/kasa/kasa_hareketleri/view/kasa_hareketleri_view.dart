import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../kasa_listesi/model/kasa_listesi_model.dart";
import "../view_model/kasa_hareketleri_view_model.dart";

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
    viewModel.setDovizAdi(widget.model?.dovizli == "E" ? widget.model?.dovizAdi : mainCurrency);
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
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      bottomNavigationBar: bottomBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Observer(builder: (_) {
        return AppBarTitle(title: "Kasa Hareketleri (${viewModel.kasaIslemleriListesi?.length ?? 0})", subtitle: widget.model?.kasaKodu);
      }),
    );
  }

  Column body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: UIHelper.primaryColor,
          child: Observer(builder: (_) {
            return Text(
                    "Devir Tutarı: ${(widget.model?.dovizli == "E" ? widget.model?.dovizDevirTutari : widget.model?.devirTutari).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}")
                .paddingAll(UIHelper.lowSize)
                .paddingOnly(left: UIHelper.midSize);
          }),
        ).paddingSymmetric(horizontal: UIHelper.lowSize),
        Expanded(
          child: RefreshIndicator.adaptive(
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
                        onTap: () async {
                          await bottomSheetDialogManager.showBottomSheetDialog(context, title: item?.tipAciklama ?? "", children: [
                            BottomSheetModel(
                                title: "Sil",
                                iconWidget: Icons.delete_outline_outlined,
                                onTap: () {
                                  Get.back();
                                  dialogManager.showAreYouSureDialog(() async {
                                    var result = await viewModel.deleteData(item?.inckeyno);
                                    if (result.success == true) {
                                      dialogManager.showSuccessSnackBar("${(result.message) ?? "Başarılı"} ${item?.inckeyno}");
                                      viewModel.kasaIslemleriListesi?.remove(item);
                                    } else {
                                      dialogManager.showErrorSnackBar(result.message ?? "Başarısız");
                                    }
                                  });
                                }),
                          ]);
                        },
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
                            Text("Kasa: ${item?.kasaKodu ?? ""}", style: const TextStyle(color: Colors.grey)).yetkiVarMi(item?.kasaKodu != null),
                            Text("Belge No: ${item?.belgeNo ?? ""}", style: const TextStyle(color: Colors.grey)).yetkiVarMi(item?.belgeNo != null),
                            Text("Hesap Kodu: ${item?.cariKodu ?? ""}").yetkiVarMi(item?.cariKodu != null),
                            Text("Hesap Adı: ${item?.cariAdi ?? ""}").yetkiVarMi(item?.cariAdi != null),
                            Text("Proje: ${item?.projeKodu ?? ""}").yetkiVarMi(item?.projeKodu != null),
                            Text("Plasiyer: ${item?.plasiyerKodu ?? ""}").yetkiVarMi(item?.plasiyerKodu != null),
                            Text("Açıklama: ${item?.aciklama ?? ""}").yetkiVarMi(item?.aciklama != null),
                          ].whereType<Text>().toList().map((e) => SizedBox(width: width * 0.5, child: e)).toList(),
                        ),
                        trailing: Text(
                          "${item?.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${viewModel.dovizAdi}",
                          style: TextStyle(color: item?.gc == "G" ? Colors.green : Colors.red),
                        ),
                      ),
                    );
                  },
                );
              });
            }),
          ),
        ),
      ],
    );
  }

  Observer bottomBar() {
    return Observer(
        builder: (_) => BottomBarWidget(isScrolledDown: viewModel.isScrollDown, children: [
              FooterButton(children: [
                const Text("Gelir"),
                Observer(builder: (_) {
                  if (widget.model?.dovizli == "E") {
                    return Text(
                        "${((viewModel.paramData?["TOPLAM_GELIR_DOVIZ"] as double? ?? 0) + (widget.model?.dovizDevirTutari ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}",
                        style: const TextStyle(color: Colors.green));
                  } else {
                    return Text("${((viewModel.paramData?["TOPLAM_GELIR"] as double? ?? 0) + (widget.model?.devirTutari ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(color: Colors.green));
                  }
                })
              ]),
              FooterButton(children: [
                const Text("Gider"),
                Observer(builder: (_) {
                  if (widget.model?.dovizli == "E") {
                    return Text("${(viewModel.paramData?["TOPLAM_GIDER_DOVIZ"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}",
                        style: const TextStyle(color: Colors.red));
                  } else {
                    return Text("${(viewModel.paramData?["TOPLAM_GIDER"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: Colors.red));
                  }
                })
              ]),
              FooterButton(children: [
                const Text("Bakiye"),
                Observer(
                    builder: (_) => Text(
                        "${(widget.model?.dovizli == "E" ? widget.model?.devirliDovizBakiye : widget.model?.devirliBakiye).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}",
                        style: TextStyle(color: UIHelper.getColorWithValue((widget.model?.dovizli == "E" ? widget.model?.devirliDovizBakiye : widget.model?.devirliBakiye) ?? 0))))
              ])
            ]));
  }
}
