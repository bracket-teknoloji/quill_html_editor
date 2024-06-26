import "package:flutter/material.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

class IsEmriEditView extends StatefulWidget {
  final BaseEditModel<IsEmirleriModel> model;
  const IsEmriEditView({super.key, required this.model});

  @override
  State<IsEmriEditView> createState() => _IsEmriEditViewState();
}

class _IsEmriEditViewState extends BaseState<IsEmriEditView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "İş Emri Detay",
            subtitle: widget.model.baseEditEnum.getName,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Tarih",
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Teslim Tarihi",
                    ),
                  ),
                ],
              ),
              const CustomTextField(
                labelText: "Belge No",
              ),
              const CustomTextField(
                labelText: "Stok Kodu",
              ).yetkiVarMi(yetkiController.stokListesi),
              Row(
                children: [
                  const Expanded(
                    child: CustomTextField(
                      labelText: "Miktar",
                    ),
                  ),
                  const Expanded(
                    child: CustomTextField(
                      labelText: "Proje",
                    ),
                  ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Giriş Depo",
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Çıkış Depo",
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Referans İş Emri",
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Sipariş",
                    ),
                  ),
                ],
              ),
              const CustomTextField(
                labelText: "Açıklama",
              ),
            ],
          ),
        ),
      );
}
