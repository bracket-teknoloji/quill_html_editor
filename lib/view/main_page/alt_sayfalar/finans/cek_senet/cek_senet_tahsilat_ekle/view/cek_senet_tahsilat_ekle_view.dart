import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../view_model/cek_senet_tahsilat_ekle_view_model.dart";

class CekSenetTahsilatEkleView extends StatefulWidget {
  const CekSenetTahsilatEkleView({super.key});

  @override
  State<CekSenetTahsilatEkleView> createState() => _CekSenetTahsilatEkleViewState();
}

class _CekSenetTahsilatEkleViewState extends BaseState<CekSenetTahsilatEkleView> {
  final CekSenetTahsilatEkleViewModel viewModel = CekSenetTahsilatEkleViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Tahsilat Ekle"),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  dialogManager.showInfoSnackBar("Henüz burayı eklemedim :(");
                }
              },
              icon: const Icon(Icons.check_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  value: true,
                  onChanged: (value) {},
                  title: const Text("Ciro"),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Vade Tarihi",
                        isDateTime: true,
                        readOnly: true,
                        isMust: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Döviz Tipi",
                        readOnly: true,
                        suffixMore: true,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tutar",
                        isMust: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Seri No",
                      ),
                    ),
                  ],
                ),
                const CustomTextField(
                  labelText: "Banka",
                  readOnly: true,
                  suffixMore: true,
                ),
                const CustomTextField(
                  labelText: "Şube",
                  readOnly: true,
                  suffixMore: true,
                ),
                const CustomTextField(
                  labelText: "Hesap No",
                ),
                const CustomTextField(
                  labelText: "IBAN",
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "İl",
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "İlçe",
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Rapor Kodu",
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Cari Rapor Kodu",
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );
}
