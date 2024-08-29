import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/hizli_tahsilat_kayitlari/view_model/hizli_tahsilat_kayitlari_view_model.dart";

final class HizliTahsilatKayitlariView extends StatefulWidget {
  const HizliTahsilatKayitlariView({super.key});

  @override
  State<HizliTahsilatKayitlariView> createState() => _HizliTahsilatKayitlariViewState();
}

final class _HizliTahsilatKayitlariViewState extends State<HizliTahsilatKayitlariView> {
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  final HizliTahsilatKayitlariViewModel viewModel = HizliTahsilatKayitlariViewModel();

  @override
  void initState() {
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await viewModel.getData());
    super.initState();
  }

  @override
  void dispose() {
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Hızlı Tahsilat Kayıtları"),
        ),
        body: Column(
          children: [
            RaporFiltreDateTimeBottomSheetView(filterOnChanged: (index) {}, baslangicTarihiController: baslangicTarihiController, bitisTarihiController: bitisTarihiController),
            Expanded(
              child: Observer(
                builder: (_) => RefreshableListView(onRefresh: viewModel.getData, items: viewModel.observableList, itemBuilder: (item) => Text(item.bankaAdi ?? "")),
              ),
            ),
          ],
        ),
      );
}
