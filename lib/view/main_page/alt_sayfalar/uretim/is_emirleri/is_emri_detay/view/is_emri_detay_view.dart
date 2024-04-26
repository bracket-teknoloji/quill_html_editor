import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

class IsEmriDetayView extends StatefulWidget {
  const IsEmriDetayView({super.key});

  @override
  State<IsEmriDetayView> createState() => _IsEmriDetayViewState();
}

class _IsEmriDetayViewState extends BaseState<IsEmriDetayView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "İş Emri Detay",
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
