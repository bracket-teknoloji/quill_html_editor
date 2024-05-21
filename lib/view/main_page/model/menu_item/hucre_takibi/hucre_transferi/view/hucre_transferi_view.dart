import "package:flutter/material.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

final class HucreTransferiView extends StatefulWidget {
  const HucreTransferiView({super.key});

  @override
  State<HucreTransferiView> createState() => _HucreTransferiViewState();
}

final class _HucreTransferiViewState extends State<HucreTransferiView> {
  late final TextEditingController depoController;
  late final TextEditingController kaynakHucreController;
  late final TextEditingController stokController;
  late final TextEditingController stokAdiController;
  late final TextEditingController hucreMiktariController;
  late final TextEditingController islemMiktariController;
  late final TextEditingController hedefHucreController;

  @override
  void initState() {
    depoController = TextEditingController();
    kaynakHucreController = TextEditingController();
    stokController = TextEditingController();
    stokAdiController = TextEditingController();
    hucreMiktariController = TextEditingController();
    islemMiktariController = TextEditingController();
    hedefHucreController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    depoController.dispose();
    kaynakHucreController.dispose();
    stokController.dispose();
    stokAdiController.dispose();
    hucreMiktariController.dispose();
    islemMiktariController.dispose();
    hedefHucreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Hücre Transferi",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => ToggleButtons(
                  constraints: BoxConstraints.expand(width: (constraints.maxWidth - UIHelper.midSize - 4) / 2),
                  isSelected: const [true, false],
                  onPressed: (index) {},
                  children: const [
                    Text("Stok"),
                    Text("Paket"),
                  ],
                ),
              ),
              CustomTextField(
                labelText: "Depo",
                isMust: true,
                controller: depoController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Kaynak Hücre",
                isMust: true,
                controller: kaynakHucreController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Stok",
                isMust: true,
                controller: stokController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Stok Adı",
                controller: stokAdiController,
                onTap: () {},
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Hücre Miktarı",
                      controller: hucreMiktariController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      isFormattedString: true,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "İşlem Miktarı",
                      isMust: true,
                      controller: islemMiktariController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      isFormattedString: true,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Hedef Hücre",
                isMust: true,
                controller: hedefHucreController,
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
