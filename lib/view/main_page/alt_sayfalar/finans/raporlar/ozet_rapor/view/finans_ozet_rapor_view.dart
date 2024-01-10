import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../model/finans_ozet_rapor_model.dart";
import "../view_model/finans_ozet_rapor_view_model.dart";

class FinansOzetRaporView extends StatefulWidget {
  const FinansOzetRaporView({super.key});

  @override
  State<FinansOzetRaporView> createState() => _FinansOzetRaporViewState();
}

class _FinansOzetRaporViewState extends BaseState<FinansOzetRaporView> {
  final FinansOzetRaporViewModel viewModel = FinansOzetRaporViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getGunSonuRaporu();
    });
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
          title: const Text("Özet Rapor"),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ],
        ),
        body: Column(
          children: [
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (value) async {
                viewModel.setBaslangicTarihi(baslangicTarihiController.text);
                viewModel.setBitisTarihi(bitisTarihiController.text);
                await viewModel.getGunSonuRaporu();
              },
              baslangicTarihiController: baslangicTarihiController,
              bitisTarihiController: bitisTarihiController,
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: () async => await viewModel.getGunSonuRaporu(),
                child: Observer(
                  builder: (_) {
                    if (viewModel.gunSonuRaporuList == null) {
                      return const ListViewShimmer();
                    } else if (viewModel.gunSonuRaporuList!.isEmpty) {
                      return const Center(child: Text("Veri bulunamadı"));
                    }
                    return ListView.builder(
                      itemCount: viewModel.gunSonuRaporuList!.length,
                      itemBuilder: (context, index) {
                        final FinansOzetRaporModel model = viewModel.gunSonuRaporuList![index];
                        return Card(
                          child: ListTile(
                            title: Text(model.tabloTipi ?? ""),
                            subtitle: Text(viewModel.toplamAlisFaturasi?.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat) ?? ""),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
