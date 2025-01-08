import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../base/model/base_network_mixin.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../shimmer/grid_view_shimmer.dart";

final class RefreshableGridView<T extends NetworkManagerMixin> extends StatelessWidget {
  /// Gelecek olan listenin Sliver olup olmadığını kontrol etmek için kullanılır.
  // final bool _isSliver;

  /// Tek istekle bütün verilerin geldiği durumda bunu kullanınız.
  const RefreshableGridView({
    required this.onRefresh,
    required this.items,
    required this.itemBuilder,
    required this.crossAxisCount,
    super.key,
  })  : _isPageable = false,
        dahaVarMi = false,
        // _isSliver = false,
        scrollController = null;

  /// Eğer ihtiyaç olunan veriler tek bir istek ile gelmiyorsa bunu kullanınız.
  /// Sayfalama özelliklerini kullanacağınız durumlarda işinize yarayacaktır.
  ///* [scrollController] ile sayfa hareketlerini takip edebilirsiniz.
  ///* [dahaVarMi] ile ekranda [CircularProgressIndicator] görünüp görünmemesini sağlayabilirsiniz.
  const RefreshableGridView.pageable({
    required this.scrollController,
    required this.onRefresh,
    required this.dahaVarMi,
    required this.items,
    required this.itemBuilder,
    required this.crossAxisCount,
    super.key,
  }) : _isPageable = true;

  /// Refresh işlemleri için gerekli fonksiyon
  final Future<void> Function() onRefresh;

  /// Liste elemanları
  final List<T>? items;

  /// Liste elemanlarının görünümü için builder
  final Widget Function(T item, {int? crossAxisCount}) itemBuilder;

  /// Bu widget'ın sayfalama yapısına ait olup olmadığını kontrol etmek için kullanılır.
  /// Sadece constructor üzerinden çağırılıp değiştirilebilir.
  final bool _isPageable;

  /// Liste sayfalama yapısına sahipse kullanılır.
  /// Bunun sayesinde ekranda [CircularProgressIndicator] görünüp görünmemesini sağlarız.
  /// Eğer [true] ise [CircularProgressIndicator] görünür.
  final bool dahaVarMi;

  /// Bu widget sayfalama yapısına ait ise istenir.
  /// Sayfa hareketlerini takip etmek içn kullanılır.
  final ScrollController? scrollController;

  /// Yatay eksendeki eleman sayısıdır.
  final int crossAxisCount;
  // _isSliver = false;

  @override
  Widget build(BuildContext context) => RefreshIndicator.adaptive(
        onRefresh: onRefresh,
        child: body(),
      ).paddingAll(UIHelper.lowSize);

  Widget body() {
    if (items == null) return GridViewShimmer(gridDelegate: gridDelegate());
    if (items!.isEmpty) return const Center(child: Text("Liste bulunamadı."));
    if (kIsWeb) {
      const scrollbarThickness = 8.0;
      return RawScrollbar(
        interactive: true,
        thumbVisibility: true,
        minThumbLength: 50,
        controller: scrollController,
        radius: const Radius.circular(10),
        thickness: scrollbarThickness,
        child: _gridView().paddingOnly(right: scrollbarThickness * 1.3),
      );
    }
    return _gridView();
  }

  GridView _gridView() {
    if (_isPageable) {
      return GridView.builder(
        controller: scrollController, primary: false,
        gridDelegate: gridDelegate(),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

        // DahaVarMi [true] ise [CircularProgressIndicator] görünür.
        // Gösterebilmek için item sayısını 1 artırırız.
        itemCount: dahaVarMi ? items!.length + 2 : items!.length,
        itemBuilder: (context, index) {
          if (index == items!.length) {
            return const SizedBox();
          }
          if (index == items!.length + 1) {
            return Center(
              child: Visibility(
                visible: dahaVarMi,
                child: const CircularProgressIndicator.adaptive(),
              ),
            );
          }
          return itemBuilder(items![index]);
        },
      );
    }
    return GridView.builder(
      itemCount: items!.length, primary: false,
      gridDelegate: gridDelegate(),
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // items nullcheck yapıldığı için ünlem koyabiliriz.
      itemBuilder: (context, index) => itemBuilder(items![index], crossAxisCount: crossAxisCount),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount gridDelegate() => SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: crossAxisCount == 1
            ? 1.3
            : crossAxisCount == 2
                ? 0.6
                : 0.5,
      );
}
