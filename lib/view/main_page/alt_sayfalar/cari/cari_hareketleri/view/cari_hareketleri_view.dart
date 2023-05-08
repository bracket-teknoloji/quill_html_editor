import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../cari_listesi/model/cari_listesi_model.dart';

class CariHareketleriView extends StatefulWidget {
  final CariListesiModel? cari;
  const CariHareketleriView({super.key, this.cari});

  @override
  State<CariHareketleriView> createState() => _CariHareketleriViewState();
}

class _CariHareketleriViewState extends BaseState<CariHareketleriView> {
  List<CariHareketleriModel> list = [];
  @override
  void initState() {
    super.initState();
    init();
    print(list.length);
  }

  void init() async {
    list = await getData();
    log(list.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Cari Hareketleri ${list.isNotEmpty ? '(${list.length})' : ''}"),
            Text(
              widget.cari?.cariAdi.toString() ?? "",
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.07),
          child: SizedBox(
            height: height * 0.07,
            child: ListView(
                shrinkWrap: true,
                itemExtent: width * 0.33,
                scrollDirection: Axis.horizontal,
                children: [
                  AppBarButton(child: const Text("Cari İşlemleri"), onPressed: () {}),
                  AppBarButton(child: const Text("Sırala"), onPressed: () {}),
                  AppBarButton(child: const Text("Yenile"), onPressed: () {}),
                ].map((e) => e.paddingAll(UIHelper.lowSize)).toList()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        var a = await getData();
        setState(() {
          list = a;
        });
      }),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(list[index].belgeNo ?? ""),
              subtitle: Text(list[index].cariAdi ?? ""),
              trailing: Text(list[index].borc.toString()),
            ),
          );
        },
      ),
    );
  }

  Future<List<CariHareketleriModel>> getData() async {
    var response = await networkManager.dioGet<CariHareketleriModel>(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      addTokenKey: true,
      queryParameters: {"SIRALAMA": "TARIH_AZ", "EkranTipi": "L", "CariKodu": widget.cari?.cariKodu ?? ""},
      addSirketBilgileri: true,
    );
    log(response.success.toString());
    return response.data;
  }
}
