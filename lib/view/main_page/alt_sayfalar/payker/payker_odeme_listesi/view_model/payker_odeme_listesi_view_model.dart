import "dart:convert";
import "dart:developer";

import "package:flutter/widgets.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/pageable_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/module_info_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/payker_filter_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/payker_odeme_listesi_model.dart";

part "payker_odeme_listesi_view_model.g.dart";

class PaykerOdemeListesiViewModel = _PaykerOdemeListesiViewModelBase with _$PaykerOdemeListesiViewModel;

abstract class _PaykerOdemeListesiViewModelBase
    with
        Store,
        MobxNetworkMixin,
        ListableMixin<PaykerOdemeListesiModel>,
        SearchableMixin,
        ScrollControllableMixin,
        PageableMixin {
  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
    }
  }

  @observable
  PaykerFilterModel filterModel = PaykerFilterModel(
    start: 0,
    columns: [
      const PaykerColumn(searchable: false, orderable: false),
      const PaykerColumn(data: "BAYI_ID", searchable: false, orderable: true),
      const PaykerColumn(data: "BANKA_ID", searchable: true, orderable: true),
      const PaykerColumn(data: "BELGE_NO", searchable: true, orderable: true),
      const PaykerColumn(data: "TUTAR", searchable: true, orderable: true),
      const PaykerColumn(data: "ODEME_TURU", searchable: true, orderable: true),
      const PaykerColumn(data: "ODEMELINK_ID", searchable: true, orderable: true),
      const PaykerColumn(data: "KAYITTARIHI", searchable: true, orderable: true),
      const PaykerColumn(data: "IP_ADRES", searchable: true, orderable: true),
    ],
    filterModels: [
      FilterModel(type: FilterType.dateTime.name, name: "BasTar"),
      FilterModel(type: FilterType.dateTime.name, name: "BitTar"),
      FilterModel(type: FilterType.int.name, name: "FirmaId"),
      FilterModel(type: FilterType.int.name, name: "BankaId"),
      FilterModel(type: FilterType.boolean.name, name: "Durum"),
    ],
  );

  @action
  void setDurum(bool? durum) {
    filterModel = filterModel.copyWith(
      filterModels: filterModel.filterModels?.map((e) {
        if (e.name == "Durum") {
          return e.copyWith(value: durum?.toString());
        }
        return e;
      }).toList(),
    );
  }

  @action
  void setBasTar(DateTime? basTar) {
    filterModel = filterModel.copyWith(
      filterModels: filterModel.filterModels?.map((e) {
        if (e.name == "BasTar") {
          return e.copyWith(value: basTar?.toIso8601String());
        }
        return e;
      }).toList(),
    );
  }

  @action
  void setBitTar(DateTime? bitTar) {
    filterModel = filterModel.copyWith(
      filterModels: filterModel.filterModels?.map((e) {
        if (e.name == "BitTar") {
          return e.copyWith(value: bitTar?.toIso8601String());
        }
        return e;
      }).toList(),
    );
  }

  @action
  void setBankaId(int? bankaId) {
    filterModel = filterModel.copyWith(
      filterModels: filterModel.filterModels?.map((e) {
        if (e.name == "BankaId") {
          return e.copyWith(value: bankaId?.toString());
        }
        return e;
      }).toList(),
    );
  }

  @action
  void setFirmaId(int? firmaId) {
    filterModel = filterModel.copyWith(
      filterModels: filterModel.filterModels?.map((e) {
        if (e.name == "FirmaId") {
          return e.copyWith(value: firmaId?.toString());
        }
        return e;
      }).toList(),
    );
  }

  final List<Order> order = [
    const Order(column: 2, dir: 0, columnName: "Banka (Artan)"),
    const Order(column: 2, dir: 1, columnName: "Banka (Azalan)"),
    const Order(column: 4, dir: 0, columnName: "Tutar (Artan)"),
    const Order(column: 4, dir: 1, columnName: "Tutar (Azalan)"),
    const Order(column: 7, dir: 0, columnName: "Kayıt Tarihi (Artan)"),
    const Order(column: 7, dir: 1, columnName: "Kayıt Tarihi (Azalan)"),
  ];

  @action
  void setOrder(Order newOrder) {
    filterModel = filterModel.copyWith(order: [newOrder]);
  }

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  ObservableList<PaykerOdemeListesiModel>? observableList;

  @override
  @observable
  String? searchText;

  @override
  @action
  Future<void> resetList() async {
    resetPage();
    await getData();
  }

  @override
  @action
  void setObservableList(List<PaykerOdemeListesiModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @computed
  ObservableList<PaykerOdemeListesiModel>? get filteredList => observableList
      ?.where(
        (element) => [
          element.kartIsim,
          element.kartNo,
          element.kartIsim,
          element.siparisNo,
        ].nonNulls.toList().any((element) => element.toLowerCase().contains(searchText?.toLowerCase() ?? "")),
      )
      .toList()
      .asObservable();

  @override
  @action
  Future<void> getData() async {
    log(jsonEncode(filterModel.toJson()));
    if (filterModel.length == null) {
      filterModel = filterModel.copyWith(length: parametreModel.sabitSayfalamaOgeSayisi);
    }
    final result = await networkManager.dioPost(
      path: ApiUrls.getPayments,
      bodyModel: PaykerOdemeListesiModel(),
      data: filterModel.toJson(),
    );
    if (result.isSuccess) {
      if (page > 1) {
        addObservableList(result.dataList);
      } else {
        setObservableList(result.dataList);
      }
      if (result.dataList.length >= parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(true);
        increasePage();
        filterModel = filterModel.copyWith(start: observableList?.length ?? 0);
      } else {
        setDahaVarMi(false);
      }
    } else if (page == 1) {
      setObservableList([]);
    }
  }

  @action
  Future<ModuleInfoModel?> checkPermissions() async {
    ModuleInfoModel? moduleInfo = DIManager.isRegistered<ModuleInfoModel>() ? DIManager.read<ModuleInfoModel>() : null;
    if (moduleInfo != null) {
      return moduleInfo;
    }
    moduleInfo = await networkManager.checkPaykerPermission() ?? CacheManager.instance.getModuleInfo();
    if (moduleInfo == null) {
      return null;
    }
    if (DIManager.isRegistered<ModuleInfoModel>()) {
      DIManager.reset<ModuleInfoModel>();
    }
    DIManager.lazyRegisterer<ModuleInfoModel>(moduleInfo);
    return moduleInfo;
  }

  @override
  @observable
  bool isScrollDown = true;

  @override
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
    if (position.pixels == position.maxScrollExtent && dahaVarMi) {
      await getData();
      isScrollDown = false;
    }
  }

  @override
  @action
  void addObservableList(List<PaykerOdemeListesiModel>? list) => setObservableList(observableList?..addAll(list!));
}
