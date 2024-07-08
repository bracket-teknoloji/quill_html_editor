import "package:flutter/material.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";

class UretimSonuKaydiKalemEkleView extends StatefulWidget {
  final UretimSonuKaydiEditModel model;
  const UretimSonuKaydiKalemEkleView({super.key, required this.model});

  @override
  State<UretimSonuKaydiKalemEkleView> createState() => _UretimSonuKaydiKalemEkleViewState();
}

class _UretimSonuKaydiKalemEkleViewState extends State<UretimSonuKaydiKalemEkleView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Üretim Sonu Kaydı"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(labelText: "İş Emri", onTap: () {}),
              CustomTextField(labelText: "Mamul", onTap: () {}),
              CustomTextField(labelText: "Miktar", onTap: () {}),
              CustomTextField(labelText: "Hurda/Fire Miktarı", onTap: () {}),
              CustomTextField(labelText: "Açıklama", onTap: () {}),
              CustomTextField(labelText: "Ek Alan 1", onTap: () {}),
              CustomTextField(labelText: "Ek Alan 2", onTap: () {}),
            ],
          ),
        ),
      );
}
