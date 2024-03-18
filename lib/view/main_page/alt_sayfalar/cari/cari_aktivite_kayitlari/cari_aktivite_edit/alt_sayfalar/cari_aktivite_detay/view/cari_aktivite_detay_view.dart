import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/alt_sayfalar/cari_aktivite_detay/view_model/cari_aktivite_detay_view_model.dart";

class CariAktiviteDetayView extends StatefulWidget {
  const CariAktiviteDetayView({super.key});

  @override
  State<CariAktiviteDetayView> createState() => _CariAktiviteDetayViewState();
}

class _CariAktiviteDetayViewState extends State<CariAktiviteDetayView> {
  final CariAktiviteDetayViewModel viewModel = CariAktiviteDetayViewModel();

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          isScrolledDown: true,
          onPressed: () async {
            final result = await Get.toNamed("/mainPage/cariAktiviteDetayiEdit");
          },
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.aktiviteList.isEmpty) {
              return const Center(child: Text("Aktivite Bulunamadı"));
            } else {
              return ListView.builder(
                itemCount: viewModel.aktiviteList.length,
                itemBuilder: (_, index) => Card(
                  child: ListTile(
                    title: Text(viewModel.aktiviteList[index].cariAdi ?? ""),
                    subtitle: Text(viewModel.aktiviteList[index].kullaniciAdi ?? ""),
                  ),
                ),
              );
            }
          },
        ),
      );
}
