import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../base/model/base_network_mixin.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../shimmer/list_view_shimmer.dart";

/// Bu widget ile Sayfalama işlemleri yapılır.
///
///* Sayfayı yukarı kaydırarak yenileme işlemi yapılmaktadır.
///* Yenileme işlemi yapıldığında sayfa yenilenir.
///* Bu widget'ın State'ini yönetmek için `Observer` widget'ı kullanınız.
final class RefreshableListView<T extends NetworkManagerMixin> extends StatelessWidget {
  /// Tek istekle bütün verilerin geldiği durumda bunu kullanınız.
  const RefreshableListView({required this.onRefresh, required this.items, required this.itemBuilder, super.key})
    : _isPageable = false,
      dahaVarMi = false,
      _isSliver = false,
      scrollController = null;

  /// Eğer ihtiyaç olunan veriler tek bir istek ile gelmiyorsa bunu kullanınız.
  /// Sayfalama özelliklerini kullanacağınız durumlarda işinize yarayacaktır.
  ///* [scrollController] ile sayfa hareketlerini takip edebilirsiniz.
  ///* [dahaVarMi] ile ekranda [CircularProgressIndicator] görünüp görünmemesini sağlayabilirsiniz.
  const RefreshableListView.pageable({
    required this.scrollController,
    required this.onRefresh,
    required this.dahaVarMi,
    required this.items,
    required this.itemBuilder,
    super.key,
  }) : _isPageable = true,
       _isSliver = false;

  @Deprecated("Sliver versiyonları daha bitmedi.")
  const RefreshableListView.withSliver({
    required this.onRefresh,
    required this.items,
    required this.itemBuilder,
    super.key,
  }) : _isPageable = false,
       dahaVarMi = false,
       _isSliver = true,
       scrollController = null;

  @Deprecated("Sliver versiyonları daha bitmedi.")
  const RefreshableListView.pageableWithSliver({
    required this.scrollController,
    required this.onRefresh,
    required this.dahaVarMi,
    required this.items,
    required this.itemBuilder,
    super.key,
  }) : _isPageable = true,
       _isSliver = true;

  /// Refresh işlemleri için gerekli fonksiyon
  final Future<void> Function() onRefresh;

  /// Liste elemanları
  final List<T>? items;

  /// Liste elemanlarının görünümü için builder
  final Widget Function(T item) itemBuilder;

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

  /// Gelecek olan listenin Sliver olup olmadığını kontrol etmek için kullanılır.
  final bool _isSliver;

  ///Bu widget adaptive olarak çalışmaktadır.
  ///Padding'i önden tanımlanmıştır.
  @override
  Widget build(BuildContext context) =>
      RefreshIndicator.adaptive(onRefresh: onRefresh, child: body(context)).paddingAll(UIHelper.lowSize);

  Widget body(BuildContext context) {
    if (items == null) return const ListViewShimmer();
    if (kIsWeb) {
      const scrollbarThickness = 8.0;
      return RawScrollbar(
        interactive: true,
        thumbVisibility: true,
        minThumbLength: 50,
        controller: scrollController,
        radius: const Radius.circular(10),
        thickness: scrollbarThickness,
        child: listView(context).paddingOnly(right: scrollbarThickness * 1.3),
      );
    }
    return listView(context);
  }

  Widget listView(BuildContext context) {
    if (items!.isEmpty) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.travel_explore_outlined), Text("Liste bulunamadı.")],
          ).paddingSymmetric(vertical: MediaQuery.sizeOf(context).height * 0.4),
        ),
      );
    }
    if (_isSliver) {
      if (_isPageable) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => itemBuilder(items![index]),
            childCount: items!.length,
          ),
        );
      }
      return SliverFixedExtentList(
        itemExtent: (items?.length ?? 0).toDouble(),
        delegate: SliverChildBuilderDelegate((context, index) => itemBuilder(items![index]), childCount: items!.length),
      );
    } else {
      if (!_isPageable) {
        return ListView.builder(
          itemCount: items!.length,
          primary: false,
          padding: UIHelper.lowPadding.add(const EdgeInsets.only(bottom: 100)),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          // items nullcheck yapıldığı için ünlem koyabiliriz.
          itemBuilder: (context, index) => itemBuilder(items![index]),
        );
      }

      return ListView.builder(
        controller: scrollController,
        primary: false,
        padding: UIHelper.lowPadding.add(const EdgeInsets.only(bottom: 100)),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

        // DahaVarMi [true] ise [CircularProgressIndicator] görünür.
        // Gösterebilmek için item sayısını 1 artırırız.
        itemCount: dahaVarMi ? items!.length + 1 : items!.length,
        itemBuilder: (context, index) {
          if (index == items!.length) {
            return Visibility(visible: dahaVarMi, child: const Center(child: CircularProgressIndicator.adaptive()));
          }
          return itemBuilder(items![index]);
        },
      );
    }
  }
}
