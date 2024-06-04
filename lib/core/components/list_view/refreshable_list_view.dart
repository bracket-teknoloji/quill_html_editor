import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class RefreshableListView<T extends NetworkManagerMixin> extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final List<T>? items;
  final Widget Function(T item) itemBuilder;
  const RefreshableListView({super.key, required this.onRefresh, required this.items, required this.itemBuilder});

  @override
  Widget build(BuildContext context) => RefreshIndicator.adaptive(
        onRefresh: onRefresh,
        child: body(),
      ).paddingAll(UIHelper.lowSize);

  Widget body() {
    if (items == null) return const ListViewShimmer();
    if (items!.isEmpty) return const Center(child: Text("Liste bulunamadı."));
    return ListView.builder(
      itemCount: items!.length,
      itemBuilder: (context, index) => itemBuilder(items![index]),
    );
  }
}
