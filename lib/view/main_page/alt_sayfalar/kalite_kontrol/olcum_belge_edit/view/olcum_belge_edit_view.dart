import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_pdf_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/view/view_model/olcum_belge_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class OlcumBelgeEditView extends StatefulWidget {
  final OlcumBelgeModel model;
  const OlcumBelgeEditView({super.key, required this.model});

  @override
  State<OlcumBelgeEditView> createState() => _OlcumBelgeEditViewState();
}

final class _OlcumBelgeEditViewState extends BaseState<OlcumBelgeEditView> {
  final OlcumBelgeEditViewModel viewModel = OlcumBelgeEditViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Ölçüm Detayı",
          subtitle: widget.model.belgeNo,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (viewModel.model?.belge?.firstOrNull?.stokKodu != null) {
                bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: widget.model.belgeNo ?? "",
                  children: [
                    BottomSheetModel(
                      title: "Teknik Resimleri Görüntüle",
                      iconWidget: Icons.picture_as_pdf_outlined,
                      onTap: () async {
                        Get.back();
                        final result = await networkManager.dioGet(
                          path: ApiUrls.getBelgeler,
                          bodyModel: OlcumPdfModel(),
                          showLoading: true,
                          data: viewModel.model?.belge?.firstOrNull?.forTeknikResim,
                        );
                        if (result.success == true) {
                          OlcumPdfModel? selectedItem;
                          final List<OlcumPdfModel> list = (result.data as List).map((e) => e as OlcumPdfModel).toList();
                          if (list.length == 1) {
                            selectedItem = list.first;
                          } else {
                            selectedItem = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              groupValue: null,
                              title: "Teknik Resim Seçiniz",
                              children: List.generate(list.length, (index) {
                                final OlcumPdfModel item = list[index];
                                return BottomSheetModel(title: item.revno ?? "", value: item);
                              }),
                            );
                          }
                          if (selectedItem != null) {
                            final pdfData = await networkManager.getTeknikResimPdf(selectedItem);
                            if (pdfData.data != null) {
                              Get.to(() => GenelPdfView(model: pdfData.data));
                            }
                          }
                        }
                      },
                    ).yetkiKontrol(viewModel.model?.belge?.firstOrNull?.teknikResimVarmi == "E" && yetkiController.sigmaTeknikResim),
                    BottomSheetModel(
                      title: "Kontrol Planlarını Görüntüle",
                      iconWidget: Icons.picture_as_pdf_outlined,
                      onTap: () async {
                        Get.back();
                        final result = await networkManager.dioGet(
                          path: ApiUrls.getBelgeler,
                          bodyModel: OlcumPdfModel(),
                          showLoading: true,
                          data: viewModel.model?.belge?.firstOrNull?.forKontrolPlani,
                        );
                        if (result.success == true) {
                          OlcumPdfModel? selectedItem;
                          final List<OlcumPdfModel> list = (result.data as List).map((e) => e as OlcumPdfModel).toList();
                          if (list.length == 1) {
                            selectedItem = list.first;
                          } else {
                            selectedItem = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              groupValue: null,
                              title: "Kontrol Planı Seçiniz",
                              children: List.generate(list.length, (index) {
                                final OlcumPdfModel item = list[index];
                                return BottomSheetModel(title: item.revno ?? "", value: item);
                              }),
                            );
                          }
                          if (selectedItem != null) {
                            final pdfData = await networkManager.getKontrolPlaniPdf(selectedItem);
                            if (pdfData.data != null) {
                              Get.to(() => GenelPdfView(model: pdfData.data));
                            }
                          }
                        }
                      },
                    ).yetkiKontrol(viewModel.model?.belge?.firstOrNull?.kontrolPlaniVarmi == "E" && yetkiController.sigmaKontrolPlani),
                    BottomSheetModel(
                      title: "Stok İşlemleri",
                      iconWidget: Icons.list_alt_outlined,
                      onTap: () async {
                        Get.back();
                        dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model?.stokKodu)));
                      },
                    ).yetkiKontrol(yetkiController.stokListesi),
                    BottomSheetModel(
                      title: "Depo Transferi",
                      iconWidget: Icons.transform_outlined,
                      onTap: () async {
                        Get.back();
                        if (viewModel.model?.olcumler.ext.isNullOrEmpty == true) {
                          dialogManager.showAlertDialog("Ölçüm giriniz.");
                          return;
                        }
                        final result = await Get.toNamed(
                          "/mainPage/transferEdit",
                          arguments: BaseEditModel<BaseSiparisEditModel>(
                            baseEditEnum: BaseEditEnum.ekle,
                            editTipiEnum: EditTipiEnum.depoTransferi,
                            model: BaseSiparisEditModel(
                              kalemList: [KalemModel.fromOlcumBelgeModel(viewModel.model?.belge?.firstOrNull)],
                              olcumBelgeRefKey: "${viewModel.model?.belge?.firstOrNull?.belgeTipi}.${viewModel.model?.belge?.firstOrNull?.belgeNo}.${viewModel.model?.belge?.firstOrNull?.sira}",
                            ),
                          ),
                        );
                      },
                    ).yetkiKontrol(AccountModel.instance.isDebug),
                  ].nullCheckWithGeneric,
                );
              }
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
        isScrolledDown: true && yetkiController.sigmaOlcumKaydet,
        onPressed: () async {
          final result = await Get.toNamed("/mainPage/olcumEkle", arguments: viewModel.model?.copyWith(yapkod: widget.model.yapkod, opkodu: widget.model.opkodu));
          if (result != null) {
            await viewModel.getData();
          }
        },
      );

  Observer body() => Observer(
        builder: (_) {
          if (viewModel.model == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${viewModel.belgeModel?.stokAdi}").yetkiVarMi(viewModel.belgeModel?.stokAdi != null),
                      ColorfulBadge(
                        label: Text("DAT Kaydı (${viewModel.belgeModel?.datKayitSayisi})"),
                        badgeColorEnum: BadgeColorEnum.cari,
                      ).yetkiVarMi(viewModel.belgeModel?.datKayitSayisi != null),
                    ],
                  ),
                  subtitle: CustomLayoutBuilder(
                    splitCount: 2,
                    children: [
                      Text("Belge Tipi: ${viewModel.belgeModel?.belgeTipi}").yetkiVarMi(viewModel.belgeModel?.belgeTipi != null),
                      Text("Stok Kodu: ${viewModel.belgeModel?.stokKodu}").yetkiVarMi(viewModel.belgeModel?.stokKodu != null),
                      Text("Tarih: ${viewModel.belgeModel?.tarih.toDateString}").yetkiVarMi(viewModel.belgeModel?.tarih != null),
                      Text("Miktar: ${viewModel.belgeModel?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(viewModel.belgeModel?.miktar != null),
                    ],
                  ),
                ),
              ),
              // const Text("Prosesler").paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.model?.prosesler.ext.isNotNullOrEmpty ?? false),
              // Expanded(
              //   flex: 2,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: viewModel.model?.prosesler?.length ?? 0,
              //     itemBuilder: (context, index) {
              //       final item = viewModel.model?.prosesler?[index];
              //       return Card(
              //         child: SizedBox(
              //           width: context.width * 0.8,
              //           height: 300,
              //           child: ListTile(
              //             title: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(item?.proses ?? ""),
              //                 const Icon(Icons.engineering_outlined),
              //               ],
              //             ),
              //             subtitle: Wrap(
              //               children: [
              //                 Text("Kriter: ${item?.kriter}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.kriter != null),
              //                 CustomLayoutBuilder(
              //                   splitCount: 2,
              //                   children: [
              //                     Text("Kabul Şartı: ${item?.kabulSarti}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.kabulSarti != null),
              //                     Text("Tolerans: ${item?.tolerans}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.tolerans != null),
              //                     Text("Ölçüm Sıklığı: ${item?.olcumSikligi}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.olcumSikligi != null),
              //                     Text("Ekipman: ${item?.ekipman}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.ekipman != null),
              //                     Text("Numune Miktarı: ${item?.numuneMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", overflow: TextOverflow.ellipsis)
              //                         .yetkiVarMi(item?.numuneMiktari != null),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ).yetkiVarMi(viewModel.model?.prosesler.ext.isNotNullOrEmpty ?? false),
              const Text("Ölçümler").paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false),
              Expanded(
                flex: 7,
                child: RefreshIndicator.adaptive(
                  onRefresh: () async {
                    viewModel.getOlcumler();
                  },
                  child: Observer(
                    builder: (_) => viewModel.model?.olcumler?.isEmptyOrNull == true
                        ? viewModel.model?.olcumler != null
                            ? const Center(
                                child: Text("Ölçüm kaydı bulunamadı"),
                              )
                            : const ListViewShimmer()
                        : ListView.builder(
                            itemCount: viewModel.model?.olcumler?.length ?? 0,
                            itemBuilder: (context, index) {
                              final item = viewModel.model?.olcumler?[index];
                              final String title = "Ölçüm ${index + 1}";
                              return Card(
                                child: ListTile(
                                  onTap: () async {
                                    bottomSheetDialogManager.showBottomSheetDialog(
                                      context,
                                      title: title,
                                      children: [
                                        BottomSheetModel(
                                          title: loc.generalStrings.view,
                                          iconWidget: Icons.preview_outlined,
                                          onTap: () async {
                                            Get.back();
                                            final newModel = await viewModel.getProsesler(item?.id);
                                            if (!newModel.isEmptyOrNull) {
                                              Get.toNamed(
                                                "/mainPage/olcumGoruntule",
                                                arguments: viewModel.model?.copyWith(
                                                  prosesler: newModel,
                                                  yapkod: widget.model.yapkod,
                                                  opkodu: widget.model.opkodu,
                                                  kayitOperator: item?.kayitOperator,
                                                  kayitOperatorKodu: item?.kayitOperatorKodu,
                                                  seriNo: item?.seriNo,
                                                ),
                                              );
                                            }
                                          },
                                        ).yetkiKontrol(yetkiController.sigmaOlcumGirisi),
                                        BottomSheetModel(
                                          title: loc.generalStrings.edit,
                                          iconWidget: Icons.edit_outlined,
                                          onTap: () async {
                                            Get.back();
                                            final newModel = await viewModel.getProsesler(item?.id);
                                            if (!newModel.isEmptyOrNull) {
                                              final result = await Get.toNamed(
                                                "/mainPage/olcumDuzenle",
                                                arguments: viewModel.model?.copyWith(
                                                  prosesler: newModel,
                                                  yapkod: widget.model.yapkod,
                                                  opkodu: widget.model.opkodu,
                                                  kayitOperator: item?.kayitOperator,
                                                  kayitOperatorKodu: item?.kayitOperatorKodu,
                                                  seriNo: item?.seriNo,
                                                ),
                                              );
                                              if (result != null) {
                                                await viewModel.getData();
                                              }
                                            }
                                          },
                                        ).yetkiKontrol(yetkiController.sigmaOlcumDuzelt),
                                        BottomSheetModel(
                                          title: loc.generalStrings.delete,
                                          iconWidget: Icons.delete_outline_outlined,
                                          onTap: () async {
                                            Get.back();
                                            dialogManager.showAreYouSureDialog(() async {
                                              final result = await viewModel.deleteOlcum(item?.id);
                                              if (result?.success == true) {
                                                dialogManager.showSuccessSnackBar(result?.message ?? loc.generalStrings.success);
                                                await viewModel.getData();
                                              }
                                            });
                                          },
                                        ).yetkiKontrol(yetkiController.sigmaOlcumGirSil),
                                      ].nullCheckWithGeneric,
                                    );
                                  },
                                  title: Text(title),
                                  subtitle: CustomLayoutBuilder(
                                    splitCount: 2,
                                    children: [
                                      Text("Kaydeden: ${item?.kayityapankul}").yetkiVarMi(item?.kayityapankul != null),
                                      Text("Kayıt Tarihi: ${item?.kayittarihi?.toDateString}").yetkiVarMi(item?.kayittarihi != null),
                                      Text("Operatör: ${item?.olcumlerOperator}").yetkiVarMi(item?.olcumlerOperator != null),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).yetkiVarMi(viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false),
                  ),
                ),
              ),
            ],
          ).paddingAll(UIHelper.lowSize);
        },
      );

  Future<void> showDatBottomSheetDialog(BuildContext context) async {
    await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "DAT Listesi", groupValue: null);
  }
}
