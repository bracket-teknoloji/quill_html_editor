import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/core/base/view/genel_rehber/view_model/genel_rehber_view_model.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

final class GenelRehberView extends StatefulWidget {
  const GenelRehberView({required this.model, super.key});

  final EkRehberRequestModel model;

  @override
  State<GenelRehberView> createState() => _GenelRehberViewState();
}

final class _GenelRehberViewState extends State<GenelRehberView> {
  late final GenelRehberViewModel _viewModel;

  @override
  void initState() {
    _viewModel = GenelRehberViewModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await _viewModel.getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => _viewModel.isSearchBarOpen
                ? CustomAppBarTextField(
                    onChanged: _viewModel.setSearchText,
                  )
                : AppBarTitle(
                    title: "${widget.model.baslik} Rehberi",
                    subtitle: "${_viewModel.observableList?.length ?? 0}",
                  ),
          ),
          actions: [
            IconButton(
              icon: Observer(
                builder: (_) => Icon(
                  _viewModel.isSearchBarOpen ? Icons.close : Icons.search,
                ),
              ),
              onPressed: _viewModel.changeSearchBarStatus,
            ),
          ],
        ),
        body: Observer(
          builder: (_) => RefreshableListView<GenelRehberModel>(
            onRefresh: _viewModel.getData,
            items: _viewModel.filteredObservableList,
            itemBuilder: (item) => Card(
              child: ListTile(
                onTap: () => Get.back(result: item),
                title: Text(item.adi ?? item.kodu ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.adi != null && item.adi != item.kodu) Text(item.kodu ?? ""),
                    Text(item.aciklama ?? ""),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
