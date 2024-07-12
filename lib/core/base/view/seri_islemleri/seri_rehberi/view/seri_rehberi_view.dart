import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/seri_islemleri/seri_rehberi/view_model/seri_rehberi_view_model.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SeriRehberiView extends StatefulWidget {
  final StokListesiModel stokModel;
  final bool uskMi;
  const SeriRehberiView({super.key, required this.stokModel}) : uskMi = false;
  const SeriRehberiView.usk({super.key, required this.stokModel}) : uskMi = true;

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
    viewModel.requestModel.belgeTipi = (widget.uskMi ? "USK" : BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue);
    viewModel.requestModel.belgeTarihi = widget.stokModel.belgeTarihi.toDateStringIfNull;
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
            if (viewModel.isSearchBarOpen) {
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
            onPressed: () => viewModel.changeSearchBarStatus(),
            icon: Observer(
              builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
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
            child: Observer(
              builder: (_) => RefreshableListView(
                onRefresh: viewModel.getData,
                items: viewModel.filteredList,
                itemBuilder: (item) => Card(
                  child: ListTile(
                    onTap: () async {
                      Get.back(result: item);
                    },
                    title: Text(item.seriNo ?? ""),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Açıklama 1: ${item.acik1 ?? ""}").yetkiVarMi(item.acik1 != null),
                        Text("Açıklama 2: ${item.acik2 ?? ""}").yetkiVarMi(item.acik2 != null),
                        Text("Miktar: ${item.miktar.toIntIfDouble ?? ""}"),
                        Text("Depo: ${item.depoKodu ?? ""} - ${item.depoTanimi ?? ""}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
