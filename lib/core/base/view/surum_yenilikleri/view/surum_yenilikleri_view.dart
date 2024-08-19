import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";

import "../../../../../view/add_company/model/account_model.dart";
import "../../../../components/textfield/custom_app_bar_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../model/surum_yenilikleri_model.dart";
import "../view_model/surum_yenilikleri_view_model.dart";

final class SurumYenilikleriView extends StatefulWidget {
  const SurumYenilikleriView({super.key});

  @override
  State<SurumYenilikleriView> createState() => _SurumYenilikleriViewState();
}

final class _SurumYenilikleriViewState extends BaseState<SurumYenilikleriView> {
  final SurumYenilikleriViewModel viewModel = SurumYenilikleriViewModel();
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => viewModel.searchBar
                ? CustomAppBarTextField(controller: _searchController, onChanged: viewModel.setSearchText)
                : AppBarTitle(title: "Sürüm Yenilikleri", subtitle: "Versiyon Kodunuz: ${AccountModel.instance.uygulamaSurumu}"),
          ),
          actions: [
            IconButton(
              onPressed: () {
                viewModel.changeSearchBar();
                if (!viewModel.searchBar) {
                  _searchController.clear();
                  viewModel.setSearchText(null);
                }
              },
              icon: Observer(
                builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
              ),
            ),
          ],
        ),
        body: Observer(
          builder: (_) => RefreshableListView(
            onRefresh: viewModel.getData,
            items: viewModel.getSurumYenilikleriModelList,
            itemBuilder: (item) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.versiyon ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.tarih?.add(Duration(minutes: AccountModel.instance.cihazTimeZoneDakika ?? 0)).toDateString ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ).paddingSymmetric(horizontal: UIHelper.lowSize),
                ListView.builder(
                  shrinkWrap: true,
                  padding: UIHelper.zeroPadding,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: item.liste?.length ?? 0,
                  itemBuilder: (context, index) {
                    final ValueList? newItem = item.liste?[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text("• ${newItem?.aciklama ?? ""}"),
                      ),
                    );
                  },
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );
}
