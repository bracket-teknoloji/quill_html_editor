import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class EBelgeGonderView extends StatefulWidget {
  final BaseSiparisEditModel model;
  const EBelgeGonderView({super.key, required this.model});

  @override
  State<EBelgeGonderView> createState() => _EBelgeGonderViewState();
}

class _EBelgeGonderViewState extends BaseState<EBelgeGonderView> {
  late final TextEditingController _cariController;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _resmiBelgeNoController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _araToplamController;
  late final TextEditingController _kdvTutariController;
  late final TextEditingController _genelToplamController;
  late final TextEditingController _dovizliToplamController;
  late final TextEditingController _dizaynController;
  late final TextEditingController _gonderimSekliController;

  @override
  void initState() {
    _cariController = TextEditingController(text: widget.model.cariAdi);
    _belgeNoController = TextEditingController(text: widget.model.belgeNo);
    _resmiBelgeNoController = TextEditingController(text: widget.model.resmiBelgeNo);
    _dovizTipiController = TextEditingController(text: widget.model.dovizAdi);
    _araToplamController = TextEditingController(text: widget.model.araToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _kdvTutariController = TextEditingController(text: widget.model.kdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _genelToplamController = TextEditingController(text: widget.model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _dovizliToplamController = TextEditingController(text: widget.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari));
    _dizaynController = TextEditingController();
    _gonderimSekliController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cariController.dispose();
    _belgeNoController.dispose();
    _resmiBelgeNoController.dispose();
    _dovizTipiController.dispose();
    _araToplamController.dispose();
    _kdvTutariController.dispose();
    _genelToplamController.dispose();
    _dovizliToplamController.dispose();
    _dizaynController.dispose();
    _gonderimSekliController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "E-Belge Gönder",
            subtitle: widget.model.belgeNo,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: "Cari",
                controller: _cariController,
                readOnly: true,
                suffix: IconButton(onPressed: () {}, icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor)),
              ),
              CustomTextField(
                labelText: "Belge No",
                controller: _belgeNoController,
                readOnly: true,
                suffix: IconButton(onPressed: () {}, icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor)),
              ),
              CustomTextField(
                labelText: "Resmi Belge No",
                controller: _resmiBelgeNoController,
                readOnly: true,
                suffix: IconButton(onPressed: () {}, icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor)),
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Döviz Tipi",
                    controller: _dovizTipiController,
                    readOnly: true,
                  ),
                  CustomTextField(
                    labelText: "Ara Toplam",
                    controller: _araToplamController,
                    readOnly: true,
                  ),
                  CustomTextField(
                    labelText: "KDV Tutarı",
                    controller: _kdvTutariController,
                    readOnly: true,
                  ),
                  CustomTextField(
                    labelText: "Genel Toplam",
                    controller: _genelToplamController,
                    readOnly: true,
                  ),
                  CustomTextField(
                    labelText: "Dövizli Toplam",
                    controller: _dovizliToplamController,
                    readOnly: true,
                  ),
                  CustomTextField(
                    labelText: "Dizayn",
                    controller: _dizaynController,
                    readOnly: true,
                    isMust: true,
                  ),
                ],
              ),
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text("Döviz Oluştur"),
              ),
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text("Gönderim Şekli E-Posta"),
              ),
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text("İnternet Tipli"),
              ),
              ElevatedButton.icon(onPressed: () {}, label: const Text("Taslak Oluştur"), icon: const Icon(Icons.add)).paddingAll(UIHelper.lowSize),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
