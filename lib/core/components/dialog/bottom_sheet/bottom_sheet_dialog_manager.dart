// ignore_for_file: use_build_context_synchronously

import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_bottom_sheet_response_model.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/base/model/tcmb_bankalar_model.dart";
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
                    children = children!
                        .where((BottomSheetModel element) => element.title.toLowerCase().contains(value.toLowerCase()) || (element.description?.toLowerCase().contains(value.toLowerCase()) ?? false))
                        .toList();
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

  Future<dynamic> showRadioBottomSheetDialog(BuildContext context, {required String title, List<BottomSheetModel>? children, required Object? groupValue}) async {
    children = children?.nullCheckWithGeneric;
    viewModel.setUnFilteredList(children);
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Observer(
            builder: (_) => Wrap(
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
                if ((children?.length ?? 0) > 15)
                  TextField(
                    decoration: const InputDecoration(hintText: "Aramak istediğiniz metni yazınız."),
                    onChanged: viewModel.changeSearchValue,
                  ).paddingAll(UIHelper.midSize),
                if (viewModel.getFilteredList.ext.isNotNullOrEmpty)
                  SizedBox(
                    // if viewModel.getFilteredList are not fit to screen, it will be scrollable
                    height: viewModel.getFilteredList!.length * 50 < Get.height * 0.8 ? (viewModel.getFilteredList?.length ?? 0) * 50 : Get.height * 0.8,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            child: SafeArea(
                              child: Observer(
                                builder: (_) => Column(
                                  children: [
                                    Wrap(
                                      children: <Widget>[
                                        ...List.generate(
                                          viewModel.getFilteredList!.length,
                                          (int index) => Observer(
                                            builder: (_) => Wrap(
                                              children: [
                                                RadioListTile(
                                                  toggleable: true,
                                                  activeColor: UIHelper.primaryColor,
                                                  onChanged: (dynamic value) {
                                                    if (viewModel.getFilteredList?[index].onTap != null) {
                                                      viewModel.getFilteredList?[index].onTap!();
                                                    } else {
                                                      Get.back(result: viewModel.getFilteredList![index].value);
                                                    }
                                                  },
                                                  value: viewModel.getFilteredList?[index].groupValue ?? "",
                                                  groupValue: groupValue,
                                                  title: Text(viewModel.getFilteredList![index].title),
                                                  subtitle: viewModel.getFilteredList![index].description != null
                                                      ? Text(viewModel.getFilteredList![index].description ?? "", style: TextStyle(color: context.theme.textTheme.bodyLarge?.color?.withOpacity(0.6)))
                                                      : null,
                                                ),
                                                if (index != (viewModel.getFilteredList?.length ?? 0) - 1)
                                                  Padding(
                                                    padding: UIHelper.lowPaddingVertical,
                                                    child: const Divider(),
                                                  )
                                                else
                                                  Container(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).paddingOnly(bottom: UIHelper.midSize),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Center(child: const Text("Veri Yok").paddingAll(UIHelper.highSize)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showCheckBoxBottomSheetDialog(BuildContext context, {List<BottomSheetModel>? children, required String title, bool onlyValue = false, required List? groupValues}) async {
    List<dynamic>? list;
    if (viewModel.isSelectedListMap?[title] == null) {
      viewModel.changeIsSelectedListMap(title, List.generate(children!.length, (int index) => groupValues?.contains(children[index].groupValue) ?? false));
    } else {
      if (children!.length != viewModel.isSelectedListMap?[title]!.length) {
        viewModel.changeIsSelectedListMap(title, List.generate(children.length, (int index) => groupValues?.contains(children[index].groupValue) ?? false));
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
                                    value: viewModel.isSelectedListMap?[title]?[index] ?? false,
                                    title: Text(children[index].title),
                                    onChanged: (bool? value) {
                                      viewModel.changeIndexIsSelectedListMap(title, index, value!);
                                      // viewModel.isSelectedListMap![title]![index] = value!;
                                      list = selectedChecker(children, title, onlyValue);
                                      if (children[index].onTap != null) {
                                        children[index].onTap!();
                                      }
                                      if (!value) {
                                        list!.remove(children[index].title);
                                      }
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
                    ).paddingAll(UIHelper.lowSize),
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

  Future<DepoList?> showDepoBottomSheetDialog(BuildContext context, dynamic groupValue) async => await showRadioBottomSheetDialog(
        context,
        title: "Depo seç",
        groupValue: groupValue,
        children: CacheManager.getAnaVeri?.paramModel?.depoList
            ?.map((DepoList e) => BottomSheetModel(title: e.depoTanimi ?? "", description: e.depoKodu.toStringIfNotNull, value: e, groupValue: e.depoKodu))
            .toList(),
      );

  Future<DepoList?> showTopluDepoBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<int>? onayList = CacheManager.getAnaVeri?.userModel?.kullaniciYetki?.sirketAktifDepolar;
    final List<DepoList> depoList = CacheManager.getAnaVeri?.paramModel?.depoList ?? <DepoList>[];
    final List<DepoList> filteredDepoList = depoList.where((DepoList element) => onayList?.contains(element.depoKodu) ?? true).toList();
    return await showRadioBottomSheetDialog(
      context,
      title: "Depo seç",
      groupValue: groupValue,
      children: filteredDepoList
          .map(
            (DepoList e) => BottomSheetModel(
              title: e.depoTanimi ?? "",
              value: e,
              groupValue: e.depoKodu,
            ),
          )
          .toList(),
      // children: CacheManager.getAnaVeri?.userModel?.profilYetki?.sirketAktifDepolar,
    );
  }

  Future<ListCariOdemeKodu?> showOdemeKoduBottomSheetDialog(BuildContext context, dynamic groupValue) async => await showRadioBottomSheetDialog(
        context,
        title: "Ödeme Kodu seç",
        groupValue: groupValue,
        children: CacheManager.getAnaVeri?.paramModel?.listCariOdemeKodu
            ?.map(
              (ListCariOdemeKodu e) => BottomSheetModel(
                title: e.aciklama ?? "",
                value: e,
                groupValue: e.odemeKodu,
              ),
            )
            .toList(),
      );
  Future<BaseBottomSheetResponseModel?> showCariTipiBottomSheetDialog(BuildContext context, dynamic groupValue) async => await showRadioBottomSheetDialog(
        context,
        title: "Tipi seç",
        groupValue: groupValue,
        children: <BottomSheetModel>[
          BottomSheetModel(title: "Alıcı", value: "A", groupValue: "A", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Alıcı", value: "A"))),
          BottomSheetModel(title: "Satıcı", value: "S", groupValue: "S", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Satıcı", value: "S"))),
          BottomSheetModel(title: "Toptancı", value: "T", groupValue: "T", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Toptancı", value: "T"))),
          BottomSheetModel(title: "Kefil", value: "K", groupValue: "K", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kefil", value: "K"))),
          BottomSheetModel(title: "Müstahsil", value: "M", groupValue: "M", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Müstahsil", value: "M"))),
          BottomSheetModel(title: "Diğer", value: "D", groupValue: "D", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Diğer", value: "D"))),
          BottomSheetModel(title: "Komisyoncu", value: "I", groupValue: "I", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Komisyoncu", value: "I"))),
        ],
      );
      /// `GroupValues must be a list of String`
  Future<List<PlasiyerList?>?> showPlasiyerListesiBottomSheetDialog(BuildContext context, {required List? groupValues}) async {
    final List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList ?? <PlasiyerList>[];
    final result = await showCheckBoxBottomSheetDialog(
      context,
      title: "Plasiyer Seçiniz",
      groupValues: groupValues,
      children: plasiyerList
          .map(
            (PlasiyerList e) => BottomSheetModel(
              title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "",
              value: e,
              groupValue: e.plasiyerKodu,
            ),
          )
          .toList(),
    );
    if (result != null) {}
    return result?.cast<PlasiyerList>();
    // return null;
  }

  Future<List<BaseGrupKoduModel?>?> showGrupKoduCheckBoxBottomSheetDialog(
    BuildContext context, {
    required GrupKoduEnum modul,
    required int grupKodu,
    bool? kullanimda,
    required List<BaseGrupKoduModel>? groupValues,
  }) async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      viewModel.changeGrupKoduList(await NetworkManager().getGrupKod(name: modul.name, grupNo: -1, kullanimda: kullanimda));
    }
    viewModel.filteredGrupKoduListFilter(grupKodu);
    final result = await showCheckBoxBottomSheetDialog(
      context,
      title: "Grup Kodu($grupKodu) Seçiniz",
      groupValues: groupValues,
      children: viewModel.filteredGrupKoduList
          ?.map(
            (BaseGrupKoduModel e) => BottomSheetModel(
              title: e.grupAdi ?? "",
              value: e,
              groupValue: e.grupKodu,
            ),
          )
          .toList(),
    );
    if (result != null) {
      return result.cast<BaseGrupKoduModel>();
    }
    return null;
  }

  Future<BaseGrupKoduModel?> showGrupKoduBottomSheetDialog(BuildContext context, dynamic groupValue, {required GrupKoduEnum modul, required int grupKodu, bool? kullanimda}) async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      viewModel.changeGrupKoduList(await NetworkManager().getGrupKod(name: modul.name, grupNo: -1, kullanimda: kullanimda));
    }
    viewModel.filteredGrupKoduListFilter(grupKodu);
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Grup Kodu Seçiniz",
      groupValue: groupValue,
      children: viewModel.filteredGrupKoduList
          ?.map(
            (BaseGrupKoduModel e) => BottomSheetModel(
              title: e.grupAdi ?? "",
              value: e,
              groupValue: e.grupKodu,
            ),
          )
          .toList(),
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

  Future<StokMuhasebeKoduModel?> showMuhasebeMuhasebeKoduBottomSheetDialog(BuildContext context, dynamic groupValue, {MuhasebeBelgeTipiEnum? belgeTipi, String? hesapTipi}) async {
    if (viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      final Map<String, dynamic> queryparams = <String, dynamic>{"BelgeTipi": belgeTipi.value, "HesapTipi": hesapTipi ?? "A", "MuhRefKodGelsin": "H", "EkranTipi": "R"};
      viewModel.changeMuhasebeKoduList(await NetworkManager().getMuhasebeKodlari(stokMu: false, queryParams: queryparams));
    }
    return await showRadioBottomSheetDialog(
      context,
      title: "Muhasebe Kodu Seçiniz",
      groupValue: groupValue,
      children: viewModel.muhasebeKoduList
          ?.map(
            (StokMuhasebeKoduModel e) => BottomSheetModel(
              title: e.hesapAdi ?? e.hesapKodu ?? "",
              description: e.hesapKodu,
              value: e,
              groupValue: e.hesapKodu,
            ),
          )
          .toList(),
    );
  }

  Future<PlasiyerList?> showPlasiyerBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList ?? <PlasiyerList>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Plasiyer Seçiniz",
      groupValue: groupValue,
      children: plasiyerList
          .map(
            (PlasiyerList e) => BottomSheetModel(
              title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "",
              description: e.plasiyerKodu,
              value: e,
              groupValue: e.plasiyerKodu,
            ),
          )
          .toList(),
    );
  }

  Future<BaseProjeModel?> showProjeBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<BaseProjeModel> projeList = await NetworkManager().getProjeData() ?? <BaseProjeModel>[];
    final BaseProjeModel? proje = await showRadioBottomSheetDialog(
      context,
      title: "Proje Seçiniz",
      groupValue: groupValue,
      children: projeList
          .map(
            (BaseProjeModel e) => BottomSheetModel(
              title: e.projeAciklama ?? e.projeKodu ?? "",
              description: e.projeKodu,
              value: e,
              groupValue: e.projeKodu,
            ),
          )
          .toList(),
    );
    return proje;
  }

  Future<DovizList?> showDovizBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<DovizList> dovizList = CacheManager.getAnaVeri?.paramModel?.dovizList ?? <DovizList>[];
    final DovizList? doviz = await showRadioBottomSheetDialog(
      context,
      title: "Döviz Seçiniz",
      groupValue: groupValue,
      children: dovizList
          .map(
            (DovizList e) => BottomSheetModel(
              title: e.isim ?? e.dovizKodu.toStringIfNotNull ?? "",
              value: e,
              groupValue: e.dovizKodu,
            ),
          )
          .toList(),
    );
    return doviz;
  }

  Future<YaziciList?> showYaziciBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<YaziciList>? yaziciList = CacheManager.getAnaVeri?.paramModel?.yaziciList;
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Yazıcı Seçiniz",
      groupValue: groupValue,
      children: yaziciList
              ?.map(
                (YaziciList e) => BottomSheetModel(
                  title: e.yaziciAdi ?? e.aciklama ?? "",
                  value: e,
                  groupValue: e.yaziciAdi,
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

  Future<NetFectDizaynList?> showDizaynBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<NetFectDizaynList> netFectDizaynList = CacheManager.getAnaVeri?.paramModel?.netFectDizaynList ?? <NetFectDizaynList>[];
    final NetFectDizaynList? dizayn = await showRadioBottomSheetDialog(
      context,
      title: "Dizayn Seçiniz",
      groupValue: groupValue,
      children: netFectDizaynList
          .map(
            (NetFectDizaynList e) => BottomSheetModel(
              title: e.dizaynAdi ?? e.detayKod ?? "",
              value: e,
              groupValue: e.detayKod,
            ),
          )
          .toList(),
    );
    return dizayn;
  }

  Future<BankaListesiModel?> showBankaHesaplariBottomSheetDialog(BuildContext context, BankaListesiRequestModel model, dynamic groupValue) async {
    List<BankaListesiModel> bankaHesaplariList = <BankaListesiModel>[];
    final result = await NetworkManager().dioGet<BankaListesiModel>(path: ApiUrls.getBankaHesaplari, bodyModel: BankaListesiModel(), queryParameters: model.toJson(), showLoading: true);
    if (result.data is List) {
      bankaHesaplariList = result.data.map((e) => e as BankaListesiModel).toList().cast<BankaListesiModel>();
    }
    if (bankaHesaplariList.ext.isNotNullOrEmpty) {
      return await showRadioBottomSheetDialog(
        context,
        title: "Banka Hesapları",
        groupValue: groupValue,
        children: bankaHesaplariList
            .map(
              (e) => BottomSheetModel(
                title: e.hesapAdi ?? "",
                description: e.hesapKodu,
                value: e,
                groupValue: e.hesapKodu,
              ),
            )
            .toList(),
      );
    }
    return null;
  }

  Future<BelgeTipiModel?> showBelgeTipiBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<BelgeTipiModel> belgeTipiList = <BelgeTipiModel>[BelgeTipiModel(belgeTipi: "Yurt İçi", belgeTipiId: 2), BelgeTipiModel(belgeTipi: "Yurt Dışı", belgeTipiId: 6)];
    return await showRadioBottomSheetDialog(
      context,
      title: "Belge Tipi Seçiniz",
      groupValue: groupValue,
      children: belgeTipiList
          .map(
            (BelgeTipiModel e) => BottomSheetModel(
              title: e.belgeTipi ?? e.belgeTipiId.toStringIfNotNull ?? "",
              value: e,
              groupValue: e.belgeTipiId,
            ),
          )
          .toList(),
    );
  }

  Future showOlcuBirimiBottomSheetDialog(BuildContext context) async {
    // List olcuBirimleriList = CacheManager.getAnaVeri.paramModel.olc;
    // var olcuBirimi =
    //     await showRadioBottomSheetDialog(context, title: "Ölçü Birimi Seçiniz", children: olcuBirimleriList.map((e) => BottomSheetModel(title: e.olcuBirimi ?? "", value: e)).toList());
    // return olcuBirimi;
  }
  Future<ListIskTip?> showIskontoTipiBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<ListIskTip> iskontoTipiList = CacheManager.getAnaVeri?.paramModel?.listIskTip ?? <ListIskTip>[];
    final ListIskTip? iskontoTipi = await showRadioBottomSheetDialog(
      context,
      title: "İskonto Tipi Seçiniz",
      groupValue: groupValue,
      children: iskontoTipiList
          .map(
            (ListIskTip e) => BottomSheetModel(
              title: e.aciklama ?? e.iskontoTipi.toStringIfNotNull ?? "",
              value: e,
              groupValue: e.iskontoTipi,
            ),
          )
          .toList(),
    );
    return iskontoTipi;
  }

  Future<CariKosullarModel?> showKosullarBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<CariKosullarModel>? data = await CariNetworkManager.getkosullar();
    return await showRadioBottomSheetDialog(
      context,
      title: "Koşullar Seçiniz",
      groupValue: groupValue,
      children: data
          ?.map(
            (CariKosullarModel e) => BottomSheetModel(title: e.genelKosulAdi ?? e.kosulKodu ?? "", value: e, groupValue: e.kosulKodu),
          )
          .toList(),
    );
  }

  Future<double?> showKdvOranlariBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List? list = await NetworkManager().getKDVOrani();
    return await showRadioBottomSheetDialog(
      context,
      title: "KDV Oranı Seçiniz",
      groupValue: groupValue,
      children: list
          ?.map(
            (e) => BottomSheetModel(title: e.toString(), value: e, groupValue: e),
          )
          .toList(),
    );
  }

  Future<ListOzelKodTum?> showOzelKod1BottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<ListOzelKodTum> list =
        CacheManager.getAnaVeri?.paramModel?.listOzelKodTum?.where((ListOzelKodTum element) => element.belgeTipi == "S" && element.fiyatSirasi != 0).toList() ?? <ListOzelKodTum>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Özel Kod Seçiniz",
      groupValue: groupValue,
      children: list
          .map(
            (ListOzelKodTum e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e, groupValue: e.kod),
          )
          .toList(),
    );
  }

  Future<ListOzelKodTum?> showOzelKod2BottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<ListOzelKodTum> list =
        CacheManager.getAnaVeri?.paramModel?.listOzelKodTum?.where((ListOzelKodTum element) => element.belgeTipi == "S" && element.fiyatSirasi == 0).toList() ?? <ListOzelKodTum>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Özel Kod Seçiniz",
      groupValue: groupValue,
      children: list
          .map(
            (ListOzelKodTum e) => BottomSheetModel(
              title: e.aciklama ?? e.kod ?? "",
              value: e,
              groupValue: e.kod,
            ),
          )
          .toList(),
    );
  }

  Future<TcmbBankalarModel?> showTcmbBankalarBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final result = await NetworkManager().dioGet(path: ApiUrls.getTcmbBankalar, showLoading: true, bodyModel: TcmbBankalarModel());
    if (result.data is List) {
      final List<TcmbBankalarModel> list = result.data.map((e) => e as TcmbBankalarModel).toList().cast<TcmbBankalarModel>();
      return await showRadioBottomSheetDialog(
        context,
        title: "Banka Seçiniz",
        groupValue: groupValue,
        children: list
            .map(
              (TcmbBankalarModel e) => BottomSheetModel(
                title: e.bankaadi ?? "",
                description: e.bankakodu ?? "",
                value: e,
                groupValue: e.bankakodu,
              ),
            )
            .toList(),
      );
    }
    return null;
  }

  Future<TcmbBankalarModel?> showTcmbSubelerBottomSheetDialog(BuildContext context, String? bankaKodu, dynamic groupValue) async {
    final result = await NetworkManager().dioGet(path: ApiUrls.getTcmbSubeler, bodyModel: TcmbBankalarModel(), showLoading: true, queryParameters: {"BankaKodu": bankaKodu});
    if (result.data is List) {
      final List<TcmbBankalarModel> list = result.data.map((e) => e as TcmbBankalarModel).toList().cast<TcmbBankalarModel>();
      return await showRadioBottomSheetDialog(
        context,
        title: "Şube Seçiniz",
        groupValue: groupValue,
        children: list
            .map(
              (TcmbBankalarModel e) => BottomSheetModel(
                title: e.subeadi ?? "",
                description: e.subekodu ?? "",
                value: e,
                groupValue: e.subekodu,
              ),
            )
            .toList(),
      );
    }
    return null;
  }

  Future<MuhasebeReferansModel?> showReferansKodBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final result = await NetworkManager().dioGet<MuhasebeReferansModel>(path: ApiUrls.getMuhaRefList, bodyModel: MuhasebeReferansModel(), showLoading: true);
    if (result.data is List) {
      final List<MuhasebeReferansModel> list = result.data.map((e) => e as MuhasebeReferansModel).toList().cast<MuhasebeReferansModel>();
      return await showRadioBottomSheetDialog(
        context,
        title: "Referans Kod Seçiniz",
        groupValue: groupValue,
        children: list
            .map(
              (MuhasebeReferansModel e) => BottomSheetModel(
                title: e.tanimi ?? "",
                description: e.kodu ?? "",
                value: e,
                groupValue: e.kodu,
              ),
            )
            .toList(),
      );
    }
    return null;
  }

  Future<SeriModel?> showSeriKodBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final result = await NetworkManager().dioGet<SeriModel>(path: ApiUrls.getDekontSeriler, bodyModel: SeriModel(), showLoading: true);
    if (result.data is List) {
      final List<SeriModel> list = result.data.map((e) => e as SeriModel).toList().cast<SeriModel>();
      return await showRadioBottomSheetDialog(
        context,
        title: "Seri Kod Seçiniz",
        groupValue: groupValue,
        children: list
            .map(
              (SeriModel e) => BottomSheetModel(
                title: e.aciklama ?? "",
                description: e.seriNo ?? "",
                value: e,
                groupValue: e.seriNo,
              ),
            )
            .toList(),
      );
    }
    return null;
  }

  Future<KasaList?> showKasaBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<KasaList> list = CacheManager.getAnaVeri?.paramModel?.kasaList ?? <KasaList>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Kasa Seçiniz",
      groupValue: groupValue,
      children: list
          .map(
            (KasaList e) => BottomSheetModel(title: e.kasaTanimi ?? e.kasaKodu ?? "", value: e, groupValue: e.kasaKodu),
          )
          .toList(),
    );
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
        final YaziciList? yaziciList = await showYaziciBottomSheetDialog(context, null);
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
        final NetFectDizaynList? dizaynList = await showDizaynBottomSheetDialog(context, null);
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
      }
    }
    return null;
  }

  Future<MemoryImage?> getPhoto(BuildContext context) async {
    final sourceType = await showBottomSheetDialog(
      context,
      title: "Kaynak tipi",
      children: [
        BottomSheetModel(title: "Galeri", iconWidget: Icons.photo_library_outlined, onTap: () => Get.back(result: ImageSource.gallery)),
        BottomSheetModel(title: "Kamera", iconWidget: Icons.camera_alt_outlined, onTap: () => Get.back(result: ImageSource.camera)),
      ],
    );
    if (sourceType != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? result = await picker.pickImage(source: sourceType, imageQuality: 30, maxHeight: 1024, maxWidth: 768);
      if (result != null) {
        Uint8List? compressedImage;
        compressedImage = await FlutterImageCompress.compressWithFile(
          result.path,
          format: CompressFormat.png,
          keepExif: true,
          numberOfRetries: 10,
          quality: 30,
          autoCorrectionAngle: true,
        );
        if (compressedImage != null) {
          return MemoryImage(compressedImage);
        }
      }
    }
    return null;
  }
}
