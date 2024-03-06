import "package:flutter/material.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayim_girisi/view/sayim_girisi_view.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SayimEditView extends StatefulWidget {
  final SayimListesiModel model;
  const SayimEditView({super.key, required this.model});

  @override
  State<SayimEditView> createState() => _SayimEditViewState();
}

class _SayimEditViewState extends State<SayimEditView> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Sayım",
            subtitle: "Depo: ${widget.model.depo}",
          ),
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                child: Text("Sayım Girişi"),
              ),
              Tab(
                child: Text("Sayılanlar"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            SayimGirisiView(),
            SayimGirisiView(),
          ],
        ),
      );
}
