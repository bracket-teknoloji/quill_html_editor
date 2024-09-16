import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "../../../../../../core/base/view/base_scaffold.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../hucre_listesi/model/hucre_listesi_request_model.dart";
import "../model/hucredeki_stoklar_model.dart";
import "../view_model/hucredeki_stoklar_view_model.dart";

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
  Widget build(BuildContext context) => BaseScaffold(
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
              child: Observer(
                builder: (_) => RefreshableListView(onRefresh: viewModel.getData, items: viewModel.observableList, itemBuilder: hucredekiStoklarCard),
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Card hucredekiStoklarCard(HucredekiStoklarModel item) => Card(
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
      );
}
