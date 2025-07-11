import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_link_edit/model/payker_link_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_link_edit/view_model/payker_link_edit_view_model.dart";

class PaykerLinkEditView extends StatefulWidget {
  const PaykerLinkEditView.ekle({super.key}) : editEnum = BaseEditEnum.ekle, model = null;

  const PaykerLinkEditView.duzenle({
    required this.model,
    super.key,
  }) : editEnum = BaseEditEnum.duzenle;

  final BaseEditEnum editEnum;

  final PaykerLinkEditModel? model;

  @override
  State<PaykerLinkEditView> createState() => _PaykerLinkEditViewState();
}

class _PaykerLinkEditViewState extends BaseState<PaykerLinkEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PaykerLinkEditViewModel _viewModel = PaykerLinkEditViewModel();
  final TextEditingController _bayiController = TextEditingController();
  final TextEditingController _tutarController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _unvanController = TextEditingController();
  final TextEditingController _bitisTarihiController = TextEditingController();
  final TextEditingController _kullanimSayisiController = TextEditingController();

  @override
  void initState() {
    if (widget.editEnum == BaseEditEnum.duzenle) {
      _viewModel.setModel(widget.model!);
    }
    if (widget.editEnum == BaseEditEnum.duzenle && widget.model != null) {
      _bayiController.text = _viewModel.paykerLinkEditModel.bayiId.toStringIfNotNull ?? "";
      _tutarController.text =
          _viewModel.paykerLinkEditModel.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
      _emailController.text = _viewModel.paykerLinkEditModel.email ?? "";
      _unvanController.text = _viewModel.paykerLinkEditModel.unvan ?? "";
      _bitisTarihiController.text = widget.model!.bittar?.toDateString ?? "";
      _kullanimSayisiController.text =
          widget.model!.kullanimSayisi?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "";
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.editEnum != BaseEditEnum.ekle) {
        await _viewModel.getInstallments();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _bayiController.dispose();
    _tutarController.dispose();
    _emailController.dispose();
    _unvanController.dispose();
    _bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "Payker Link", subtitle: widget.editEnum.getName),
      actions: [
        IconButton(
          icon: const Icon(Icons.save_outlined),
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            dialogManager.showAreYouSureDialog(
              onYes: () async {
                if (widget.editEnum == BaseEditEnum.duzenle) {
                  if (await _viewModel.updateLink()) Get.back(result: true);
                }
                if (widget.editEnum == BaseEditEnum.ekle) if (await _viewModel.saveLink()) Get.back(result: true);
              },
            );
          },
        ),
      ],
    ),
    body: Form(
      key: _formKey,
      child: Column(
        children: [
          // CustomTextField(
          //   labelText: "Bayi",
          //   suffixMore: true,
          //   readOnly: true,
          //   valueWidget: Observer(builder: (_) => Text(_viewModel.paykerLinkEditModel.bayiId.toStringIfNotNull ?? "")),
          //   controller: _bayiController,
          //   onTap: () async {
          //     final result = await Get.toNamed("/mainPage/paykerFirmaBayiListesiOzel");
          //     if (result != null) {
          //       _viewModel.setBayi(result);
          //       _bayiController.text = result.text ?? "";
          //     }
          //   },
          // ),
          CustomTextField(
            labelText: "Unvan",
            controller: _unvanController,
            isMust: true,
            onChanged: _viewModel.setUnvan,
            suffix: IconButton(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () async {
                final result = await Get.toNamed("/mainPage/cariListesiOzel");
                if (result case final CariListesiModel cariListesiModel) {
                  _viewModel.setUnvan(cariListesiModel.cariAdi ?? "");
                  _unvanController.text = cariListesiModel.cariAdi ?? "";
                  if (cariListesiModel.email != null) {
                    _viewModel.setEmail(cariListesiModel.email);
                    _emailController.text = cariListesiModel.email!;
                  }
                }
              },
            ),
          ),
          CustomTextField(
            labelText: "E-mail",
            controller: _emailController,
            isMust: true,
            keyboardType: TextInputType.emailAddress,
            onChanged: _viewModel.setEmail,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Bitiş Tarihi",
                  controller: _bitisTarihiController,
                  isDateTime: true,
                  readOnly: true,
                  onTap: () async {
                    final result = await dialogManager.showDateTimePicker(
                      initialDate: _viewModel.paykerLinkEditModel.bittar,
                    );
                    if (result != null) {
                      _viewModel.setBitTar(result);
                      _bitisTarihiController.text = result.toDateString;
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kullanım Sayısı",
                  controller: _kullanimSayisiController,
                  keyboardType: TextInputType.number,
                  isFormattedString: true,
                  onChanged: (value) {
                    _viewModel.setKullanimSayisi(value.toDoubleWithFormattedString.toInt());
                  },
                ),
              ),
            ],
          ),
          CustomTextField(
            labelText: "Tutar",
            controller: _tutarController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            isFormattedString: true,
            onChanged: (value) {
              _viewModel.setTutar(value.toDoubleWithFormattedString);
            },
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (_viewModel.taksitResponseModel == null) {
                  return const Center(
                    child: Text("Taksit bilgileri yüklenemedi. Lütfen önce tutar giriniz."),
                  );
                }
                return SafeArea(
                  child: PageView(
                    controller: PageController(viewportFraction: context.isLandscape ? 0.4 : 0.8),

                    children:
                        _viewModel.taksitResponseModel
                            ?.map(
                              (e) => Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          foregroundImage: e.taksitler?.firstOrNull?.banka?.logoUrl != null
                                              ? NetworkImage(
                                                  ApiUrls.basePaykerURLWithoutApi +
                                                      (e.taksitler?.firstOrNull?.banka?.logoUrl! ?? ""),
                                                )
                                              : null,
                                        ),
                                        title: Text(
                                          e.bankaAdi ?? "",
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      endIndent: 0,
                                      indent: 0,
                                    ),
                                    ListTile(
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        // checkboxListtile list of taksitler
                                        children: List.generate(
                                          e.taksitler?.length ?? 0,
                                          (index) => Column(
                                            children: [
                                              CheckboxListTile.adaptive(
                                                value: _viewModel.selectedTaksitler.any(
                                                  (taksit) =>
                                                      taksit.banka?.id == e.bankaId &&
                                                      taksit.taksit == e.taksitler![index].taksit,
                                                ),
                                                onChanged: (value) {
                                                  _viewModel.setSelectedTaksitler(
                                                    e.taksitler![index],
                                                    value ?? false,
                                                  );
                                                },
                                                title: Text(
                                                  "${e.taksitler![index].odemeMetni}",
                                                ),
                                              ),
                                              if (index < (e.taksitler?.length ?? 0) - 1)
                                                const Divider(
                                                  endIndent: 0,
                                                  indent: 0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .nonNulls
                            .toList() ??
                        <Widget>[],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
