import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";


/// Bu widget ile Sayfalama işlemleri yapılır.
/// Sayfayı yukarı kaydırarak yenileme işlemi yapılmaktadır.
/// Yenileme işlemi yapıldığında sayfa yenilenir.
/// Bu widget'ın State'ini yönetmek için `Observer` widget'ı kullanınız.
class RefreshableListView<T extends NetworkManagerMixin> extends StatelessWidget {
  ///* Refresh işlemleri için gerekli fonksiyon
  final Future<void> Function() onRefresh;

  ///* Liste elemanları
  final List<T>? items;

  ///* Liste elemanlarının görünümü için builder
  final Widget Function(T item) itemBuilder;

  ///* Tek istekle bütün verilerin geldiği durumda bunu kullanınız.
  const RefreshableListView({super.key, required this.onRefresh, required this.items, required this.itemBuilder,});

  @override
  ///* Bu widget adaptive olarak çalışmaktadır. Padding'i önden tanımlanmıştır.
  Widget build(BuildContext context) => RefreshIndicator.adaptive(
        onRefresh: onRefresh,
        child: body(),
      ).paddingAll(UIHelper.lowSize);

  Widget body() {
    if (items == null) return const ListViewShimmer();
    if (items!.isEmpty) return const Center(child: Text("Liste bulunamadı."));
    return ListView.builder(
      // items nullcheck yapıldığı için ünlem koyabiliriz.
      itemCount: items!.length,
      itemBuilder: (context, index) => itemBuilder(items![index]),
    );
  }
}
