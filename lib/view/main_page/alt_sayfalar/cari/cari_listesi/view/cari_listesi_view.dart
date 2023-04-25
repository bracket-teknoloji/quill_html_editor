import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/init/network/login/api_urls.dart';
import '../model/cari_listesi_model.dart';

class CariListesiView extends StatefulWidget {
  const CariListesiView({super.key});

  @override
  State<CariListesiView> createState() => _CariListesiViewState();
}

class _CariListesiViewState extends BaseState<CariListesiView> {
  static final s = DateTime.now().timeZoneOffset.inMinutes;
  var baseEncoded = base64Encode(utf8.encode(
      '{ "GUID": "955a8d4b-e597-4425-b933-cb3f35d83f0d","TZ_MINUTES" :$s,"ZAMAN": "${DateTime.now().day}.0${DateTime.now().month}.${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"}'));
  Future getData() async {
    log(baseEncoded.toString());
    final response = await networkManager.dioGet<CariListesiModel>(
      path: ApiUrls.getCariler,
      queryParameters: {"EFaturaGoster": "true", "SIRALAMA": "AZ", "Sayfa": "1", "MenuKodu": "CARI_CARI", "FilterText": "", "Kod": ""},
      headers: {
        "Connection": "Keep-Alive",
        "Accept-Encoding": "gzip",
        "Accept-Language": "tr",
        "Host": "95.70.216.35:7575",
        "VERITABANI": "BRACKET23",
        "ISLETME_KODU": "1",
        "SUBE_KODU": "1",
        "Platform": "android",
        "CKEY": baseEncoded,
        "X-App-Version": "226",
        "UserHostAddress": "192.168.3.1"
      },
      bodyModel: CariListesiModel(),
    );
    log(response.message.toString());
    dialogManager.showAlertDialog(response.message.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Cari Listesi"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("Cari $index"),
                    subtitle: Text("Cari $index"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
