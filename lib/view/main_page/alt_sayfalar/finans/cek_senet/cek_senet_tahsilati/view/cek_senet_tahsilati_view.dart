import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/enum/cek_senet_listesi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../model/save_cek_senet_model.dart";
import "../view_model/cek_senet_tahsilati_view_model.dart";

class CekSenetTahsilatiView extends StatefulWidget {
  final CekSenetListesiEnum cekSenetListesiEnum;
  final CariListesiModel? cariListesiModel;
  const CekSenetTahsilatiView({super.key, required this.cekSenetListesiEnum, this.cariListesiModel});

  @override
  State<CekSenetTahsilatiView> createState() => _CekSenetTahsilatiViewState();
}

class _CekSenetTahsilatiViewState extends BaseState<CekSenetTahsilatiView> {
  CekSenetTahsilatiViewModel viewModel = CekSenetTahsilatiViewModel();
  late final TextEditingController _girisTarihiController;
  late final TextEditingController _cariController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _girisTarihiController = TextEditingController(text: DateTime.now().toDateString);
    _cariController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel.model.belgeTipi = widget.cekSenetListesiEnum.belgeTipi;
      viewModel.setGirisTarihi(DateTime.now());
      if (widget.cariListesiModel != null) {
        viewModel.setCariKodu(widget.cariListesiModel!);
        _cariController.text = widget.cariListesiModel!.cariAdi ?? "";
        viewModel.setPlasiyerKodu(widget.cariListesiModel!.plasiyerKodu);
        _plasiyerController.text = widget.cariListesiModel!.plasiyerAciklama ?? "";
      } else {
        await getCari();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _girisTarihiController.dispose();
    _cariController.dispose();
    _plasiyerController.dispose();
    _projeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body().paddingAll(UIHelper.lowSize),
        bottomNavigationBar: bottomBar(),
      );

  AppBar appBar() => AppBar(
        title: Text("${widget.cekSenetListesiEnum.title} Tahsilatı"),
        actions: [
          IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc(context).generalStrings.options,
                children: [
                  BottomSheetModel(
                    title: "Serbest Raporlar",
                    iconWidget: Icons.area_chart_outlined,
                    onTap: () async {
                      dialogManager.showCariSerbestRaporlarGridViewDialog();
                    },
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
          IconButton(
            onPressed: () {
              if (viewModel.model.kalemler.ext.isNullOrEmpty) {
                dialogManager.showInfoSnackBar("Lütfen en az 1 adet kayıt ekleyiniz");
                return;
              }
              if (_formKey.currentState?.validate() ?? false) {
                dialogManager.showAreYouSureDialog(() async {
                  viewModel.model.guid = const Uuid().v4();
                  final result = await viewModel.postData();
                  if (result.success ?? false) {
                    dialogManager.showSuccessSnackBar("Kaydedildi");
                    Get.back(result: true);
                  }
                });
              }
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: add,
      );

  WillPopScope body() => WillPopScope(
        onWillPop: () async {
          bool result = false;
          await dialogManager.showAreYouSureDialog(() async => result = true);
          return result;
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: "Giriş Tarihi",
                controller: _girisTarihiController,
                isDateTime: true,
                isMust: true,
                readOnly: true,
                onTap: getTarih,
              ),
              CustomTextField(
                labelText: "Cari",
                controller: _cariController,
                isMust: true,
                readOnly: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
                suffix: IconButton(
                  onPressed: getCariIslemleri,
                  icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.inversePrimary),
                ),
                onTap: getCari,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Plasiyer",
                      controller: _plasiyerController,
                      isMust: true,
                      readOnly: true,
                      suffixMore: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                      onTap: getPlasiyer,
                    ),
                  ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Proje",
                      controller: _projeController,
                      isMust: true,
                      readOnly: true,
                      suffixMore: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                      onTap: getProje,
                    ),
                  ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                ],
              ),
              Observer(
                builder: (_) {
                  if (viewModel.model.kalemler.ext.isNullOrEmpty) {
                    return const Column(
                      children: [
                        Icon(Icons.refresh_outlined),
                        Text("Bordroya Belge Eklemek İçin Artı Butonunu Kullanın."),
                      ],
                    ).paddingOnly(top: UIHelper.highSize * 5);
                  } else {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: viewModel.model.kalemler?.length ?? 0,
                      itemBuilder: (context, index) {
                        final CekSenetKalemlerModel item = viewModel.model.kalemler![index];
                        return Card(
                          child: ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tutar: ${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                                Text("Vade Günü: ${item.vadeTarihi.dateTimeWithoutTime?.difference(DateTime.now().dateTimeWithoutTime!).inDays} (${item.vadeTarihi.toDateString})"),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Asıl/Ciro: ${item.ciroTipi == "C" ? "Ciro" : "Asıl"}"),
                                Text(item.cekBanka ?? "").yetkiVarMi(item.cekBanka != null),
                              ],
                            ),
                            onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(
                              context,
                              title: loc(context).generalStrings.options,
                              children: [
                                BottomSheetModel(
                                  title: loc(context).generalStrings.edit,
                                  iconWidget: Icons.edit_outlined,
                                  onTap: () {
                                    Get.back();
                                    duzenle(item);
                                  },
                                ),
                                BottomSheetModel(
                                  title: loc(context).generalStrings.delete,
                                  iconWidget: Icons.delete_outline,
                                  onTap: () {
                                    Get.back();
                                    viewModel.removeCekSenetKalemlerModel(item);
                                    dialogManager.showSuccessSnackBar("Silindi");
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              Observer(
                builder: (_) => Text(
                  "Kalem Adedi: ${viewModel.model.kalemler?.length ?? 0}",
                ),
              ),
            ],
          ),
          FooterButton(
            children: [
              Observer(
                builder: (_) => Text(
                  "Tutar: ${viewModel.toplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                ),
              ),
            ],
          ),
          FooterButton(
            children: [
              Observer(
                builder: (_) => Text(
                  "Ort. Vade: ${viewModel.ortalamaVadeGunu.round()}",
                ),
              ),
            ],
          ),
        ],
      );

  Future<void> getTarih() async {
    final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
    if (result != null) {
      viewModel.setGirisTarihi(result);
      _girisTarihiController.text = result.toDateString;
    }
  }

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      viewModel.setCariKodu(result);
      _cariController.text = result.cariAdi ?? "";
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      _plasiyerController.text = result.plasiyerAciklama ?? "";
    }
  }

  Future<void> getCariIslemleri() async {
    if (viewModel.model.cariKodu != null) {
      final result = await networkManager.getCariModel(CariRequestModel.fromSaveCekSenetModel(viewModel.model));
      dialogManager.showCariIslemleriGridViewDialog(result);
    } else {
      dialogManager.showErrorSnackBar("Cari seçiniz");
    }
  }

  Future<void> getPlasiyer() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      _plasiyerController.text = result.plasiyerAciklama ?? "";
    }
  }

  Future<void> getProje() async {
    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
    if (result is BaseProjeModel) {
      viewModel.setProjeKodu(result);
      _projeController.text = result.projeAciklama ?? "";
    }
  }

  Future<void> add() async {
    if (viewModel.cariListesiModel != null) {
      final result = await Get.toNamed(
        widget.cekSenetListesiEnum.tahsilatEkleRoute,
        arguments: CekSenetKalemlerModel(
          refKodSorulsunMu: yetkiController.referansKodu(viewModel.cariListesiModel?.muhHesapTipi) && viewModel.cariListesiModel?.muhKodu != null,
        ),
      );
      if (result is CekSenetKalemlerModel) {
        viewModel.addCekSenetKalemlerModel(result);
      }
    } else {
      dialogManager.showInfoSnackBar("Lütfen cari seçiniz");
    }
  }

  Future<void> duzenle(CekSenetKalemlerModel? oldModel) async {
    final result = await Get.toNamed(
      widget.cekSenetListesiEnum.tahsilatEkleRoute,
      arguments: oldModel,
    );
    if (result is CekSenetKalemlerModel) {
      viewModel.replaceCekSenetKalemlerModel(oldModel, result);
    }
  }
}
