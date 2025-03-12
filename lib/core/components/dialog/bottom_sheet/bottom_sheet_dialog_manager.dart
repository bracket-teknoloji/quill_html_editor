// ignore_for_file: use_build_context_synchronously

import "dart:developer";

import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_bottom_sheet_response_model.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/e_fatura_ozel_kod_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/kullanicilar_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/base/model/tcmb_bankalar_model.dart";
import "package:picker/core/base/view/e_irsaliye_ek_bilgiler/model/e_irsaliye_bilgi_model.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "package:picker/core/constants/enum/dizayn_ozel_kod_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/icon_helper.dart";
import "package:picker/core/constants/yetki_controller/yetki_controller.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/add_company/model/account_response_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_operator_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/kalem_list_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:picker/view/main_page/model/user_model/kullanici_yetki_model.dart";

import "../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_kosullar_model.dart";
import "../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../../../base/model/base_grup_kodu_model.dart";
import "../../../base/model/belge_tipi_model.dart";
import "../../../base/model/print_model.dart";
import "../../../constants/extensions/list_extensions.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../../init/cache/cache_manager.dart";
import "../dialog_manager.dart";
import "model/bottom_sheet_model.dart";
import "view_model/bottom_sheet_state_manager.dart";

final class BottomSheetDialogManager {
  final BottomSheetStateManager _viewModel = BottomSheetStateManager();
  final NetworkManager _networkManager = NetworkManager();
  final YetkiController _yetkiController = YetkiController();
  ParamModel? get _paramModel => CacheManager.getAnaVeri?.paramModel;
  KullaniciYetkiModel? get _kullaniciYetkiModel => CacheManager.getAnaVeri?.userModel?.kullaniciYetki;

  Future<List<T>?> _generalBottomSheet<T>(
    BuildContext context, {
    required String title,
    required Widget Function(
      BuildContext context, {
      required String title,
      List<BottomSheetModel<T>>? children,
      List<T>? list,
      bool? onlyValue,
      Widget? body,
    })
    body,
    List<BottomSheetModel<T>>? children,
    Widget? bodyWidget,
    List<T>? groupValues,
    bool? onlyValue,
  }) async {
    final result = await showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      useSafeArea: true,
      constraints: BoxConstraints.loose(
        Size(
          MediaQuery.sizeOf(context).width *
              (context.isLandscape
                  ? kIsWeb
                      ? 0.4
                      : 0.6
                  : 1),
          MediaQuery.sizeOf(context).height * 0.9,
        ),
      ),
      context: context,
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: UIHelper.lowPadding,
                    title: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          title,
                          textStyle: context.theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,
                    ).paddingOnly(left: UIHelper.lowSize),
                    trailing: IconButton(icon: const Icon(Icons.close), onPressed: Get.back),
                    splashColor: Colors.transparent,
                  ).paddingSymmetric(vertical: UIHelper.lowSize),
                  const Divider(thickness: 2, endIndent: 0, indent: 0),
                  Flexible(
                    child: body(
                      context,
                      title: title,
                      children: children,
                      list: groupValues,
                      onlyValue: onlyValue,
                      body: bodyWidget,
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
    if (result is List) return result.cast<T>();
    if (result is T) return [result];
    return null;
  }

  Future<T?> showBottomSheetDialog<T>(
    BuildContext context, {
    required String title,
    Widget? body,
    List<BottomSheetModel<T>>? children,
    bool aramaVarMi = false,
  }) async {
    final result = await _generalBottomSheet<T>(
      context,
      title: title,
      body: bottomSheetBody,
      children: children,
      bodyWidget: body,
    );
    return result?.firstOrNull;
  }

  Widget bottomSheetBody<T>(
    BuildContext context, {
    required String title,
    List<BottomSheetModel<T>>? children,
    List<T>? list,
    bool? onlyValue = false,
    Widget? body,
  }) {
    List<BottomSheetModel>? children2 = children;
    FocusNode? focusNode;
    if ((children?.length ?? 0) > 20) {
      focusNode = FocusNode()..requestFocus();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (body == null && ((children?.length ?? 0) > 20 && (children?.length ?? 0) < 100))
          CustomTextField(
            focusNode: focusNode,
            labelText: "Aramak istediğiniz metni yazınız.",
            onChanged: (value) {
              if (value == "") {
                children2 = children;
              }
              children2 =
                  children2!
                      .where(
                        (element) =>
                            element.title.toLowerCase().contains(value.toLowerCase()) ||
                            (element.description?.toLowerCase().contains(value.toLowerCase()) ?? false),
                      )
                      .toList();
            },
          ).paddingAll(UIHelper.midSize),
        if (body != null)
          Flexible(child: ListView(shrinkWrap: true, primary: false, children: [body.paddingAll(UIHelper.lowSize)]))
        else
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: children2?.length,
              primary: false,
              itemBuilder: (context, index) {
                final item = children2![index];
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: item.onTap ?? () => Get.back(result: [item.value]),
                      title: Text(item.title),
                      subtitle:
                          item.description != null
                              ? Text(
                                item.description ?? "",
                                style: TextStyle(
                                  color: context.theme.textTheme.bodyLarge?.color?.withValues(alpha: 0.6),
                                ),
                              )
                              : null,
                      leading:
                          item.icon != null || item.iconWidget != null
                              ? SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    item.iconWidget != null
                                        ? Icon(item.iconWidget, size: 25, color: UIHelper.primaryColor)
                                        : IconHelper.smallIcon(item.icon!),
                              )
                              : null,
                    ),
                    if (index != children2!.length - 1)
                      const Padding(padding: UIHelper.lowPaddingVertical, child: Divider()),
                  ],
                );
              },
            ).paddingOnly(bottom: UIHelper.midSize),
          ),
        // if (context.general.isKeyBoardOpen && body == null) const ResponsiveBox() else Container(),
      ],
    );
  }

  //* CheckBox
  Future<List<T>?> showCheckBoxBottomSheetDialog<T>(
    BuildContext context, {
    required String title,
    required List? groupValues,
    List<BottomSheetModel<T>>? children,
    bool onlyValue = false,
  }) async {
    // List<T>? list;

    if (_viewModel.isSelectedListMap?[title] == null) {
      _viewModel.changeIsSelectedListMap(
        title,
        List.generate(children!.length, (index) => groupValues?.contains(children[index].groupValue) ?? false),
      );
    } else {
      if (children!.length != _viewModel.isSelectedListMap?[title]!.length) {
        _viewModel.changeIsSelectedListMap(
          title,
          List.generate(children.length, (index) => groupValues?.contains(children[index].groupValue) ?? false),
        );
      }
    }
    return _generalBottomSheet<T>(context, title: title, body: checkboxBody, onlyValue: onlyValue, children: children);
  }

  Column checkboxBody<T>(
    BuildContext context, {
    required String title,
    List<BottomSheetModel<T>>? children,
    List<T>? list,
    bool? onlyValue = false,
    Widget? body,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          separatorBuilder: (context, index) => const Padding(padding: UIHelper.lowPaddingVertical, child: Divider()),
          itemCount: children?.length ?? 0,
          itemBuilder:
              (context, index) => Observer(
                builder:
                    (_) => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _viewModel.isSelectedListMap?[title]?[index] ?? false,
                      title: Text(children?[index].title ?? ""),
                      onChanged: (value) {
                        _viewModel.changeIndexIsSelectedListMap(title, index, value!);
                        // viewModel.isSelectedListMap![title]![index] = value!;
                        list = selectedChecker(children, title, onlyValue);
                        if (children?[index].onTap != null) {
                          children?[index].onTap?.call();
                        }
                        if (!value) {
                          list!.remove(children?[index].title);
                        }
                      },
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
  );

  Future<T?> showRadioBottomSheetDialog<T>(
    BuildContext context, {
    required String title,
    required Object? groupValue,
    List<BottomSheetModel<T>>? children,
  }) async {
    _viewModel.setUnFilteredList(children);
    final double height = children!.map((e) => e.descriptionWidget != null || e.description != null ? 65.0 : 55.0).sum;
    //FocusScope.of(context).unfocus();
    final result = await showModalBottomSheet<T>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      // useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints.loose(
        Size(
          MediaQuery.sizeOf(context).width *
              (context.isLandscape
                  ? kIsWeb
                      ? 0.4
                      : 0.6
                  : 1),
          MediaQuery.sizeOf(context).height * 0.9,
        ),
      ),
      builder:
          (context) => SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
              child: Observer(
                builder:
                    (_) => Wrap(
                      children: <Widget>[
                        ListTile(
                          contentPadding: UIHelper.lowPadding,
                          title: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                title,
                                textStyle: context.theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                            totalRepeatCount: 1,
                            displayFullTextOnTap: true,
                          ).paddingOnly(left: UIHelper.lowSize),
                          trailing: IconButton(icon: const Icon(Icons.close), onPressed: Get.back),
                          splashColor: Colors.transparent,
                        ).paddingSymmetric(vertical: UIHelper.lowSize),
                        const Divider(thickness: 2, endIndent: 0, indent: 0),
                        if ((children.length) > 15) SearchField(viewModel: _viewModel).paddingAll(UIHelper.midSize),
                        if (_viewModel.getFilteredList.ext.isNotNullOrEmpty)
                          SizedBox(
                            height: height < Get.height * 0.8 ? height : Get.height * 0.8,
                            child: Scrollbar(
                              interactive: true,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: SafeArea(
                                        child: Observer(
                                          builder:
                                              (_) => Column(
                                                children: [
                                                  Wrap(
                                                    children: <Widget>[
                                                      ...List.generate(_viewModel.getFilteredList!.length, (index) {
                                                        final BottomSheetModel? item =
                                                            _viewModel.getFilteredList?[index];
                                                        return Observer(
                                                          builder:
                                                              (_) => Wrap(
                                                                children: [
                                                                  RadioListTile(
                                                                    toggleable: true,
                                                                    activeColor: UIHelper.primaryColor,
                                                                    onChanged: (dynamic value) {
                                                                      if (item?.onTap != null) {
                                                                        item?.onTap!();
                                                                      } else {
                                                                        Get.back(result: item?.value);
                                                                      }
                                                                    },
                                                                    value: item?.groupValue ?? "",
                                                                    groupValue: groupValue,
                                                                    title: Text(item?.title ?? ""),
                                                                    subtitle:
                                                                        item?.description != null ||
                                                                                item?.descriptionWidget != null
                                                                            ? Column(
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment.start,
                                                                              children:
                                                                                  [
                                                                                    item?.descriptionWidget,
                                                                                    if (item?.description != null)
                                                                                      Text(
                                                                                        item?.description ?? "",
                                                                                        style: TextStyle(
                                                                                          color: context
                                                                                              .theme
                                                                                              .textTheme
                                                                                              .bodyLarge
                                                                                              ?.color
                                                                                              ?.withValues(alpha: 0.6),
                                                                                        ),
                                                                                      ),
                                                                                  ].nullCheckWithGeneric,
                                                                            )
                                                                            : null,
                                                                  ).paddingSymmetric(horizontal: UIHelper.midSize),
                                                                  if (index !=
                                                                      (_viewModel.getFilteredList?.length ?? 0) - 1)
                                                                    const Padding(
                                                                      padding: UIHelper.lowPaddingVertical,
                                                                      child: Divider(),
                                                                    ),
                                                                ],
                                                              ),
                                                        );
                                                      }),
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
    _viewModel.searchValue = null;
    return result;
  }

  List<T> selectedChecker<T>(List<BottomSheetModel>? children, String title, [bool? onlyValue = false]) {
    final List<T> list = [];
    for (int i = 0; i < _viewModel.isSelectedListMap![title]!.length; i++) {
      if (_viewModel.isSelectedListMap![title]![i]) {
        list.add(children![i].value ?? (onlyValue == true ? null : children[i].title));
      }
    }
    return list;
  }

  void clearSelectedData() {
    _viewModel.deleteIsSelectedListMap();
  }

  Future<DepoList?> showDepoBottomSheetDialog(BuildContext context, int? groupValue) async =>
      await showRadioBottomSheetDialog(
        context,
        title: "Depo seç",
        groupValue: groupValue,
        children:
            _yetkiController.yetkiliDepoList
                ?.where((element) => (element.subeKodu ?? 0) == CacheManager.getVeriTabani["Şube"])
                .map(
                  (e) => BottomSheetModel(
                    title: e.depoTanimi ?? "",
                    description: e.depoKodu.toStringIfNotNull,
                    descriptionWidget: e.hucreTakibi == "E" ? const ColorfulBadge(label: Text("Hücre Takibi")) : null,
                    value: e,
                    groupValue: e.depoKodu,
                  ),
                )
                .toList(),
      );
  Future<DepoList?> showHucreDepoBottomSheetDialog(BuildContext context, int? groupValue) async =>
      await showRadioBottomSheetDialog(
        context,
        title: "Depo seç",
        groupValue: groupValue,
        children:
            _paramModel?.depoList
                ?.where((element) => element.hucreTakibi == "E")
                .map(
                  (e) => BottomSheetModel(
                    title: e.depoTanimi ?? "",
                    description: e.depoKodu.toStringIfNotNull,
                    value: e,
                    groupValue: e.depoKodu,
                  ),
                )
                .toList(),
      );

  Future<DepoList?> showTopluDepoBottomSheetDialog(
    BuildContext context,
    dynamic groupValue, {
    String? filter,
    int? subeKodu,
  }) async {
    final List<DepoList> depoList = _paramModel?.depoList ?? <DepoList>[];
    final List<DepoList> filteredDepoList = depoList.where((element) => element.subeKodu == subeKodu).toList();
    return await showRadioBottomSheetDialog(
      context,
      title: "Depo seç",
      groupValue: groupValue,
      children:
          filteredDepoList
              .map(
                (e) => BottomSheetModel(
                  title: e.depoTanimi ?? "",
                  description: e.depoKodu.toStringIfNotNull,
                  value: e,
                  groupValue: e.depoKodu,
                ),
              )
              .toList(),
      // children: CacheManager.getAnaVeri?.userModel?.profilYetki?.sirketAktifDepolar,
    );
  }

  Future<ListCariOdemeKodu?> showOdemeKoduBottomSheetDialog(BuildContext context, dynamic groupValue) async =>
      await showRadioBottomSheetDialog(
        context,
        title: "Ödeme Kodu seç",
        groupValue: groupValue,
        children:
            _paramModel?.listCariOdemeKodu
                ?.map((e) => BottomSheetModel(title: e.aciklama ?? "", value: e, groupValue: e.odemeKodu))
                .toList(),
      );
  Future<BaseBottomSheetResponseModel?> showCariTipiBottomSheetDialog(BuildContext context, dynamic groupValue) async =>
      await showRadioBottomSheetDialog<BaseBottomSheetResponseModel>(
        context,
        title: "Tipi seç",
        groupValue: groupValue,
        children: <BottomSheetModel<BaseBottomSheetResponseModel>>[
          BottomSheetModel(
            title: "Alıcı",
            groupValue: "A",
            value: BaseBottomSheetResponseModel(title: "Alıcı", value: "A"),
          ),
          BottomSheetModel(
            title: "Satıcı",
            groupValue: "S",
            value: BaseBottomSheetResponseModel(title: "Satıcı", value: "S"),
          ),
          BottomSheetModel(
            title: "Toptancı",
            groupValue: "T",
            value: BaseBottomSheetResponseModel(title: "Toptancı", value: "T"),
          ),
          BottomSheetModel(
            title: "Kefil",
            groupValue: "K",
            value: BaseBottomSheetResponseModel(title: "Kefil", value: "K"),
          ),
          BottomSheetModel(
            title: "Müstahsil",
            groupValue: "M",
            value: BaseBottomSheetResponseModel(title: "Müstahsil", value: "M"),
          ),
          BottomSheetModel(
            title: "Diğer",
            groupValue: "D",
            value: BaseBottomSheetResponseModel(title: "Diğer", value: "D"),
          ),
          BottomSheetModel(
            title: "Komisyoncu",
            groupValue: "I",
            value: BaseBottomSheetResponseModel(title: "Komisyoncu", value: "I"),
          ),
        ],
      );

  /// `GroupValues must be a list of String`
  Future<List<PlasiyerList>?> showPlasiyerListesiBottomSheetDialog(
    BuildContext context, {
    required List? groupValues,
  }) async {
    final List<PlasiyerList> plasiyerList = _paramModel?.plasiyerList ?? <PlasiyerList>[];
    final result = await showCheckBoxBottomSheetDialog<PlasiyerList>(
      context,
      title: "Plasiyer Seçiniz",
      groupValues: groupValues ?? [],
      children:
          plasiyerList
              .map(
                (e) => BottomSheetModel(
                  title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "",
                  value: e,
                  groupValue: e.plasiyerKodu,
                ),
              )
              .toList(),
    );
    return result;
    // return null;
  }

  Future<List<BaseGrupKoduModel>?> showGrupKoduCheckBoxBottomSheetDialog(
    BuildContext context, {
    required GrupKoduEnum modul,
    required int grupKodu,
    required List<BaseGrupKoduModel>? groupValues,
    bool? kullanimda,
  }) async {
    if (_viewModel.grupKoduList.ext.isNullOrEmpty) {
      _viewModel.changeGrupKoduList(await _networkManager.getGrupKod(name: modul, grupNo: -1, kullanimda: kullanimda));
    }
    _viewModel.filteredGrupKoduListFilter(grupKodu);
    final result = await showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
      context,
      title: "Grup Kodu($grupKodu) Seçiniz",
      groupValues: groupValues,
      children:
          _viewModel.filteredGrupKoduList
              ?.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e, groupValue: e.grupKodu))
              .toList(),
    );
    return result;
  }

  Future<BaseGrupKoduModel?> showGrupKoduBottomSheetDialog(
    BuildContext context,
    dynamic groupValue, {
    required GrupKoduEnum modul,
    required int grupKodu,
    bool? kullanimda,
  }) async {
    if (_viewModel.grupKoduList.ext.isNullOrEmpty) {
      _viewModel.changeGrupKoduList(await _networkManager.getGrupKod(name: modul, grupNo: -1, kullanimda: kullanimda));
    }
    _viewModel.filteredGrupKoduListFilter(grupKodu);
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Grup Kodu Seçiniz",
      groupValue: groupValue,
      children:
          _viewModel.filteredGrupKoduList
              ?.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e, groupValue: e.grupKodu))
              .toList(),
    );
    if (result != null) {
      return result;
    }
    return null;
  }

  Future<StokMuhasebeKoduModel?> showMuhasebeKoduBottomSheetDialog(
    BuildContext context, {
    bool? stokMu,
    dynamic groupValue,
    bool? alisMi,
    Map<String, dynamic>? queryParams,
  }) async {
    if (_viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      _viewModel.changeMuhasebeKoduList(
        await _networkManager.getMuhasebeKodlari(queryParams: queryParams, stokMu: stokMu),
      );
    }
    return await showRadioBottomSheetDialog(
      context,
      groupValue: groupValue,
      title: "Muhasebe Kodu Seçiniz",
      children:
          _viewModel.muhasebeKoduList
              ?.map(
                (e) => BottomSheetModel(
                  title: e.adi ?? e.muhKodu.toStringIfNotNull ?? "",
                  description: "ALIŞ: ${e.alisHesabi ?? ""}\nSATIŞ: ${e.satisHesabi ?? ""}",
                  value: e,
                  groupValue:
                      alisMi == true
                          ? e.alisHesabi
                          : alisMi == false
                          ? e.satisHesabi
                          : e.muhKodu,
                ),
              )
              .toList(),
    );
  }

  Future<StokMuhasebeKoduModel?> showMuhasebeMuhasebeKoduBottomSheetDialog(
    BuildContext context,
    dynamic groupValue, {
    String? belgeTipi,
    String? hesapTipi,
    bool muhRefKodGelsin = false,
  }) async {
    if (_viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      final Map<String, dynamic> queryparams = <String, dynamic>{
        "BelgeTipi": belgeTipi,
        "HesapTipi": hesapTipi ?? "A",
        "MuhRefKodGelsin": muhRefKodGelsin ? "E" : "H",
        "EkranTipi": "R",
      };
      _viewModel.changeMuhasebeKoduList(
        await _networkManager.getMuhasebeKodlari(stokMu: false, queryParams: queryparams),
      );
    }
    return await showRadioBottomSheetDialog(
      context,
      title: "Muhasebe Kodu Seçiniz",
      groupValue: groupValue,
      children:
          _viewModel.muhasebeKoduList
              ?.map(
                (e) => BottomSheetModel(
                  title: e.hesapAdi ?? e.hesapKodu ?? "",
                  description: e.hesapKodu,
                  value: e,
                  groupValue: e.hesapKodu,
                ),
              )
              .toList(),
    );
  }

  Future<StokMuhasebeKoduModel?> showMuhasebeReferansKoduBottomSheetDialog(
    BuildContext context,
    dynamic groupValue, {
    MuhasebeBelgeTipiEnum? belgeTipi,
    String? hesapTipi,
  }) async {
    if (_viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      final Map<String, dynamic> queryparams = <String, dynamic>{
        "BelgeTipi": "",
        "HesapTipi": "",
        "MuhRefKodGelsin": "E",
        "EkranTipi": "R",
      };
      _viewModel.changeMuhasebeKoduList(
        await _networkManager.getMuhasebeKodlari(stokMu: false, queryParams: queryparams),
      );
    }
    return await showRadioBottomSheetDialog(
      context,
      title: "Muhasebe Kodu Seçiniz",
      groupValue: groupValue,
      children:
          _viewModel.muhasebeKoduList
              ?.map(
                (e) => BottomSheetModel(
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
    final List<PlasiyerList> plasiyerList = _paramModel?.plasiyerList ?? <PlasiyerList>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Plasiyer Seçiniz",
      groupValue: groupValue,
      children:
          plasiyerList
              .map(
                (e) => BottomSheetModel(
                  title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "",
                  description: e.plasiyerKodu,
                  value: e,
                  groupValue: e.plasiyerKodu,
                ),
              )
              .toList(),
    );
  }

  Future<bool?> showBaglantiSekliBottomSheetDialog(BuildContext context, AccountResponseModel? model) async {
    final AccountResponseModel? account = CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "");
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Bağlantı Şekli Seçiniz",
      groupValue: CacheManager.getUzaktanMi(account?.firmaKisaAdi),
      children: [
        if (account?.wsWan != null) BottomSheetModel(title: "Uzaktan", value: true, groupValue: true),
        if (account?.wsLan != null) BottomSheetModel(title: "Yerel", value: false, groupValue: false),
      ],
    );
    if (result != null && model != null) {
      CacheManager.setUzaktanMi(account?.firmaKisaAdi ?? "", result);
      CacheManager.setAccounts(model..uzaktanMi = result);
    }
    return result;
  }

  Future<EIrsaliyeBilgiModel?> showEIrsaliyeSablonBottomSheetDialog(BuildContext context) async {
    final result = await _networkManager.dioGet<EIrsaliyeBilgiModel>(
      path: ApiUrls.getEIrsaliyeSablonlari,
      bodyModel: EIrsaliyeBilgiModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      return await showBottomSheetDialog(
        context,
        title: "Şablon Seçiniz",
        children:
            result.dataList
                .map(
                  (e) => BottomSheetModel(
                    title: e.tasiyiciUnvan ?? "",
                    description:
                        "${e.sablonKodu ?? ""} (${e.sofor1Adi?.split("").first ?? ""}. ${e.sofor1Soyadi ?? ""})",
                    value: e,
                  ),
                )
                .toList(),
      );
    }
    return null;
  }

  Future<BaseProjeModel?> showProjeBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<BaseProjeModel>? projeList = await _networkManager.getProjeData();
    projeList?.where((element) => _yetkiController.projeYetkisiVarMi(element.projeKodu)).toList();
    if (projeList.ext.isNullOrEmpty) return null;
    final BaseProjeModel? proje = await showRadioBottomSheetDialog(
      context,
      title: "Proje Seçiniz",
      groupValue: groupValue,
      children:
          projeList
              ?.map(
                (e) => BottomSheetModel(
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
    final List<DovizList> dovizList = _paramModel?.dovizList ?? <DovizList>[];
    final DovizList? doviz = await showRadioBottomSheetDialog(
      context,
      title: "Döviz Seçiniz",
      groupValue: groupValue,
      children:
          dovizList
              .map(
                (e) => BottomSheetModel(
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
    final List<YaziciList>? yaziciList = _paramModel?.yaziciList;
    final result = await showRadioBottomSheetDialog(
      context,
      title: "Yazıcı Seçiniz",
      groupValue: groupValue,
      children:
          yaziciList
              ?.map(
                (e) => BottomSheetModel(
                  title: e.aciklama ?? e.yaziciAdi ?? "",
                  description: e.yaziciAdi,
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

  Future<NetFectDizaynList?> showDizaynBottomSheetDialog(
    BuildContext context,
    dynamic groupValue, {
    DizaynOzelKodEnum? ozelKod,
    EditTipiEnum? editTipi,
  }) async {
    final List<NetFectDizaynList> netFectDizaynList = (_paramModel?.netFectDizaynList ?? <NetFectDizaynList>[])
        .where((element) => ozelKod == null ? true : element.ozelKod == ozelKod.ozelKodAdi)
        .toList()
        .filteredDizaynList(editTipi);
    log(netFectDizaynList.toString());
    final NetFectDizaynList? dizayn = await showRadioBottomSheetDialog(
      context,
      title: "Dizayn Seçiniz",
      groupValue: groupValue,
      children:
          netFectDizaynList
              .map(
                (e) => BottomSheetModel(
                  title: e.dizaynAdi ?? e.detayKod ?? "",
                  value: e,
                  groupValue: e.detayKod ?? e.ozelKod,
                ),
              )
              .toList(),
    );
    return dizayn;
  }

  Future<BankaListesiModel?> showBankaHesaplariBottomSheetDialog(
    BuildContext context,
    BankaListesiRequestModel model,
    dynamic groupValue,
  ) async {
    List<BankaListesiModel> bankaHesaplariList = <BankaListesiModel>[];
    final result = await _networkManager.dioGet<BankaListesiModel>(
      path: ApiUrls.getBankaHesaplari,
      bodyModel: BankaListesiModel(),
      queryParameters: model.toJson(),
      showLoading: true,
    );
    if (result.isSuccess) {
      bankaHesaplariList = result.dataList;
    }
    if (bankaHesaplariList.ext.isNotNullOrEmpty) {
      return await showRadioBottomSheetDialog(
        context,
        title: "Banka Hesapları",
        groupValue: groupValue,
        children:
            bankaHesaplariList
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
    final List<BelgeTipiModel> belgeTipiList = <BelgeTipiModel>[
      BelgeTipiModel(belgeTipi: "Yurt İçi", belgeTipiId: 2),
      BelgeTipiModel(belgeTipi: "Yurt Dışı", belgeTipiId: 6),
    ];
    return await showRadioBottomSheetDialog(
      context,
      title: "Belge Tipi Seçiniz",
      groupValue: groupValue,
      children:
          belgeTipiList
              .map(
                (e) => BottomSheetModel(
                  title: e.belgeTipi ?? e.belgeTipiId.toStringIfNotNull ?? "",
                  value: e,
                  groupValue: e.belgeTipiId,
                ),
              )
              .toList(),
    );
  }

  Future<ListIskTip?> showIskontoTipiBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<ListIskTip> iskontoTipiList = _paramModel?.listIskTip ?? <ListIskTip>[];
    final ListIskTip? iskontoTipi = await showRadioBottomSheetDialog(
      context,
      title: "İskonto Tipi Seçiniz",
      groupValue: groupValue,
      children:
          iskontoTipiList
              .map(
                (e) => BottomSheetModel(
                  title: e.aciklama ?? e.iskontoTipi.toStringIfNotNull ?? "",
                  value: e,
                  groupValue: e.iskontoTipi,
                ),
              )
              .toList(),
    );
    return iskontoTipi;
  }

  Future<CariKosullarModel?> showKosullarBottomSheetDialog(
    BuildContext context,
    dynamic groupValue,
    DateTime? date,
  ) async {
    final List<CariKosullarModel>? data = await CariNetworkManager.getkosullar(date);
    return await showRadioBottomSheetDialog(
      context,
      title: "Koşullar Seçiniz",
      groupValue: groupValue,
      children:
          data
              ?.map(
                (e) => BottomSheetModel(title: e.genelKosulAdi ?? e.kosulKodu ?? "", value: e, groupValue: e.kosulKodu),
              )
              .toList(),
    );
  }

  Future<double?> showKdvOranlariBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<double>? list = await _networkManager.getKDVOrani();
    return await showRadioBottomSheetDialog(
      context,
      title: "KDV Oranı Seçiniz",
      groupValue: groupValue,
      children:
          list
              ?.map(
                (e) => BottomSheetModel(
                  title: e.commaSeparatedWithDecimalDigits(OndalikEnum.oran),
                  value: e,
                  groupValue: e,
                ),
              )
              .toList(),
    );
  }

  Future<KullanicilarModel?> showKullanicilarBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<KullanicilarModel>? list = await _networkManager.getKullanicilar();
    return await showRadioBottomSheetDialog(
      context,
      title: "Kullanıcı Seçiniz",
      groupValue: groupValue,
      children:
          list
              ?.map((e) => BottomSheetModel(title: e.adi ?? "", value: e, groupValue: e.kodu, description: e.kodu))
              .toList(),
    );
  }

  Future<KullanicilarModel?> showIlgiliKisilerBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<KullanicilarModel>? list = await _networkManager.getIlgiliKisiler();
    return await showRadioBottomSheetDialog(
      context,
      title: "Kişi Seçiniz",
      groupValue: groupValue,
      children: list?.map((e) => BottomSheetModel(title: e.adi ?? "", value: e, groupValue: e.adi)).toList(),
    );
  }

  Future<KullanicilarModel?> showCariAktiviteAciklamalarBottomSheetDialog(
    BuildContext context,
    dynamic groupValue,
  ) async {
    final List<KullanicilarModel>? list = await _networkManager.getCariAktiviteAciklamalar();
    return await showRadioBottomSheetDialog(
      context,
      title: "Açıklama Seçiniz",
      groupValue: groupValue,
      children: list?.map((e) => BottomSheetModel(title: e.adi ?? "", value: e, groupValue: e.adi)).toList(),
    );
  }

  Future<KullanicilarModel?> showCariAktiviteSonucAciklamalarBottomSheetDialog(
    BuildContext context,
    dynamic groupValue,
  ) async {
    final List<KullanicilarModel>? list = await _networkManager.getCariAktiviteAciklamalar();
    return await showRadioBottomSheetDialog(
      context,
      title: "Açıklama Seçiniz",
      groupValue: groupValue,
      children: list?.map((e) => BottomSheetModel(title: e.adi ?? "", value: e, groupValue: e.adi)).toList(),
    );
  }

  Future<KullanicilarModel?> showCariAktiviteBolumlerBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<KullanicilarModel>? list = await _networkManager.getCariAktiviteBolumler();
    return await showRadioBottomSheetDialog(
      context,
      title: "Bölüm Seçiniz",
      groupValue: groupValue,
      children: list?.map((e) => BottomSheetModel(title: e.adi ?? "", value: e, groupValue: e.adi)).toList(),
    );
  }

  Future<CariAktiviteTipleri?> showCariAktiviteTipiBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<CariAktiviteTipleri>? list = _paramModel?.cariAktiviteTipleri;
    return await showRadioBottomSheetDialog(
      context,
      title: "Aktivite Tipi Seçiniz",
      groupValue: groupValue,
      children:
          list
              ?.map(
                (e) => BottomSheetModel(
                  title: e.aktiviteAdi ?? "",
                  value: e,
                  groupValue: e.aktiviteTipi,
                  description: e.aktiviteTipi.toStringIfNotNull,
                ),
              )
              .toList(),
    );
  }

  Future<ListOzelKodTum?> showOzelKod1BottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<ListOzelKodTum> list =
        _paramModel?.listOzelKodTum
            ?.where((element) => element.belgeTipi == "S" && element.fiyatSirasi != 0)
            .toList() ??
        <ListOzelKodTum>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Özel Kod Seçiniz",
      groupValue: groupValue,
      children:
          list.map((e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e, groupValue: e.kod)).toList(),
    );
  }

  Future<ListOzelKodTum?> showOzelKod2BottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final List<ListOzelKodTum> list =
        _paramModel?.listOzelKodTum
            ?.where((element) => element.belgeTipi == "S" && element.fiyatSirasi == 0)
            .toList() ??
        <ListOzelKodTum>[];
    return await showRadioBottomSheetDialog(
      context,
      title: "Özel Kod Seçiniz",
      groupValue: groupValue,
      children:
          list.map((e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e, groupValue: e.kod)).toList(),
    );
  }

  Future<KalemListModel?> showBelgeBaglantilariBottomSheetDialog(
    BuildContext context, {
    required String? cariKodu,
    required String? belgeTipi,
    required String? belgeNo,
    List<String>? filterText,
  }) async {
    final result = await _networkManager.dioGet<KalemListModel>(
      path: ApiUrls.getBelgeBaglantilari,
      bodyModel: KalemListModel(),
      showLoading: true,
      queryParameters: {"CariKodu": cariKodu, "BelgeTuru": belgeTipi, "BelgeNo": belgeNo},
    );
    if (result.isSuccess) {
      final List<KalemListModel> list = result.dataList;
      return await showBottomSheetDialog(
        context,
        title: "Belge Bağlantıları",
        children:
            list
                .where((element) => filterText != null ? filterText.contains(element.belgeTipi) : true)
                .map(
                  (e) => BottomSheetModel(
                    title:
                        EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == e.belgeTipi)?.getName ??
                        "",
                    description: e.belgeNo ?? "",
                    value: e,
                  ),
                )
                .toList(),
      );
    }
    return null;
  }

  Future<EFaturaOzelKodModel?> showEFaturaOzelKodBottomSheetDialog(
    BuildContext context,
    int? groupValue, {
    required String? cariKodu,
    required String? belgeTipi,
    required String? belgeNo,
  }) async {
    final result = await _networkManager.dioGet(
      path: ApiUrls.getEFaturaOzelKodlar,
      bodyModel: EFaturaOzelKodModel(),
      showLoading: true,
      queryParameters: {"CariKodu": cariKodu, "BelgeTipi": belgeTipi, "BelgeNo": belgeNo},
    );
    if (result.isSuccess) {
      final List<EFaturaOzelKodModel> list = result.dataList;
      return await showRadioBottomSheetDialog(
        context,
        title: "Özel Kod Seçiniz",
        groupValue: groupValue,
        children:
            list
                .map(
                  (e) => BottomSheetModel(
                    title: e.aciklama ?? e.tipAdi ?? "",
                    description: e.kod.toStringIfNotNull ?? "",
                    value: e,
                    groupValue: e.kod,
                  ),
                )
                .toList(),
      );
    }
    return null;
  }

  Future<TcmbBankalarModel?> showTcmbBankalarBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final result = await _networkManager.dioGet(
      path: ApiUrls.getTcmbBankalar,
      showLoading: true,
      bodyModel: TcmbBankalarModel(),
    );
    if (result.isSuccess) {
      final List<TcmbBankalarModel> list = result.dataList;
      return await showRadioBottomSheetDialog(
        context,
        title: "Banka Seçiniz",
        groupValue: groupValue,
        children:
            list
                .map(
                  (e) => BottomSheetModel(
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

  Future<TcmbBankalarModel?> showTcmbSubelerBottomSheetDialog(
    BuildContext context,
    String? bankaKodu,
    dynamic groupValue,
  ) async {
    final result = await _networkManager.dioGet(
      path: ApiUrls.getTcmbSubeler,
      bodyModel: TcmbBankalarModel(),
      showLoading: true,
      queryParameters: {"BankaKodu": bankaKodu},
    );
    if (result.isSuccess) {
      final List<TcmbBankalarModel> list = result.dataList;
      return await showRadioBottomSheetDialog(
        context,
        title: "Şube Seçiniz",
        groupValue: groupValue,
        children:
            list
                .map(
                  (e) => BottomSheetModel(
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

  Future<Map<String, dynamic>?> showStokGorunecekAlanlarCheckBoxBottomSheetDialog(
    BuildContext context,
    List<String>? checkedValues,
  ) async {
    final Map<String, dynamic>? stokGorunecekAlanlar = _paramModel?.mapStokKullSahalar?.toJson();
    stokGorunecekAlanlar?.removeWhere((key, value) => value == null);

    if (stokGorunecekAlanlar != null) {
      final result = await showCheckBoxBottomSheetDialog<String>(
        context,
        title: "Stok Görüncek Alanlar",
        groupValues: checkedValues,
        children:
            stokGorunecekAlanlar.entries
                .map((e) => BottomSheetModel(title: e.value, value: e.key, groupValue: e.key))
                .toList(),
      );
      if (result != null) {
        final Map<String, dynamic> resultMap = {};
        for (final element in result) {
          resultMap[element] = stokGorunecekAlanlar[element];
        }
        return resultMap;
      }
    }
    return null;
  }

  Future<MuhasebeReferansModel?> showReferansKodBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final result = await _networkManager.dioGet<MuhasebeReferansModel>(
      path: ApiUrls.getMuhaRefList,
      bodyModel: MuhasebeReferansModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      final List<MuhasebeReferansModel> list = result.dataList;
      return await showRadioBottomSheetDialog(
        context,
        title: "Referans Kod Seçiniz",
        groupValue: groupValue,
        children:
            list
                .map(
                  (e) =>
                      BottomSheetModel(title: e.tanimi ?? "", description: e.kodu ?? "", value: e, groupValue: e.kodu),
                )
                .toList(),
      );
    }
    return null;
  }

  Future<SeriModel?> showSeriKodBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final result = await _networkManager.dioGet<SeriModel>(
      path: ApiUrls.getDekontSeriler,
      bodyModel: SeriModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      final List<SeriModel> list = result.dataList;
      return await showRadioBottomSheetDialog(
        context,
        title: "Seri Kod Seçiniz",
        groupValue: groupValue,
        children:
            list
                .map(
                  (e) => BottomSheetModel(
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

  Future<KasaList?> showKasaBottomSheetDialog(
    BuildContext context,
    dynamic groupValue, {
    bool tahsilatMi = false,
  }) async {
    final List<KasaList> list =
        (_paramModel?.kasaList ?? <KasaList>[])
            .where(
              (element) =>
                  (_kullaniciYetkiModel?.yetkiliKasalar?.contains(element.kasaKodu) == true &&
                      (tahsilatMi
                          ? (_kullaniciYetkiModel?.kkartiKasalar?.contains(element.kasaKodu) ?? false)
                          : true)) ||
                  AccountModel.instance.adminMi,
            )
            .toList();
    return await showRadioBottomSheetDialog(
      context,
      title: "Kasa Seçiniz",
      groupValue: groupValue,
      children:
          list
              .map((e) => BottomSheetModel(title: e.kasaTanimi ?? e.kasaKodu ?? "", value: e, groupValue: e.kasaKodu))
              .toList(),
    );
  }

  Future<DepoFarkRaporuFiltreEnum?> showSayimFiltresiBottomSheetDialog(
    BuildContext context,
    dynamic groupValue,
  ) async => await showRadioBottomSheetDialog(
    context,
    title: "Filtre Seç",
    groupValue: groupValue,
    children: List.generate(DepoFarkRaporuFiltreEnum.values.length, (index) {
      final item = DepoFarkRaporuFiltreEnum.values[index];
      return BottomSheetModel(title: item.filtreAdi, groupValue: item, value: item);
    }),
  );

  Future<OlcumOperatorModel?> showOlcumOperatorBottomSheetDialog(BuildContext context, dynamic groupValue) async {
    final operatorList = await _networkManager.getOperatorler();
    return await showRadioBottomSheetDialog(
      context,
      title: "Operatör Seçiniz",
      groupValue: groupValue,
      children:
          operatorList
              ?.map((e) => BottomSheetModel(title: e.adiSoyadi ?? e.sicilno ?? "", value: e, groupValue: e.sicilno))
              .toList(),
    );
  }

  Future<MuhasebeReferansModel?> showOlcumSartliKabullerBottomSheetDialog(
    BuildContext context,
    dynamic groupValue,
  ) async {
    final sartliKabullerList = await _networkManager.getSartliKabuller();
    return await showRadioBottomSheetDialog(
      context,
      title: "Şartlı Kabul Seçiniz",
      groupValue: groupValue,
      children:
          sartliKabullerList
              ?.map((e) => BottomSheetModel(title: e.tanimi ?? e.kodu ?? "", value: e, groupValue: e.kodu))
              .toList(),
    );
  }

  Future<PrintModel?> showPrintBottomSheetDialog(
    BuildContext context,
    PrintModel printModel,
    bool? askDizayn,
    bool? askMiktar, {
    EditTipiEnum? editTipiEnum,
  }) async {
    if (printModel.yaziciAdi == null) {
      final List<YaziciList?> yaziciListe = _paramModel?.yaziciList ?? <YaziciList?>[];
      if (yaziciListe.length == 1) {
        printModel = printModel.copyWith(
          yaziciAdi: yaziciListe.first?.yaziciAdi,
          yaziciTipi: yaziciListe.first?.yaziciTipi,
        );
      } else if (yaziciListe.length > 1) {
        final result = await showBottomSheetDialog(
          context,
          title: "Yazıcı Seçiniz",
          children: yaziciListe.map((e) => BottomSheetModel(title: e?.yaziciAdi ?? "", value: e)).toList(),
        );
        if (result != null) {
          printModel = printModel.copyWith(yaziciAdi: result.yaziciAdi, yaziciTipi: result.yaziciTipi);
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
          _paramModel?.netFectDizaynList
              ?.filteredDizaynList(editTipiEnum)
              .where((element) => element.ozelKod == printModel.raporOzelKod)
              .toList() ??
          <NetFectDizaynList?>[];
      if (dizaynListe.length == 1) {
        printModel = printModel.copyWith(dizaynId: dizaynListe.first?.id);
      } else if (dizaynListe.length > 1) {
        final result = await showBottomSheetDialog(
          context,
          title: "Dizayn Seçiniz",
          children: dizaynListe.map((e) => BottomSheetModel(title: e?.dizaynAdi ?? "", value: e)).toList(),
        );
        if (result != null) {
          printModel = printModel.copyWith(dizaynId: result.id);
        } else {
          return null;
        }
      } else {
        final NetFectDizaynList? dizaynList = await showDizaynBottomSheetDialog(context, null, editTipi: editTipiEnum);
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
      final TextEditingController kopyaController = TextEditingController(
        text: printModel.etiketSayisi.toStringIfNotNull,
      );
      final returnValue = await showBottomSheetDialog(
        context,
        title: printModel.dicParams?.belgeNo ?? "",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextField(
              labelText: "Dizayn",
              isMust: true,
              controller: dizaynController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {},
            ),
            CustomTextField(
              labelText: "Yazıcı",
              isMust: true,
              controller: yaziciController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {},
            ),
            CustomTextField(
              labelText: "Kopya Sayısı",
              isMust: true,
              controller: kopyaController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                int kopya = int.tryParse(value) ?? 0;
                if (kopya <= 0) {
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
                final GenericResponseModel<NetworkManagerMixin> result = await _networkManager.postPrint(
                  model: printModel,
                );
                if (result.isSuccess) {
                  DialogManager().showSuccessSnackBar("Yazdırıldı.");
                }
                Get.back(result: printModel);
              },
              child: const Text("Yazdır"),
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      );
      if (returnValue != null) {
        dizaynController.dispose();
        yaziciController.dispose();
        kopyaController.dispose();
        return returnValue;
      }
    } else {
      final GenericResponseModel<NetworkManagerMixin> result = await _networkManager.postPrint(model: printModel);
      if (result.isSuccess) {
        DialogManager().showSuccessSnackBar("Yazdırıldı.");
        return printModel;
      }
    }
    return null;
  }

  Future<void> showEBelgePrintBottomSheetDialog(BuildContext context, EBelgeListesiModel model) async {
    final TextEditingController yaziciController = TextEditingController(text: model.yaziciAdi);
    final TextEditingController kopyaController = TextEditingController(text: model.kopyaSayisi.toStringIfNotNull);
    await showBottomSheetDialog(
      context,
      title: model.belgeNo ?? "",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomTextField(
            labelText: "Yazıcı",
            isMust: true,
            controller: yaziciController,
            readOnly: true,
            suffixMore: true,
            onTap: () async {
              final YaziciList? yaziciList = await showYaziciBottomSheetDialog(context, null);
              if (yaziciList != null) {
                model = model.copyWith(yaziciAdi: yaziciList.yaziciAdi);
                yaziciController.text = model.yaziciAdi ?? "";
              }
            },
          ),
          CustomTextField(
            labelText: "Kopya Sayısı",
            isMust: true,
            controller: kopyaController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              int kopya = int.tryParse(value) ?? 0;
              if ((int.tryParse(value) ?? 0) <= 0) {
                kopya = 1;

                return;
              }
              kopyaController.text = kopya.toString();
              model = model.copyWith(kopyaSayisi: 1);
            },
            suffix: Wrap(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    if ((model.kopyaSayisi ?? 0) <= 0) {
                      return;
                    }
                    model = model.copyWith(kopyaSayisi: (model.kopyaSayisi ?? 0) - 1);
                    kopyaController.text = model.kopyaSayisi.toStringIfNotNull ?? "";
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    model = model.copyWith(kopyaSayisi: (model.kopyaSayisi ?? 0) + 1);
                    kopyaController.text = model.kopyaSayisi.toStringIfNotNull ?? "";
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await _networkManager.dioPost(
                path: ApiUrls.eBelgeIslemi,
                bodyModel: model,
                data: model.printEBelge.toJson(),
                showLoading: true,
              );
              if (result.isSuccess) {
                DialogManager().showSuccessSnackBar("Yazdırıldı.");
              } else {
                await DialogManager().showAlertDialog(result.message ?? "Yazdırma işlemi başarısız.");
              }
              Get.back();
              yaziciController.dispose();
              kopyaController.dispose();
            },
            child: const Text("Yazdır"),
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
  }

  Future<MemoryImage?> getPhoto(BuildContext context) async {
    final sourceType = await showBottomSheetDialog(
      context,
      title: "Kaynak tipi",
      children: [
        BottomSheetModel(
          title: "Galeri",
          iconWidget: Icons.photo_library_outlined,
          onTap: () => Get.back(result: ImageSource.gallery),
        ),
        BottomSheetModel(
          title: "Kamera",
          iconWidget: Icons.camera_alt_outlined,
          onTap: () => Get.back(result: ImageSource.camera),
        ),
      ],
    );
    if (sourceType != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? result = await picker.pickImage(
        source: sourceType,
        imageQuality: 30,
        maxHeight: 1024,
        maxWidth: 768,
      );
      if (result != null) {
        Uint8List? compressedImage;
        compressedImage = await FlutterImageCompress.compressWithFile(
          result.path,
          format: CompressFormat.png,
          keepExif: true,
          numberOfRetries: 10,
          quality: 30,
        );
        if (compressedImage != null) {
          return MemoryImage(compressedImage);
        }
      }
    }
    return null;
  }
}

final class SearchField extends StatefulWidget {
  const SearchField({required this.viewModel, super.key, this.children});

  final List<BottomSheetModel>? children;
  final BottomSheetStateManager viewModel;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

final class _SearchFieldState extends State<SearchField> {
  late final FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
    focusNode: focusNode,
    decoration: const InputDecoration(hintText: "Aramak istediğiniz metni yazınız."),
    onChanged: (widget.children?.length ?? 0) < 100 ? widget.viewModel.changeSearchValue : null,
    onSubmitted: (widget.children?.length ?? 0) >= 100 ? widget.viewModel.changeSearchValue : null,
  );
}
