import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucredeki_stoklar/view_model/hucredeki_stoklar_view_model.dart";

final class HucredekiStoklarView extends StatefulWidget {
  final HucreListesiRequestModel model;
  const HucredekiStoklarView({super.key, required this.model});

  @override
  State<HucredekiStoklarView> createState() => _HucredekiStoklarViewState();
}

final class _HucredekiStoklarViewState extends State<HucredekiStoklarView> {
  final HucredekiStoklarViewModel viewModel = HucredekiStoklarViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Hücredeki Stoklar",
            subtitle: "Hücre: ${widget.model.hucreKodu}",
          ),
        ),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Ara",
              onChanged: viewModel.setSearchText,
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: viewModel.getData,
                child: Observer(
                  builder: (_) {
                    if (viewModel.filteredStoklarListesi == null) return const ListViewShimmer();
                    if (viewModel.filteredStoklarListesi!.isEmpty) return const Center(child: Text("Hücredeki Stoklar Bulunamadı!"));
                    return ListView.builder(
                      itemCount: viewModel.filteredStoklarListesi!.length,
                      itemBuilder: (context, index) {
                        final item = viewModel.filteredStoklarListesi![index];
                        return Card(
                          child: ListTile(
                            onTap: ()=> Get.back(result: item),
                            title: Text(item.stokAdi ?? ""),
                            subtitle: CustomLayoutBuilder(
                              splitCount: 2,
                              children: [
                                Text("Stok Kodu: ${item.stokKodu ?? ""}"),
                                Text("Yap. Kod: ${item.yapkod ?? ""}"),
                                Text("Yap. Açıklama: ${item.yapacik ?? ""}"),
                              ],
                            ),
                            trailing: Text(
                              item.netMiktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "",
                              style: TextStyle(color: UIHelper.getColorWithValue(item.netMiktar ?? 0)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
