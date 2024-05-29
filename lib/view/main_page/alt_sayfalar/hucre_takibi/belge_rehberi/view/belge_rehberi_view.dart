import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/card/belge_rehberi_card.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/view_model/belge_rehberi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";

final class BelgeRehberiView extends StatefulWidget {
  final HucreTransferiModel model;
  const BelgeRehberiView({super.key, required this.model});

  @override
  State<BelgeRehberiView> createState() => _BelgeRehberiViewState();
}

final class _BelgeRehberiViewState extends State<BelgeRehberiView> {
  final BelgeRehberiViewModel viewModel = BelgeRehberiViewModel();
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    viewModel.setHucreTransferiModel(BelgeRehberiRequestModel.fromHucreTransferiModel(widget.model));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Belge Rehberi (${viewModel.belgeRehberiList?.length ?? 0})",
              subtitle: EditTipiEnum.values.where((element) => element.rawValue == widget.model.pickerBelgeTuru).firstOrNull?.getName,
            ),
          ),
        ),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Belge No",
              controller: searchController,
              onChanged: viewModel.setSearchText,
              onSubmitted: (value) => viewModel.getData(),
              suffix: IconButton(
                onPressed: () async {
                  final result = await Get.toNamed("qr");
                  if (result is String) {
                    searchController.text = result;
                    viewModel.setSearchText(result);
                    await viewModel.getData();
                  }
                },
                icon: const Icon(Icons.qr_code_scanner_outlined),
              ),
            ).paddingAll(UIHelper.lowSize),
            Expanded(
              child: Observer(
                builder: (_) => RefreshableListView<BelgeRehberiModel>(
                  onRefresh: viewModel.getData,
                  items: viewModel.belgeRehberiList,
                  itemBuilder: (item) => BelgeRehberiCard(model: item),
                ),
              ),
            ),
          ],
        ),
      );
}
