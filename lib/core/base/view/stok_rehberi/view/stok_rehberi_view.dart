import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';
import '../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import '../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../components/floating_action_button/custom_floating_action_button.dart';
import '../../../../components/textfield/custom_text_field.dart';
import '../../../../constants/enum/base_edit_enum.dart';
import '../../../../constants/extensions/number_extensions.dart';
import '../../../../constants/ui_helper/ui_helper.dart';
import '../../../../init/network/login/api_urls.dart';
import '../../../model/base_edit_model.dart';
import '../../../model/generic_response_model.dart';
import '../../../state/base_state.dart';
import '../view_model/stok_rehberi_view_model.dart';

class StokRehberiView extends StatefulWidget {
  final String? searchText;
  const StokRehberiView({super.key, this.searchText});

  @override
  State<StokRehberiView> createState() => _StokRehberiViewState();
}

class _StokRehberiViewState extends BaseState<StokRehberiView> {
  late ScrollController _scrollController;
  late final TextEditingController _searchTextController;
  StokRehberiViewModel viewModel = StokRehberiViewModel();
  @override
  void initState() {
    _scrollController = ScrollController();
    _searchTextController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.searchText != null) {
        viewModel.setSearchText(widget.searchText!);
        _searchTextController.text = widget.searchText!;
      }
      getData();
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        await Future.delayed(const Duration(milliseconds: 500), () => getData());
        viewModel.changeIsScrolledDown(true);
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back(result: true)),
        title: const Text("Stok Rehberi"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined)),
          IconButton(
              onPressed: () async {
                var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                    title: "Sırala",
                    children: List.generate(
                        viewModel.siralamaMap.length, (index) => BottomSheetModel(title: viewModel.siralamaMap.keys.toList()[index], value: viewModel.siralamaMap.values.toList()[index])));
                if (result != null) {
                  viewModel.setSiralama(result);
                  resetData();
                }
              },
              icon: const Icon(Icons.sort_by_alpha_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          IconButton(onPressed: () => Get.back(result: true), icon: Icon(Icons.check_circle, color: UIHelper.primaryColor)),
        ],
      ),
      floatingActionButton: Observer(
          builder: (_) => CustomFloatingActionButton(
              isScrolledDown: viewModel.isScrolledDown,
              onPressed: () async {
                var result = await Get.toNamed("/mainPage/stokEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel()));
                if (result != null) {
                  resetData();
                }
              })),
      body: Column(
        children: [
          CustomTextField(
            labelText: "Ara",
            controller: _searchTextController,
            onSubmitted: (p0) {
              viewModel.setSearchText(p0);
              resetData();
            },
            suffix: Wrap(
              children: [
                IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      viewModel.setSearchText(_searchTextController.text);
                      resetData();
                    }),
                IconButton(
                    icon: const Icon(Icons.qr_code_2_outlined),
                    onPressed: () async {
                      var result = await Get.toNamed("/qr");
                      if (result != null) {
                        _searchTextController.text = result;
                        viewModel.setSearchText(result);
                        resetData();
                      }
                    })
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                viewModel.resetSayfa();
                viewModel.setDahaVarMi(true);
                viewModel.setStokListesi(null);
                return getData();
              },
              child: Observer(
                  builder: (_) => viewModel.stokListesi.ext.isNullOrEmpty
                      ? (viewModel.stokListesi?.isEmpty ?? false)
                          ? const Center(child: Text("Stok Bulunamadı"))
                          : const Center(child: CircularProgressIndicator.adaptive())
                      : Observer(builder: (_) {
                          return ListView.builder(
                              primary: false,
                              padding: UIHelper.lowPadding,
                              controller: _scrollController,
                              itemCount: viewModel.stokListesi?.length != null ? viewModel.stokListesi!.length + 1 : 0,
                              itemBuilder: (context, index) {
                                if (index == viewModel.stokListesi?.length) {
                                  return Visibility(
                                    visible: viewModel.dahaVarMi,
                                    child: const Center(child: CircularProgressIndicator.adaptive()),
                                  );
                                } else {
                                  StokListesiModel? stok = viewModel.stokListesi?[index];
                                  return Card(
                                    child: ListTile(
                                      onTap: () async {
                                        if (BaseSiparisEditModel.instance.kalemEkliMi(stok)) {
                                          var result = await dialogManager.showStokKayitliDialog(viewModel.stokListesi![index]);
                                          if (result != true) {
                                            return;
                                          }
                                        }
                                        var result = Get.toNamed("/kalemEkle", arguments: stok);
                                      },
                                      title: Text(stok?.stokKodu ?? "", textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            spacing: UIHelper.lowSize,
                                            children: [
                                              (stok?.seriCikislardaAcik ?? false) ? const Badge(label: Text("Seri")) : const SizedBox(),
                                              (stok?.satDovTip != null || stok?.alisDovTip != null) ? Badge(label: Text("Dövizli ${stok?.satisDovizAdi ?? ""}")) : const SizedBox()
                                            ],
                                          ),
                                          Text(stok?.stokAdi ?? ""),
                                        ],
                                      ),
                                      trailing: Text("${stok?.bakiye.commaSeparated ?? 0} ${stok?.olcuBirimi ?? ""}"),
                                    ),
                                  );
                                }
                              });
                        })),
            ),
          ),
        ],
      ),
    );
  }

  void resetData() {
    viewModel.resetSayfa();
    viewModel.setDahaVarMi(true);
    viewModel.setStokListesi(null);
    getData();
  }

  void getData() async {
    viewModel.setDahaVarMi(false);
    GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: viewModel.stokBottomSheetModel, bodyModel: StokListesiModel());
    if (response.success == true && response.data is List) {
      if (response.data?.length == 25) {
        viewModel.setDahaVarMi(true);
        viewModel.increaseSayfa();
      }
      viewModel.setStokListesi(response.data as List);
    }
  }
}
