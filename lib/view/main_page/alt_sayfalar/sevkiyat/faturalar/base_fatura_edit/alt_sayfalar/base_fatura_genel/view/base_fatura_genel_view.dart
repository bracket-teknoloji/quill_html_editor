import "package:flutter/material.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelper.lowPadding,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              CustomTextField(labelText: "Belge No", enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Resmi Belge No", enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Cari", enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Teslim Cari", enabled: enable, onTap: () {}),
              CustomTextField(labelText: "Plasiyer", enabled: enable, onTap: () {}).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: CustomTextField(labelText: "Belge Tipi", enabled: enable, onTap: () {})),
                  Expanded(child: CustomTextField(labelText: "Tarih", enabled: enable, onTap: () {})),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: CustomTextField(labelText: "Toplu Depo", enabled: enable, onTap: () {})),
                  Expanded(child: CustomTextField(labelText: "Özel Kod 2", enabled: enable, onTap: () {})),
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
