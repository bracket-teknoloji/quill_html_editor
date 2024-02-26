import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/view_model/is_emri_rehberi_view_model.dart";

class IsEmriRehberiView extends StatefulWidget {
  final bool? isGetData;
  const IsEmriRehberiView({super.key, this.isGetData});

  @override
  State<IsEmriRehberiView> createState() => _IsEmriRehberiViewState();
}

class _IsEmriRehberiViewState extends BaseState<IsEmriRehberiView> {
  IsEmriRehberiViewModel viewModel = IsEmriRehberiViewModel();
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrollDown(true);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                onFieldSubmitted: (value) async {
                  viewModel.requestModel.searchText = value;
                  await viewModel.resetPage();
                },
              );
            }
            return AppBarTitle(
              title: "İş Emri Rehberi",
              subtitle: (viewModel.isEmriList?.length ?? 0).toStringIfNotNull,
            );
          },
        ),
        actions: [
          IconButton(onPressed: () => viewModel.changeSearchBar(), icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined))),
          //TODO sadece rehber olarak kullanıldığında görünecek.
          // IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner_outlined)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.sort_by_alpha_outlined)),
        ],
      );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
        isScrolledDown: true && yetkiController.uretimIsEmriEkle,
        onPressed: () async {
          Get.toNamed("/mainPage/isEmriDetay");
        },
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          await viewModel.resetPage();
        },
        child: Observer(
          builder: (_) {
            if (viewModel.isEmriList.ext.isNullOrEmpty) {
              if (viewModel.isEmriList != null) {
                return const Center(child: Text("İş Emri Kaydı Bulunamadı."));
              } else {
                return const ListViewShimmer();
              }
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: viewModel.isEmriList?.length ?? 0,
              itemBuilder: (context, index) {
                final IsEmirleriModel item = viewModel.isEmriList![index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      if (widget.isGetData ?? false) {
                        Get.back(result: item);
                      }
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.isemriNo ?? ""),
                        Text(item.tarih.toDateString),
                      ],
                    ),
                    subtitle: CustomLayoutBuilder(
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
                  ),
                );
              },
            );
          },
        ),
      );
}
