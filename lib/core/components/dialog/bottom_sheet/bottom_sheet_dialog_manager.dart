// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_kosullar_model.dart";
import "../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../../../base/model/base_grup_kodu_model.dart";
import "../../../base/model/belge_tipi_model.dart";
import "../../../base/model/print_model.dart";
import "../../../constants/extensions/list_extensions.dart";
import "../../../constants/ui_helper/icon_helper.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../../init/cache/cache_manager.dart";
import "../../helper_widgets/responsive_height_box.dart";
import "../dialog_manager.dart";
import "model/bottom_sheet_model.dart";
import "view_model/bottom_sheet_state_manager.dart";

class BottomSheetDialogManager {
  BottomSheetStateManager viewModel = BottomSheetStateManager();
  Future<dynamic> showBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel>? children, bool aramaVarMi = false}) async {
    final List<BottomSheetModel>? children2 = children;
    //if keyboard is open, close it
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      // constraints: BoxConstraints(maxHeight: Get.height * 0.9),
      barrierColor: Colors.black.withOpacity(0.6),
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: <Widget>[
              ListTile(
                contentPadding: UIHelper.lowPadding,
                title: Text(title, style: context.theme.textTheme.titleMedium).paddingOnly(left: UIHelper.lowSize),
                trailing: IconButton(icon: const Icon(Icons.close), onPressed: Get.back),
                splashColor: Colors.transparent,
              ).paddingSymmetric(vertical: UIHelper.midSize),
              const Divider(
                thickness: 2,
                endIndent: 0,
                indent: 0,
              ),
              if (body == null && ((children?.length ?? 0) > 20))
                TextField(
                  decoration: const InputDecoration(hintText: "Aramak istediğiniz metni yazınız."),
                  onSubmitted: (String value) {
                    if (value == "") {
                      children = children2;
                    }
                    children = children!.where((BottomSheetModel element) => element.title.toLowerCase().contains(value.toLowerCase())).toList();
                  },
                ).paddingAll(UIHelper.midSize)
              else
                const SizedBox(),
              if (body == null)
                children.ext.isNotNullOrEmpty
                    ? SizedBox(
                        // if children are not fit to screen, it will be scrollable
                        height: children!.length * ((children?.any((BottomSheetModel element) => element.description.ext.isNotNullOrNoEmpty) ?? false) ? 60 : 50) < Get.height * 0.9
                            ? children!.length * ((children?.any((BottomSheetModel element) => element.description.ext.isNotNullOrNoEmpty) ?? false) ? 60 : 50)
                            : Get.height * 0.9,
                        child: ListView.builder(
                          itemCount: children?.length,
                          itemBuilder: (BuildContext context, int index) => Column(
                            children: <Widget>[
                              ListTile(
                                onTap: children?[index].onTap ?? () => Get.back(result: children![index].value),
                                title: Text(children![index].title),
                                subtitle: children![index].description != null
                                    ? Text(children![index].description ?? "", style: TextStyle(color: context.theme.textTheme.bodyLarge?.color?.withOpacity(0.6)))
                                    : null,
                                leading: children![index].icon != null || children![index].iconWidget != null
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: children![index].iconWidget != null
                                            ? Icon(children![index].iconWidget, size: 25, color: UIHelper.primaryColor)
                                            : IconHelper.smallIcon(children![index].icon!),
                                      )
                                    : null,
                              ),
                              if (index != children!.length - 1)
                                Padding(
                                  padding: UIHelper.lowPaddingVertical,
                                  child: const Divider(),
                                )
                              else
                                Container(),
                            ],
                          ),
                        ).paddingOnly(bottom: UIHelper.midSize),
                      )
                    : Center(child: Text("Veri bulunamadı.", style: context.theme.textTheme.titleMedium)).paddingAll(UIHelper.highSize)
              else
                SafeArea(
                  child: Container(constraints: BoxConstraints(maxHeight: Get.height * 0.9), child: SingleChildScrollView(child: body.paddingAll(UIHelper.lowSize))),
                ),
              if (context.general.isKeyBoardOpen && body == null) const ResponsiveBox() else Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showRadioBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel?>? children}) async {
    children = children?.nullCheckWithGeneric;
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              contentPadding: UIHelper.lowPadding,
              title: Text(title, style: context.theme.textTheme.titleMedium).paddingOnly(left: UIHelper.lowSize),
              trailing: IconButton(icon: const Icon(Icons.close), onPressed: Get.back),
              splashColor: Colors.transparent,
            ).paddingSymmetric(vertical: UIHelper.midSize),
            const Divider(
              thickness: 2,
              endIndent: 0,
              indent: 0,
            ),
            if (body == null)
              if (children.ext.isNotNullOrEmpty)
                SizedBox(
                  // if children are not fit to screen, it will be scrollable
                  height: children!.length * 50 < Get.height * 0.8 ? children.length * 50 : Get.height * 0.8,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Wrap(
                              children: <Widget>[
                                ...List.generate(
                                  children.length,
                                  (int index) => Wrap(
                                    children: [
                                      RadioListTile(
                                        activeColor: UIHelper.primaryColor,
                                        onChanged: (String? value) {
                                          viewModel.changeRadioGroupValue(title);
                                          if (children?[index]?.onTap != null) {
                                            children?[index]?.onTap!();
                                          } else {
                                            Get.back(result: children![index]?.value);
                                          }
                                        },
                                        value: children?[index]?.title ?? "",
                                        groupValue: viewModel.radioGroupValue,
                                        title: Text(children![index]!.title),
                                        subtitle: children[index]?.description != null
                                            ? Text(children[index]!.description ?? "", style: TextStyle(color: context.theme.textTheme.bodyLarge?.color?.withOpacity(0.6)))
                                            : null,
                                      ),
                                      if (index != children.length - 1)
                                        Padding(
                                          padding: UIHelper.lowPaddingVertical,
                                          child: const Divider(),
                                        )
                                      else
                                        Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ).paddingOnly(bottom: UIHelper.midSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Center(child: const Text("Veri Yok").paddingAll(UIHelper.highSize))
            else
              WillPopScope(
                child: SingleChildScrollView(child: body),
                onWillPop: () async {
                  final Widget result = body;
                  Get.back(result: result);
                  return true;
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showCheckBoxBottomSheetDialog(BuildContext context, {List<BottomSheetModel>? children, required String title, bool onlyValue = false}) async {
    List<dynamic>? list;
    if (viewModel.isSelectedListMap?[title] == null) {
      viewModel.changeIsSelectedListMap(title, List.generate(children!.length, (int index) => false));
    } else {
      if (children!.length != viewModel.isSelectedListMap?[title]!.length) {
        viewModel.changeIsSelectedListMap(title, List.generate(children.length, (int index) => false));
      }
    }
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              contentPadding: UIHelper.lowPadding,
              title: Text(title, style: context.theme.textTheme.titleMedium).paddingOnly(left: UIHelper.lowSize),
              trailing: IconButton(icon: const Icon(Icons.close), onPressed: Get.back),
              splashColor: Colors.transparent,
            ).paddingSymmetric(vertical: UIHelper.midSize),
            const Divider(
              thickness: 2,
              endIndent: 0,
              indent: 0,
            ),
            if (children.ext.isNotNullOrEmpty)
              SizedBox(
                // if children are not fit to screen, it will be scrollable
                height: (children.length + 1) * 50 < Get.height * 0.8 ? (children.length + 1) * 50 : Get.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: List.generate(
                            children.length,
                            (int index) => Wrap(
                              children: <Widget>[
                                Observer(
                                  builder: (_) => CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.leading,
                                    value: viewModel.isSelectedListMap?[title]![index],
                                    title: Text(children[index].title),
                                    onChanged: (bool? value) {
                                      viewModel.changeIndexIsSelectedListMap(title, index, value!);
                                      // viewModel.isSelectedListMap![title]![index] = value!;
                                      list = selectedChecker(children, title, onlyValue);
                                      if (children[index].onTap != null) {
                                        children[index].onTap!();
                                      }
                                      // if (!value) {
                                      //   list!.remove(children[index].title);
                                      // }
                                    },
                                  ),
                                ),
                                if (index != children.length - 1)
                                  Padding(
                                    padding: UIHelper.lowPaddingVertical,
                                    child: const Divider(),
                                  )
                                else
                                  Container(),
                              ],
                            ).paddingOnly(bottom: UIHelper.midSize),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        list = selectedChecker(children, title, onlyValue);
                        Get.back(result: list);
                      },
                      child: const Text("Seç"),
                    ),
                  ],
                ),
              )
            else
              Wrap(children: <Widget>[Center(child: const Text("Veri Yok").paddingAll(UIHelper.highSize))]),
          ],
        ).paddingAll(UIHelper.midSize),
      ),
    );
  }

  List<dynamic> selectedChecker(List<BottomSheetModel>? children, String title, bool onlyValue) {
    final List list = [];
    for (int i = 0; i < viewModel.isSelectedListMap![title]!.length; i++) {
      if (viewModel.isSelectedListMap![title]![i]) {
        list.add(children![i].value ?? (onlyValue ? null : children[i].title));
      }
    }
    return list;
  }

  void clearSelectedData() {
    viewModel.deleteIsSelectedListMap();
  }

  Future<DepoList?> showDepoBottomSheetDialog(BuildContext context) async => await showRadioBottomSheetDialog(
        context,
        title: "Depo seç",
        children: CacheManager.getAnaVeri?.paramModel?.depoList?.map((DepoList e) => BottomSheetModel(title: e.depoTanimi ?? "", value: e)).toList(),
      );

  Future<DepoList?> showTopluDepoBottomSheetDialog(BuildContext context) async {
    final List<int>? onayList = CacheManager.getAnaVeri?.userModel?.kullaniciYetki?.sirketAktifDepolar;
    final List<DepoList> depoList = CacheManager.getAnaVeri?.paramModel?.depoList ?? <DepoList>[];
    final List<DepoList> filteredDepoList = depoList.where((DepoList element) => onayList?.contains(element.depoKodu) ?? true).toList();
    return await showRadioBottomSheetDialog(
      context,
      title: "Depo seç",
      children: filteredDepoList.map((DepoList e) => BottomSheetModel(title: e.depoTanimi ?? "", value: e)).toList(),
      // children: CacheManager.getAnaVeri?.userModel?.profilYetki?.sirketAktifDepolar,
    );
  }

  Future<ListCariOdemeKodu?> showOdemeKoduBottomSheetDialog(BuildContext context) async => await showRadioBottomSheetDialog(
        context,
        title: "Ödeme Kodu seç",
        children: CacheManager.getAnaVeri?.paramModel?.listCariOdemeKodu?.map((ListCariOdemeKodu e) => BottomSheetModel(title: e.aciklama ?? "", value: e)).toList(),
      );
  Future<String?> showCariTipiBottomSheetDialog(BuildContext context) async => await showRadioBottomSheetDialog(
        context,
        title: "Tipi seç",
        children: <BottomSheetModel?>[
          BottomSheetModel(title: "Alıcı", value: "A", onTap: () => Get.back(result: "Alıcı")),
          BottomSheetModel(title: "Satıcı", value: "S", onTap: () => Get.back(result: "Satıcı")),
          BottomSheetModel(title: "Toptancı", value: "T", onTap: () => Get.back(result: "Toptancı")),
          BottomSheetModel(title: "Kefil", value: "K", onTap: () => Get.back(result: "Kefil")),
          BottomSheetModel(title: "Müstahsil", value: "M", onTap: () => Get.back(result: "Müstahsil")),
          BottomSheetModel(title: "Diğer", value: "D", onTap: () => Get.back(result: "Diğer")),
          BottomSheetModel(title: "Komisyoncu", value: "I", onTap: () => Get.back(result: "Komisyoncu")),
        ],
      );
  Future<List<PlasiyerList?>?> showPlasiyerListesiBottomSheetDialog(BuildContext context) async {
    final List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList ?? <PlasiyerList>[];
    final result = await showCheckBoxBottomSheetDialog(
      context,
      title: "Plasiyer Seçiniz",
      children: plasiyerList.map((PlasiyerList e) => BottomSheetModel(title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "", value: e)).toList(),
    );
    if (result != null) {}
    return result?.cast<PlasiyerList>();
    // return null;
  }

  Future<List<BaseGrupKoduModel?>?> showGrupKoduCheckBoxBottomSheetDialog(BuildContext context, {required GrupKoduEnum modul, required int grupKodu, bool? kullanimda}) async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      viewModel.changeGrupKoduList(await NetworkManager().getGrupKod(name: modul.name, grupNo: -1, kullanimda: kullanimda));
    }
    viewModel.filteredGrupKoduListFilter(grupKodu);
    final result = await showCheckBoxBottomSheetDialog(
      context,
      title: "Grup Kodu($grupKodu) Seçiniz",
      children: viewModel.filteredGrupKoduList?.map((BaseGrupKoduModel e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList(),
    );
    if (result != null) {
      return result.cast<BaseGrupKoduModel>();
    }
    return null;
  }

  Future<BaseGrupKoduModel?> showGrupKoduBottomSheetDialog(BuildContext context, {required GrupKoduEnum modul, required int grupKodu, bool? kullanimda}) async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      viewModel.changeGrupKoduList(await NetworkManager().getGrupKod(name: modul.name, grupNo: -1, kullanimda: kullanimda));
    }
    viewModel.filteredGrupKoduListFilter(grupKodu);
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Grup Kodu Seçiniz",
      children: viewModel.filteredGrupKoduList?.map((BaseGrupKoduModel e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList(),
    );
    if (result != null) {
      return result;
    }
    return null;
  }

  Future<StokMuhasebeKoduModel?> showMuhasebeKoduBottomSheetDialog(BuildContext context, {bool? stokMu}) async {
    if (viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      viewModel.changeMuhasebeKoduList(await NetworkManager().getMuhasebeKodlari());
    }
    return await showBottomSheetDialog(
      context,
      title: "Muhasebe Kodu Seçiniz",
      children: viewModel.muhasebeKoduList
          ?.map((StokMuhasebeKoduModel e) => BottomSheetModel(title: e.adi ?? e.muhKodu.toStringIfNotNull ?? "", description: "ALIŞ: ${e.alisHesabi ?? ""}\nSATIŞ: ${e.satisHesabi ?? ""}", value: e))
          .toList(),
    );
  }

  Future<StokMuhasebeKoduModel?> showMuhasebeMuhasebeKoduBottomSheetDialog(BuildContext context, {MuhasebeBelgeTipiEnum? belgeTipi, String? hesapTipi}) async {
    if (viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      final Map<String, dynamic> queryparams = <String, dynamic>{"BelgeTipi": belgeTipi.value, "HesapTipi": hesapTipi ?? "A", "MuhRefKodGelsin": "H", "EkranTipi": "R"};
      viewModel.changeMuhasebeKoduList(await NetworkManager().getMuhasebeKodlari(stokMu: false, queryParams: queryparams));
    }
    return await showBottomSheetDialog(
      context,
      title: "Muhasebe Kodu Seçiniz",
      children: viewModel.muhasebeKoduList?.map((StokMuhasebeKoduModel e) => BottomSheetModel(title: e.hesapAdi ?? e.hesapKodu ?? "", description: e.hesapKodu, value: e)).toList(),
    );
  }

  Future<PlasiyerList?> showPlasiyerBottomSheetDialog(BuildContext context) async {
    final List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList ?? <PlasiyerList>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Plasiyer Seçiniz",
      children: plasiyerList.map((PlasiyerList e) => BottomSheetModel(title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "", description: e.plasiyerKodu, value: e)).toList(),
    );
  }

  Future<BaseProjeModel?> showProjeBottomSheetDialog(BuildContext context) async {
    final List<BaseProjeModel> projeList = await NetworkManager().getProjeData() ?? <BaseProjeModel>[];
    final BaseProjeModel? proje = await showRadioBottomSheetDialog(
      context,
      title: "Proje Seçiniz",
      children: projeList.map((BaseProjeModel e) => BottomSheetModel(title: e.projeAciklama ?? e.projeKodu ?? "", description: e.projeKodu, value: e)).toList(),
    );
    return proje;
  }

  Future<DovizList?> showDovizBottomSheetDialog(BuildContext context) async {
    final List<DovizList> dovizList = CacheManager.getAnaVeri?.paramModel?.dovizList ?? <DovizList>[];
    final DovizList? doviz = await showRadioBottomSheetDialog(
      context,
      title: "Döviz Seçiniz",
      children: dovizList.map((DovizList e) => BottomSheetModel(title: e.isim ?? e.dovizKodu.toStringIfNotNull ?? "", value: e)).toList(),
    );
    return doviz;
  }

  Future<YaziciList?> showYaziciBottomSheetDialog(BuildContext context) async {
    final List<YaziciList>? yaziciList = CacheManager.getAnaVeri?.paramModel?.yaziciList;
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Yazıcı Seçiniz",
      children: yaziciList
              ?.map(
                (YaziciList e) => BottomSheetModel(
                  title: e.yaziciAdi ?? e.aciklama ?? "",
                  onTap: () {
                    Get.back(result: e);
                  },
                ),
              )
              .toList() ??
          [].cast<BottomSheetModel>(),
    );
    if (result != null && result is YaziciList) {
      return result;
    }
    return null;
  }

  Future<NetFectDizaynList?> showDizaynBottomSheetDialog(BuildContext context) async {
    final List<NetFectDizaynList> netFectDizaynList = CacheManager.getAnaVeri?.paramModel?.netFectDizaynList ?? <NetFectDizaynList>[];
    final NetFectDizaynList? dizayn = await showRadioBottomSheetDialog(
      context,
      title: "Dizayn Seçiniz",
      children: netFectDizaynList.map((NetFectDizaynList e) => BottomSheetModel(title: e.dizaynAdi ?? e.detayKod ?? "", value: e)).toList(),
    );
    return dizayn;
  }

  Future<BankaListesiModel?> showBankaHesaplariBottomSheetDialog(BuildContext context, BankaListesiRequestModel model) async {
    List<BankaListesiModel> bankaHesaplariList = <BankaListesiModel>[];
    final result = await NetworkManager().dioGet<BankaListesiModel>(path: ApiUrls.getBankaHesaplari, bodyModel: BankaListesiModel(), queryParameters: model.toJson());
    if (result.data is List) {
      bankaHesaplariList = result.data.map((e) => e as BankaListesiModel).toList().cast<BankaListesiModel>();
    }
    if (bankaHesaplariList.ext.isNotNullOrEmpty) {
      return await showBottomSheetDialog(
        context,
        title: "Banka Hesapları",
        children: bankaHesaplariList.map((e) => BottomSheetModel(title: e.hesapAdi ?? "", description: e.hesapKodu, value: e)).toList(),
      );
    }
    return null;
  }

  Future<BelgeTipiModel?> showBelgeTipiBottomSheetDialog(BuildContext context) async {
    final List<BelgeTipiModel> belgeTipiList = <BelgeTipiModel>[BelgeTipiModel(belgeTipi: "Yurt İçi", belgeTipiId: 2), BelgeTipiModel(belgeTipi: "Yurt Dışı", belgeTipiId: 6)];
    return await showRadioBottomSheetDialog(
      context,
      title: "Belge Tipi Seçiniz",
      children: belgeTipiList.map((BelgeTipiModel e) => BottomSheetModel(title: e.belgeTipi ?? e.belgeTipiId.toStringIfNotNull ?? "", value: e)).toList(),
    );
  }

  Future showOlcuBirimiBottomSheetDialog(BuildContext context) async {
    // List olcuBirimleriList = CacheManager.getAnaVeri.paramModel.olc;
    // var olcuBirimi =
    //     await showRadioBottomSheetDialog(context, title: "Ölçü Birimi Seçiniz", children: olcuBirimleriList.map((e) => BottomSheetModel(title: e.olcuBirimi ?? "", value: e)).toList());
    // return olcuBirimi;
  }
  Future<ListIskTip?> showIskontoTipiBottomSheetDialog(BuildContext context) async {
    final List<ListIskTip> iskontoTipiList = CacheManager.getAnaVeri?.paramModel?.listIskTip ?? <ListIskTip>[];
    final ListIskTip? iskontoTipi = await showRadioBottomSheetDialog(
      context,
      title: "İskonto Tipi Seçiniz",
      children: iskontoTipiList.map((ListIskTip e) => BottomSheetModel(title: e.aciklama ?? e.iskontoTipi.toStringIfNotNull ?? "", value: e)).toList(),
    );
    return iskontoTipi;
  }

  Future<CariKosullarModel?> showKosullarBottomSheetDialog(BuildContext context) async {
    final List<CariKosullarModel>? data = await CariNetworkManager.getkosullar();
    return await showRadioBottomSheetDialog(
      context,
      title: "Koşullar Seçiniz",
      children: data?.map((CariKosullarModel e) => BottomSheetModel(title: e.genelKosulAdi ?? e.kosulKodu ?? "", value: e)).toList(),
    );
  }

  Future<double?> showKdvOranlariBottomSheetDialog(BuildContext context) async {
    final List? list = await NetworkManager().getKDVOrani();
    return await showRadioBottomSheetDialog(context, title: "KDV Oranı Seçiniz", children: list?.map((e) => BottomSheetModel(title: e.toString(), value: e)).toList());
  }

  Future<ListOzelKodTum?> showOzelKod1BottomSheetDialog(BuildContext context) async {
    final List<ListOzelKodTum> list =
        CacheManager.getAnaVeri?.paramModel?.listOzelKodTum?.where((ListOzelKodTum element) => element.belgeTipi == "S" && element.fiyatSirasi != 0).toList() ?? <ListOzelKodTum>[];
    return await showRadioBottomSheetDialog(context, title: "Özel Kod Seçiniz", children: list.map((ListOzelKodTum e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e)).toList());
  }

  Future<ListOzelKodTum?> showOzelKod2BottomSheetDialog(BuildContext context) async {
    final List<ListOzelKodTum> list =
        CacheManager.getAnaVeri?.paramModel?.listOzelKodTum?.where((ListOzelKodTum element) => element.belgeTipi == "S" && element.fiyatSirasi == 0).toList() ?? <ListOzelKodTum>[];
    return await showRadioBottomSheetDialog(context, title: "Özel Kod Seçiniz", children: list.map((ListOzelKodTum e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e)).toList());
  }

  Future<KasaList?> showKasaBottomSheetDialog(BuildContext context) async {
    final List<KasaList> list = CacheManager.getAnaVeri?.paramModel?.kasaList ?? <KasaList>[];
    
    return await showRadioBottomSheetDialog(context, title: "Kasa Seçiniz", children: list.map((KasaList e) => BottomSheetModel(title: e.kasaTanimi ?? e.kasaKodu ?? "", value: e)).toList());
  }

  Future<bool?> showPrintBottomSheetDialog(BuildContext context, PrintModel printModel, bool? askDizayn, bool? askMiktar) async {
    if (printModel.yaziciAdi == null) {
      final List<YaziciList?> yaziciListe = CacheManager.getAnaVeri?.paramModel?.yaziciList ?? <YaziciList?>[];
      if (yaziciListe.length == 1) {
        printModel = printModel.copyWith(yaziciAdi: yaziciListe.first?.yaziciAdi, yaziciTipi: yaziciListe.first?.yaziciTipi);
      } else if (yaziciListe.length > 1) {
        final result = await showBottomSheetDialog(context, title: "Yazıcı Seçiniz", children: yaziciListe.map((YaziciList? e) => BottomSheetModel(title: e?.yaziciAdi ?? "", value: e)).toList());
        if (result != null) {
          printModel = printModel.copyWith(yaziciAdi: result?.yaziciAdi, yaziciTipi: result?.yaziciTipi);
        } else {
          return null;
        }
      } else {
        final YaziciList? yaziciList = await showYaziciBottomSheetDialog(context);
        if (yaziciList != null) {
          printModel = printModel.copyWith(yaziciAdi: yaziciList.yaziciAdi, yaziciTipi: yaziciList.yaziciTipi);
        } else {
          return null;
        }
      }
    }
    if (askDizayn == true) {
      final List<NetFectDizaynList?> dizaynListe =
          CacheManager.getAnaVeri?.paramModel?.netFectDizaynList?.where((NetFectDizaynList element) => element.ozelKod == printModel.raporOzelKod).toList() ?? <NetFectDizaynList?>[];
      if (dizaynListe.length == 1) {
        printModel = printModel.copyWith(dizaynId: dizaynListe.first?.id);
      } else if (dizaynListe.length > 1) {
        final result =
            await showBottomSheetDialog(context, title: "Dizayn Seçiniz", children: dizaynListe.map((NetFectDizaynList? e) => BottomSheetModel(title: e?.dizaynAdi ?? "", value: e)).toList());
        if (result != null) {
          printModel = printModel.copyWith(dizaynId: result?.id);
        } else {
          return null;
        }
      } else {
        final NetFectDizaynList? dizaynList = await showDizaynBottomSheetDialog(context);
        if (dizaynList != null) {
          printModel = printModel.copyWith(dizaynId: dizaynList.id);
        } else {
          return null;
        }
      }
    }
    if (askMiktar == true) {
      final TextEditingController dizaynController = TextEditingController(text: printModel.dizaynId.toStringIfNotNull);
      final TextEditingController yaziciController = TextEditingController(text: printModel.yaziciAdi);
      final TextEditingController kopyaController = TextEditingController(text: printModel.etiketSayisi.toStringIfNotNull);
      await showBottomSheetDialog(
        context,
        title: "",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextField(labelText: "Dizayn", isMust: true, controller: dizaynController, readOnly: true, suffixMore: true, onTap: () async {}),
            CustomTextField(labelText: "Yazıcı", isMust: true, controller: yaziciController, readOnly: true, suffixMore: true, onTap: () async {}),
            CustomTextField(
              labelText: "Kopya Sayısı",
              isMust: true,
              controller: kopyaController,
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                int kopya = int.tryParse(value) ?? 0;
                if ((int.tryParse(value) ?? 0) <= 0) {
                  kopya = 1;

                  return;
                }
                kopyaController.text = kopya.toString();
                printModel = printModel.copyWith(etiketSayisi: 1);
              },
              suffix: Wrap(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      printModel = printModel.copyWith(etiketSayisi: (printModel.etiketSayisi ?? 0) - 1);
                      kopyaController.text = printModel.etiketSayisi.toStringIfNotNull ?? "";
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      printModel = printModel.copyWith(etiketSayisi: (printModel.etiketSayisi ?? 0) + 1);
                      kopyaController.text = printModel.etiketSayisi.toStringIfNotNull ?? "";
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final GenericResponseModel<NetworkManagerMixin> result = await NetworkManager().postPrint(context, model: printModel);
                if (result.success == true) {
                  DialogManager().showSuccessSnackBar("Yazdırıldı.");
                } else {
                  await DialogManager().showAlertDialog(result.message ?? "Yazdırma işlemi başarısız.");
                }
                Get.back();
                dizaynController.dispose();
                yaziciController.dispose();
                kopyaController.dispose();
              },
              child: const Text("Yazdır"),
            ),
          ],
        ),
      );
    } else {
      final GenericResponseModel<NetworkManagerMixin> result = await NetworkManager().postPrint(
        context,
        model: printModel,
      );
      if (result.success == true) {
        DialogManager().showSuccessSnackBar("Yazdırıldı.");
        return true;
      } else {
        DialogManager().showErrorSnackBar(result.message ?? "Yazdırma işlemi başarısız.");
      }
    }
    return null;
  }
}
