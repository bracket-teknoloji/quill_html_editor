import "package:flutter/material.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

class BaseFaturaGenelView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseFaturaGenelView({super.key, required this.model});

  @override
  State<BaseFaturaGenelView> createState() => BaseFaturaGenelViewState();
}

class BaseFaturaGenelViewState extends BaseState<BaseFaturaGenelView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get enable => widget.model.enable;

  late final TextEditingController _belgeNoController;
  late final TextEditingController _resmiBelgeNoController;
  late final TextEditingController _cariController;
  late final TextEditingController _teslimCariController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _belgeTipiController;
  late final TextEditingController _tarihController;
  late final TextEditingController _topluDepoController;
  late final TextEditingController _ozelKod2Controller;

  @override
  void initState() {
    _belgeNoController = TextEditingController(text: model.belgeNo);
    _resmiBelgeNoController = TextEditingController(text: model.resmiBelgeNo);
    _cariController = TextEditingController(text: model.cariAdi);
    _teslimCariController = TextEditingController(text: model.teslimCariAdi);
    _plasiyerController = TextEditingController(text: model.plasiyerAciklama);
    _belgeTipiController = TextEditingController(text: model.belgeKodu);
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _topluDepoController = TextEditingController(text: model.topluDepo.toStringIfNotNull);
    _ozelKod2Controller = TextEditingController(text: model.ozelKod2);
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _resmiBelgeNoController.dispose();
    _cariController.dispose();
    _teslimCariController.dispose();
    _plasiyerController.dispose();
    _belgeTipiController.dispose();
    _tarihController.dispose();
    _topluDepoController.dispose();
    _ozelKod2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelper.lowPadding,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              CustomTextField(labelText: "Belge No", controller: _belgeNoController, enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Resmi Belge No", controller: _resmiBelgeNoController, enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Cari", controller: _cariController, enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Teslim Cari", controller: _teslimCariController, enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Plasiyer", controller: _plasiyerController, enabled: enable, onTap: () {}).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: CustomTextField(labelText: "Belge Tipi", controller: _belgeTipiController, enabled: enable, onTap: () {})),
                  Expanded(child: CustomTextField(labelText: "Tarih", controller: _tarihController, enabled: enable, onTap: () {})),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: CustomTextField(labelText: "Toplu Depo", controller: _topluDepoController, enabled: enable, onTap: () {})),
                  Expanded(child: CustomTextField(labelText: "Özel Kod 2", controller: _ozelKod2Controller, enabled: enable, onTap: () {})),
                ],
              ),
              CustomWidgetWithLabel(
                text: "Ek Açıklamalar",
                onlyLabelpaddingLeft: UIHelper.lowSize,
                child: CustomTextField(labelText: "Açıklama", enabled: enable, onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
