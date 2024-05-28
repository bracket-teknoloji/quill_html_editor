import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class BaseHucreKalemlerView extends StatefulWidget {
  const BaseHucreKalemlerView({super.key});

  @override
  State<BaseHucreKalemlerView> createState() => _BaseHucreKalemlerViewState();
}

class _BaseHucreKalemlerViewState extends State<BaseHucreKalemlerView> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Stok",
                readOnly: true,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Stok Adı",
                readOnly: true,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Ölçü Birimi",
                readOnly: true,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "İşlem Yapılacak Miktar",
                isMust: true,
                readOnly: true,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Hücre",
                isMust: true,
                readOnly: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ).paddingAll(UIHelper.lowSize);
}
