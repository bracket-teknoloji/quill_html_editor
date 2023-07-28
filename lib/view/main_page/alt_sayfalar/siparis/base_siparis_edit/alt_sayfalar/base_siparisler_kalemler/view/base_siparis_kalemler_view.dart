import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';

import '../../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../../core/constants/ui_helper/ui_helper.dart';

class BaseSiparisKalemlerView extends StatefulWidget {
  const BaseSiparisKalemlerView({super.key});

  @override
  State<BaseSiparisKalemlerView> createState() => _BaseSiparisKalemlerViewState();
}

class _BaseSiparisKalemlerViewState extends BaseState<BaseSiparisKalemlerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
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
          Expanded(
              child: ListView.builder(
                  itemCount: BaseSiparisEditModel.instance.kalemAdedi,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      contentPadding: UIHelper.lowPadding,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(BaseSiparisEditModel.instance.kalemModelList?[index].depoTanimi ?? ""), IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))],
                      ),
                      subtitle: Wrap(
                          children: [
                        Text("Miktar: ${BaseSiparisEditModel.instance.kalemModelList?[index].miktar ?? ""} ${BaseSiparisEditModel.instance.kalemModelList?[index].olcuBirimAdi ?? ""}"),
                        Text("Kalan Miktar: ${BaseSiparisEditModel.instance.kalemModelList?[index].miktar ?? ""} ${BaseSiparisEditModel.instance.kalemModelList?[index].olcuBirimAdi ?? ""}"),
                        const Text("MF. Tut."),
                        const Text("Fiyat"),
                        const Text("Proje"),
                      ]
                              .map((e) => SizedBox(
                                    width: width * 0.4,
                                    child: e,
                                  ))
                              .toList()),
                    ).paddingAll(UIHelper.lowSize));
                  }))
        ],
      ),
    );
  }
}
