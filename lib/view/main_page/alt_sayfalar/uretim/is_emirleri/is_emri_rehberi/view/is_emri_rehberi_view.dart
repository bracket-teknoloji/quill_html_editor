import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/is_emirleri_model.dart";
import "../view_model/is_emri_rehberi_view_model.dart";

final class IsEmriRehberiView extends StatefulWidget {
  final bool? isGetData;
  final String? stokKodu;
  const IsEmriRehberiView({super.key, this.isGetData, this.stokKodu});

  @override
  State<IsEmriRehberiView> createState() => _IsEmriRehberiViewState();
}

final class _IsEmriRehberiViewState extends BaseState<IsEmriRehberiView> {
  final IsEmriRehberiViewModel viewModel = IsEmriRehberiViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController _appBarTextController;

  @override
  void initState() {
    if (widget.stokKodu != null) {
      viewModel.setStokKodu(widget.stokKodu);
    }
    _scrollController = ScrollController();
    _appBarTextController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        viewModel.changeScrollStatus(_scrollController.position);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _appBarTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: fab().yetkiVarMi(yetkiController.uretimIsEmriEkle),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpen) {
              return CustomAppBarTextField(
                controller: _appBarTextController,
                onFieldSubmitted: (value) async {
                  viewModel.requestModel.searchText = value;
                  await viewModel.resetList();
                },
              );
            }
            return AppBarTitle(
              title: "İş Emri Rehberi",
              subtitle: (viewModel.observableList?.length ?? 0).toStringIfNotNull,
            );
          },
        ),
        actions: [
          IconButton(onPressed: viewModel.changeSearchBarStatus, icon: Observer(builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined))),
          IconButton(
            onPressed: () async {
              final result = await Get.toNamed("/qr");
              if (result != null) {
                viewModel.requestModel.searchText = result;
                _appBarTextController.text = result;
                if (!viewModel.isSearchBarOpen) {
                  viewModel.changeSearchBarStatus();
                }
                await viewModel.resetList();
              }
            },
            icon: const Icon(Icons.qr_code_scanner),
          ).yetkiVarMi(widget.isGetData == true),
          //TODO sadece rehber olarak kullanıldığında görünecek.
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort_by_alpha_outlined)).yetkiVarMi(widget.isGetData == true),
        ],
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            Get.toNamed("/mainPage/isEmriEdit", arguments: BaseEditModel<IsEmirleriModel>(baseEditEnum: BaseEditEnum.ekle));
          },
        ),
      );

  Widget body() => Observer(
        builder: (_) => RefreshableListView.pageable(
          scrollController: _scrollController,
          dahaVarMi: viewModel.dahaVarMi,
          onRefresh: viewModel.resetList,
          items: viewModel.observableList,
          itemBuilder: (item) => Card(
            child: ListTile(
              onTap: () {
                if (widget.isGetData ?? false) {
                  Get.back(result: item);
                  return;
                }
                bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: item.isemriNo ?? "",
                  children: [
                    BottomSheetModel(
                      title: loc.generalStrings.view,
                      iconWidget: Icons.preview_outlined,
                      onTap: () {
                        Get.back();
                        return Get.toNamed("/mainPage/isEmriEdit", arguments: BaseEditModel<IsEmirleriModel>(baseEditEnum: BaseEditEnum.goruntule, model: item));
                      },
                    ),
                    BottomSheetModel(
                      title: loc.generalStrings.edit,
                      iconWidget: Icons.edit_outlined,
                      onTap: () async {
                        Get.back();
                        Get.toNamed(
                          "/mainPage/isEmriEdit",
                          arguments: BaseEditModel<IsEmirleriModel>(baseEditEnum: BaseEditEnum.duzenle, model: item),
                        );
                      },
                    ),
                    BottomSheetModel(title: loc.generalStrings.delete, iconWidget: Icons.delete_outline_outlined),
                    BottomSheetModel(
                      title: "Stok İşlemleri",
                      iconWidget: Icons.list_alt_outlined,
                      onTap: () async {
                        Get.back();
                        dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)));
                      },
                    ),
                  ],
                );
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.isemriNo ?? ""),
                  Text(item.tarih.toDateString),
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(item.kapali == "E"),
                      const ColorfulBadge(label: Text("Rework"), badgeColorEnum: BadgeColorEnum.rework).yetkiVarMi(item.rework == "E"),
                    ].whereType<ColorfulBadge>().map((e) => e.paddingOnly(right: UIHelper.lowSize)).toList(),
                  ),
                  CustomLayoutBuilder(
                    splitCount: 2,
                    children: [
                      Text("Stok Kodu: ${item.stokKodu ?? ""}"),
                      Text("YapKod: ${item.yapkod ?? ""}"),
                      Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.stokOlcuBirimi ?? ""}"),
                      Text("Üretilen: ${item.tamamlanan.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      Text("Kalan Miktar: ${item.kalan.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      Text("Proje Kodu: ${item.projeKodu ?? ""}"),
                      Text("Teslim Tarihi: ${item.teslimTarihi.toDateString}"),
                      Text("Giriş Depo: ${item.girisDepo} - ${item.girisDepoAdi}").yetkiVarMi(item.girisDepo != null),
                      Text("Çıkış Depo: ${item.cikisDepo} - ${item.cikisDepoAdi}").yetkiVarMi(item.cikisDepo != null),
                    ].whereType<Text>().toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
