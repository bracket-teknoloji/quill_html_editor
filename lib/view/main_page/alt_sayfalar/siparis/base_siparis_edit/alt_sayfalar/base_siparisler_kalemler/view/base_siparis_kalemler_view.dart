import 'package:flutter/material.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';

import '../../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../../core/constants/ui_helper/ui_helper.dart';

class BaseSiparisKalemlerView extends StatefulWidget {
  const BaseSiparisKalemlerView({super.key});

  @override
  State<BaseSiparisKalemlerView> createState() => _BaseSiparisKalemlerViewState();
}

class _BaseSiparisKalemlerViewState extends BaseState<BaseSiparisKalemlerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          CustomTextField(
            labelText: "Stok Kodu / Barkod Giriniz",
            suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_2_outlined)),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              contentPadding: UIHelper.lowPadding,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Kalem $index"), IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))],
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("sdfsdf"),
                  Text("sdfsdf"),
                  Text("Miktar"),
                  Text("KDV %"),
                  Text("MF. Tut."),
                  Text("Fiyat"),
                  Text("Proje"),
                ],
              ),
            ));
          }))
        ],
      ),
    );
  }
}
