import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/hucre_takibi_stoklar/model/hucre_takibi_stoklar_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/hucre_takibi_stoklar/view_model/hucre_takibi_stoklar_view_model.dart";

final class HucreTakibiStoklarView extends StatefulWidget {
  const HucreTakibiStoklarView({super.key});

  @override
  State<HucreTakibiStoklarView> createState() => _HucreTakibiStoklarViewState();
}

final class _HucreTakibiStoklarViewState extends State<HucreTakibiStoklarView> {
  final HucreTakibiStoklarViewModel viewModel = HucreTakibiStoklarViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Stok Rehberi"),
        ),
        body: Observer(
          builder: (_) => RefreshableListView<HucreTakibiStoklarModel>(
            onRefresh: viewModel.getData,
            items: viewModel.hucreTakibiStoklarListesi,
            itemBuilder: (item) => Card(
              child: ListTile(
                onTap: () => Get.back(result: item),
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
            ),
          ),
        ),
      );
}
