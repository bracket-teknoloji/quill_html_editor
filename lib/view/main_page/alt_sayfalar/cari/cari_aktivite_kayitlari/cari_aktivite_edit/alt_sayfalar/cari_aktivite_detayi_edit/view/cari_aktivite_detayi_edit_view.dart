import "package:flutter/material.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";

class CariAktiviteDetayiEditView extends StatefulWidget {
  const CariAktiviteDetayiEditView({super.key});

  @override
  State<CariAktiviteDetayiEditView> createState() => _CarikKtiviteDetayiEditViewState();
}

class _CarikKtiviteDetayiEditViewState extends State<CariAktiviteDetayiEditView> {
  late final TextEditingController tarihController;
  late final TextEditingController aktiviteTipiController;
  late final TextEditingController aciklamaController;

  @override
  void initState() {
    tarihController = TextEditingController(text: DateTime.now().toDateString);
    aktiviteTipiController = TextEditingController();
    aciklamaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tarihController.dispose();
    aktiviteTipiController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Aktivite Detayı"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(labelText: "Tarih", controller: tarihController),
              CustomTextField(labelText: "Aktivite Tipi", controller: aktiviteTipiController),
              CustomTextField(labelText: "Açıklama", controller: aciklamaController),
            ],
          ),
        ),
      );
}
