import "package:flutter/material.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

class IsEmriDetayView extends StatefulWidget {
  const IsEmriDetayView({super.key});

  @override
  State<IsEmriDetayView> createState() => _IsEmriDetayViewState();
}

class _IsEmriDetayViewState extends State<IsEmriDetayView> {
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
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
              CustomTextField(
                labelText: "Belge No",
              ),
              CustomTextField(
                labelText: "Stok Kodu",
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Miktar",
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Proje",
                    ),
                  ),
                ],
              ),
              
              Row(
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
              Row(
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
              CustomTextField(
                labelText: "Açıklama",
              ),
            ],
          ),
        ),
      );
}
