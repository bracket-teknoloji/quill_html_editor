import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/seri_islemleri/seri_rehberi/view_model/seri_rehberi_view_model.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SeriRehberiView extends StatefulWidget {
  final StokListesiModel stokModel;
  const SeriRehberiView({super.key, required this.stokModel});

  @override
  State<SeriRehberiView> createState() => _SeriRehberiViewState();
}

class _SeriRehberiViewState extends State<SeriRehberiView> {
  SeriRehberiViewModel viewModel = SeriRehberiViewModel();

  @override
  void initState() {
    viewModel.requestModel.stokKodu = widget.stokModel.stokKodu;
    viewModel.requestModel.depoKodu = widget.stokModel.depoKodu;
    viewModel.requestModel.cariKodu = BaseSiparisEditModel.instance.cariKodu;
    viewModel.requestModel.belgeTipi = BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue;
    viewModel.requestModel.belgeNo = BaseSiparisEditModel.instance.belgeNo;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body().paddingAll(UIHelper.lowSize),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                onChanged: (value) async {
                  viewModel.setSearchText(value);
                },
              );
            }
            return AppBarTitle(
              title: "Seri Seç",
              subtitle: (viewModel.filteredList?.length ?? 0).toStringIfNotNull,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => viewModel.changeSearchBar(),
            icon: Observer(
              builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
      );

  Column body() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Stok Adı: ${widget.stokModel.stokAdi ?? ""}",
            overflow: TextOverflow.ellipsis,
          ).paddingAll(UIHelper.lowSize),
          Text("Stok Kodu: ${widget.stokModel.stokKodu ?? ""}").paddingAll(UIHelper.lowSize),
          Text("Depo Kodu: ${widget.stokModel.depoKodu ?? 0}").paddingAll(UIHelper.lowSize),
          Expanded(
            child: RefreshIndicator.adaptive(
              child: Observer(
                builder: (_) {
                  if (viewModel.filteredList.ext.isNullOrEmpty) {
                    if (viewModel.filteredList != null) {
                      return const Center(
                        child: Text("Seri bulunamadı."),
                      );
                    } else {
                      return const ListViewShimmer();
                    }
                  }
                  return ListView.builder(
                    itemCount: viewModel.filteredList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final SeriList model = viewModel.filteredList![index];
                      return Card(
                        child: ListTile(
                          onTap: () async {
                            Get.back(result: model);
                          },
                          title: Text(model.seriNo ?? ""),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Açıklama 1: ${model.acik1 ?? ""}").yetkiVarMi(model.acik1 != null),
                              Text("Açıklama 2: ${model.acik2 ?? ""}").yetkiVarMi(model.acik2 != null),
                              Text("Miktar: ${model.miktar.toIntIfDouble ?? ""}"),
                              Text("Depo: ${model.depoKodu ?? ""} - ${model.depoTanimi ?? ""}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              onRefresh: () async {},
            ),
          ),
        ],
      );
}
