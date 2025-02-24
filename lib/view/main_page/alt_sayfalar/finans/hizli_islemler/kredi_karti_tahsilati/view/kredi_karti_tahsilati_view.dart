// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/banka_sozlesmesi_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/hizli_islemler/kredi_karti_tahsilati/view_model/kredi_karti_tahsilati_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

final class KrediKartiTahsilatiView extends StatefulWidget {
  const KrediKartiTahsilatiView({super.key, this.cariListesiModel});
  final CariListesiModel? cariListesiModel;

  @override
  State<KrediKartiTahsilatiView> createState() => _KrediKartiTahsilatiViewState();
}

final class _KrediKartiTahsilatiViewState extends BaseState<KrediKartiTahsilatiView> {
  final KrediKartiTahsilatiViewModel viewModel = KrediKartiTahsilatiViewModel();
  late final TextEditingController _belgeNoController;
  late final TextEditingController _tarihController;
  late final TextEditingController _cariController;
  late final TextEditingController _kasaController;
  late final TextEditingController _sozlesmeController;
  late final TextEditingController _seriController;
  late final TextEditingController _hesapController;
  late final TextEditingController _tutarController;
  late final TextEditingController _krediKartiNoController;
  late final TextEditingController _referansKoduController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projekoduController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _belgeNoController = TextEditingController();
    _tarihController = TextEditingController();
    _cariController = TextEditingController(text: widget.cariListesiModel?.cariAdi ?? "");
    _kasaController = TextEditingController();
    _sozlesmeController = TextEditingController();
    _seriController = TextEditingController();
    _hesapController = TextEditingController();
    _tutarController = TextEditingController(
      text: widget.cariListesiModel?.bakiye?.abs().commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    _krediKartiNoController = TextEditingController();
    _referansKoduController = TextEditingController();
    _plasiyerController = TextEditingController(text: widget.cariListesiModel?.plasiyerAciklama ?? "");
    _projekoduController = TextEditingController();
    _aciklamaController = TextEditingController();

    if (yetkiController.varsayilanMuhRefKodu case final muhRefKodu?) {
      viewModel.setReferansKodu(muhRefKodu.hesapKodu);
      _referansKoduController.text = muhRefKodu.hesapAdi ?? "";
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel.setCariModel(widget.cariListesiModel);
      if (userModel.kullaniciYetki?.kkartiTahsilatYontemi == null && !AccountModel.instance.adminMi) {
        await dialogManager.showAlertDialog(
          "Tahsilat yöntemi belirsiz.\nNetfect > Picker > Kullanıcı Özel Yetkilendirme ekranından kredi kartı tahsilatı yöntemi belirleyin.",
        );
        Get.back();
        return;
      }
      viewModel
        ..setTutar(widget.cariListesiModel?.bakiye?.abs())
        ..setKktYontemi(userModel.kullaniciYetki?.kkartiTahsilatYontemi);
      if (AccountModel.instance.adminMi) {
        await tahsilatYontemiDialog();
        if (viewModel.model.kktYontemi == null) {
          Get.back();
          return;
        }
      }
      await viewModel.getSiradakiKod();
      _belgeNoController.text = viewModel.model.belgeNo ?? "";
      viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
      _tarihController.text = viewModel.model.tarih?.toDateString ?? "";
      if (widget.cariListesiModel != null) {
        viewModel
          ..setHesapKodu(widget.cariListesiModel!.cariKodu)
          ..setCariKodu(widget.cariListesiModel!.cariKodu)
          ..setPlasiyerKodu(
            PlasiyerList(
              plasiyerAciklama: widget.cariListesiModel!.plasiyerAciklama,
              plasiyerKodu: widget.cariListesiModel!.plasiyerKodu,
            ),
          );
      } else {
        await getCari();
      }
      if (viewModel.model.kktYontemi == "D") {
        await getSeri();
        viewModel.setAppBarSubTitle("Dekont");
        if (viewModel.model.dekontSeri == null) return;
        // viewModel.setPickerBelgeTuru("KKT");
        await getBankaHesaplari();
        if (viewModel.model.hesapKodu == null) return;
      }
      if (viewModel.model.kktYontemi == "K" || viewModel.model.kktYontemi == "H") {
        viewModel.setHesapTipi("C");
        await getKasa();
        await viewModel.getSiradakiKod();
        if (viewModel.model.kasaKodu == null) return;
      }
      if (viewModel.model.kktYontemi == "K") {
        await getBankaHesaplari();
        viewModel.setAppBarSubTitle("Kasa");
        if (viewModel.model.hesapKodu == null) return;
      }
      if (viewModel.model.kktYontemi == "H") {
        await getBankaSozlesmesi();
        viewModel.setAppBarSubTitle("Hızlı Tahsilat Modülü");
        if (viewModel.model.sozlesmeKodu == null) return;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _tarihController.dispose();
    _cariController.dispose();
    _kasaController.dispose();
    _sozlesmeController.dispose();
    _seriController.dispose();
    _hesapController.dispose();
    _tutarController.dispose();
    _krediKartiNoController.dispose();
    _referansKoduController.dispose();
    _plasiyerController.dispose();
    _projekoduController.dispose();
    _aciklamaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body(context));

  AppBar appBar() => AppBar(
    title: Observer(builder: (_) => AppBarTitle(title: "K.Kartı Tahsilatı", subtitle: viewModel.appBarSubTitle)),
    actions: [
      IconButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (viewModel.model.tutar case (null || 0.0)) {
              dialogManager.showErrorSnackBar("Tutar boş bırakılamaz!");
              return;
            }
            viewModel.setAciklama(_aciklamaController.text);
            await dialogManager.showAreYouSureDialog(() async {
              final result = await viewModel.postData();
              if (result.isSuccess) {
                Get.back(result: true);
                dialogManager.showSuccessSnackBar(result.message ?? "Kayıt başarılı");
              }
            });
          }
        },
        icon: const Icon(Icons.save_outlined),
      ),
    ],
  );

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder:
                (_) =>
                    (viewModel.model.kktYontemi != "D")
                        ? CustomTextField(
                          labelText: "Belge No",
                          controller: _belgeNoController,
                          maxLength: 15,
                          onChanged: viewModel.setBelgeNo,
                          suffix: IconButton(
                            onPressed: () async {
                              await viewModel.getSiradakiKod();
                              _belgeNoController.text = viewModel.model.belgeNo ?? "";
                            },
                            icon: const Icon(Icons.add_outlined),
                          ),
                        )
                        : const SizedBox.shrink(),
          ),
          CustomTextField(
            labelText: "Tarih",
            controller: _tarihController,
            isMust: true,
            isDateTime: true,
            readOnly: true,
            onTap: () async {
              final result = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (result != null) {
                _tarihController.text = result.toDateString;
                viewModel.setTarih(result.dateTimeWithoutTime);
              }
            },
          ),
          CustomTextField(
            labelText: "Cari",
            controller: _cariController,
            isMust: true,
            readOnly: true,
            suffixMore: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
            onTap: () async => await getCari(),
            suffix: IconButton(
              onPressed: () async {
                if (viewModel.model.hesapKodu != null) {
                  final result = await networkManager.getCariModel(
                    CariRequestModel.fromTahsilatRequestModel(viewModel.model),
                  );
                  dialogManager.showCariIslemleriGridViewDialog(result);
                } else {
                  dialogManager.showErrorSnackBar("Cari seçiniz");
                }
              },
              icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
            ),
          ),
          Observer(
            builder:
                (_) => Text(
                  (viewModel.getCariBakiye ?? "") +
                      ((viewModel.cariBakiye ?? 0) > 0 ? " (Tahsil Edilecek)" : " (Ödenecek)"),
                  style: TextStyle(
                    color: (viewModel.cariBakiye ?? 0) > 0 ? ColorPalette.mantis : ColorPalette.persianRed,
                  ),
                ).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.getCariBakiye != null),
          ),
          Observer(
            builder:
                (_) => Row(
                  children: [
                    if (viewModel.model.kktYontemi == "K" || viewModel.model.kktYontemi == "H")
                      Expanded(
                        child: CustomTextField(
                          labelText: "Kasa",
                          controller: _kasaController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.kasaKodu ?? "")),
                          onTap: () async => await getKasa(),
                        ),
                      ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Sözleşme",
                        controller: _sozlesmeController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.sozlesmeKodu ?? "")),
                        onTap: () async => await getBankaSozlesmesi(),
                      ),
                    ).yetkiVarMi(viewModel.model.kktYontemi == "H"),
                  ],
                ),
          ),
          Observer(
            builder:
                (_) => Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Seri",
                        controller: _seriController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.dekontSeri ?? "")),
                        onTap: () async => await getSeri(),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Hesap",
                        controller: _hesapController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                        onTap: () async => await getBankaHesaplari(),
                      ),
                    ),
                  ],
                ).yetkiVarMi(viewModel.model.kktYontemi == "D"),
          ),
          Observer(
            builder:
                (_) => CustomTextField(
                  labelText: "Kredi Kartı No",
                  isMust: true,
                  controller: _krediKartiNoController,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  onChanged: viewModel.setKrediKartiNo,
                ).yetkiVarMi(viewModel.model.kktYontemi == "H"),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Tutar",
                  controller: _tutarController,
                  isMust: true,
                  isFormattedString: true,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                ),
              ),
              if (yetkiController.plasiyerUygulamasiAcikMi)
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    controller: _plasiyerController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                        context,
                        viewModel.model.plasiyerKodu,
                      );
                      if (result is PlasiyerList) {
                        _plasiyerController.text = result.plasiyerAciklama ?? "";
                        viewModel.setPlasiyerKodu(result);
                      }
                    },
                  ),
                ),
            ],
          ),
          Row(
            children: [
              if (yetkiController.projeUygulamasiAcikMi)
                Expanded(
                  child: CustomTextField(
                    labelText: "Proje",
                    controller: _projekoduController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                        context,
                        viewModel.model.projeKodu,
                      );
                      if (result is BaseProjeModel) {
                        _projekoduController.text = result.projeAciklama ?? result.projeKodu ?? "";
                        viewModel.setProjekodu(result.projeKodu);
                      }
                    },
                  ),
                ),

              Expanded(
                child: Observer(
                  builder: (_) {
                    if (yetkiController.referansKodu(viewModel.cariModel?.muhHesapTipi) ||
                        yetkiController.referansKodu(viewModel.bankModel?.muhasebeHesapTipi))
                      return CustomTextField(
                        labelText: "Referans Kodu",
                        controller: _referansKoduController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.refKod ?? "")),
                        onTap: () async {
                          if (viewModel.muhaRefList.ext.isNullOrEmpty) {
                            await viewModel.getMuhaRefList();
                          }
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "Referans Kodu",
                            groupValue: viewModel.model.refKod,
                            children:
                                viewModel.muhaRefList!
                                    .map((e) => BottomSheetModel(title: e.tanimi ?? "", value: e, groupValue: e.kodu))
                                    .toList(),
                          );
                          if (result is MuhasebeReferansModel) {
                            _referansKoduController.text = result.tanimi ?? "";
                            viewModel.setReferansKodu(result.kodu);
                          }
                        },
                      );
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
          CustomTextField(labelText: "Açıklama", controller: _aciklamaController, onChanged: viewModel.setAciklama),
        ],
      ).paddingAll(UIHelper.lowSize),
    ),
  );

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      viewModel.setShowReferansKodu(yetkiController.referansKodu(result.muhHesapTipi));
      _aciklamaController.text = result.cariAdi ?? "";
      _cariController.text = result.cariAdi ?? "";
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      viewModel
        ..setCariModel(result)
        ..setAciklama(result.cariAdi)
        ..setCariKodu(result.cariKodu)
        ..setHesapKodu(result.cariKodu)
        ..setCariBakiye(result.bakiye)
        ..setPlasiyerKodu(
          PlasiyerList()
            ..plasiyerAciklama = result.plasiyerAciklama
            ..plasiyerKodu = result.plasiyerKodu,
        );
    }
  }

  Future<void> tahsilatYontemiDialog() async {
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Tahsilat Yöntemi",
      children: [
        BottomSheetModel(title: "Hızlı Tahsilat Modülü", value: "Hızlı Tahsilat Modülü"),
        BottomSheetModel(title: "Dekont", value: "Dekont"),
        BottomSheetModel(title: "Kasa", value: "Kasa"),
      ],
    );
    if (result != null) {
      viewModel
        ..setAppBarSubTitle(result)
        ..setKktYontemi(result.substring(0, 1));
    }
  }

  Future<void> getKasa() async {
    final KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(
      context,
      viewModel.model.kasaKodu,
    );
    if (result != null) {
      _kasaController.text = result.kasaTanimi ?? "";
      viewModel.setKasaKodu(result.kasaKodu);
    }
  }

  Future<void> getBankaSozlesmesi() async {
    if (viewModel.bankaSozlesmesiList.ext.isNullOrEmpty) {
      await viewModel.getBankaSozlesmesi();
    }
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Banka Sözleşmesi",
      groupValue: viewModel.model.sozlesmeKodu,
      children:
          viewModel.bankaSozlesmesiList!
              .map(
                (e) => BottomSheetModel(
                  title: e.sozlesmeAdi ?? "",
                  description: e.bankaTanimi,
                  value: e,
                  groupValue: e.sozlesmeKodu,
                ),
              )
              .toList(),
    );
    if (result is BankaSozlesmesiModel) {
      _sozlesmeController.text = result.sozlesmeAdi ?? "";
      viewModel.setSozlesmeKodu(result.sozlesmeKodu);
    }
  }

  Future<void> getBankaHesaplari() async {
    if (viewModel.bankaHesaplariList.ext.isNullOrEmpty) {
      await viewModel.getBankaHesaplari();
    }
    if (viewModel.bankaHesaplariList.ext.isNotNullOrEmpty) {
      // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
      //   context,
      //   viewModel.,

      // );
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Banka Hesapları",
        groupValue: viewModel.model.hesapKodu,
        children:
            viewModel.bankaHesaplariList!
                .map(
                  (e) => BottomSheetModel(
                    title: e.hesapAdi ?? "",
                    description: e.hesapKodu,
                    value: e,
                    groupValue: e.hesapKodu,
                  ),
                )
                .toList(),
      );
      if (result is BankaListesiModel) {
        _hesapController.text = result.hesapAdi ?? "";
        viewModel
          ..setBankModel(result)
          ..setHesapKodu(result.hesapKodu)
          ..setHedefAciklama(result.hesapAdi)
          ..setHesapTipi("B");
      }
    }
  }

  Future<void> getSeri() async {
    if (viewModel.seriList.ext.isNullOrEmpty) {
      await viewModel.getSeri();
    }
    if (viewModel.seriList.ext.isNotNullOrEmpty) {
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Seri",
        groupValue: viewModel.model.dekontSeri,
        children:
            viewModel.seriList!
                .map(
                  (e) =>
                      BottomSheetModel(title: e.aciklama ?? "", description: e.seriNo, value: e, groupValue: e.seriNo),
                )
                .toList(),
      );
      if (result != null) {
        _seriController.text = result.aciklama ?? "";
        viewModel.setSeri(result);
      }
    }
  }
}
