import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/view_model/cari_aktivite_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

import "../../../../../../core/base/state/base_state.dart";

class CariAktiviteView extends StatefulWidget {
  final CariListesiModel? cariModel;
  const CariAktiviteView({super.key, this.cariModel});

  @override
  State<CariAktiviteView> createState() => _CariAktiviteViewState();
}

class _CariAktiviteViewState extends BaseState<CariAktiviteView> {
  final CariAktiviteViewModel viewModel = CariAktiviteViewModel();
  late final TextEditingController searchController;
  late final TextEditingController cariController;
  late final TextEditingController kullaniciController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    viewModel.setCariKodu(widget.cariModel?.cariKodu);
    searchController = TextEditingController();
    cariController = TextEditingController();
    kullaniciController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    cariController.dispose();
    kullaniciController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Aktivite Kayıtları",
              subtitle: (viewModel.aktiviteList?.length ?? 0).toString(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.filter_alt_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            CustomTextField(labelText: "Ara...", controller: searchController),
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (value) async {
                viewModel.setBaslangicTarihi(baslangicTarihiController.text.toDateTimeDDMMYYYY());
                viewModel.setBitisTarihi(bitisTarihiController.text.toDateTimeDDMMYYYY());
                await viewModel.getData();
              },
              baslangicTarihiController: baslangicTarihiController,
              bitisTarihiController: bitisTarihiController,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (viewModel.aktiviteList == null) {
                    return const ListViewShimmer();
                  }
                  if (viewModel.aktiviteList?.isEmpty == true) {
                    return const Center(
                      child: Text("Sonuç bulunamadı."),
                    );
                  }
                  return ListView.builder(
                    itemCount: viewModel.aktiviteList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final CariAktiviteListesiModel model = viewModel.aktiviteList![index];
                      return Card(
                        child: ListTile(
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kullanıcı: ${model.kullaniciAdi}").yetkiVarMi(model.kullaniciAdi != null),
                              Text("Başlama Tarihi: ${model.bastar.toDateString}").yetkiVarMi(model.bastar != null),
                              Text("Cari: ${model.cariAdi}").yetkiVarMi(model.cariAdi != null),
                              Text("Aktivite: ${model.aktiviteAdi}").yetkiVarMi(model.aktiviteAdi != null),
                              Text("Kaydeden: ${model.kayityapankul}").yetkiVarMi(model.kayityapankul != null),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
