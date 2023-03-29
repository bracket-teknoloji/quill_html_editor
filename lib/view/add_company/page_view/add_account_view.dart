import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/view/add_company/page_view/account_model.dart';
import 'package:picker/view/add_company/page_view/account_response_model.dart';

class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends BaseState<AddAccountView> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: const [Text("Firmalar")],
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () async {
                  dialogManager.loadingDialog();
                  // ignore: await_only_futures
                  var model = await AccountModel.instance
                    ..uyeEmail = _controller.text
                    ..uyeSifre = md5.convert(utf8.encode(_controller2.text)).toString();
                  var data = model.toJson();
                  final response =
                      await networkManager.dioPost<AccountResponseModel>(
                    bodyModel: AccountResponseModel(),
                    data: data,
                    path: ApiUrls.getUyeBilgileri,
                  );
                  if (response.data != null) {
                    if (response.success ?? false) {
                      Box box = Hive.box("accounts");
                      for (AccountResponseModel item in response.data!) {
                        if (!box.containsKey(item.firmaKisaAdi)) {
                          box.put(item.firmaKisaAdi, item);
                          dialogManager.showSnackBar("Başarılı");
                        } else {
                          dialogManager.showSnackBar(
                              "${item.firmaKisaAdi} zaten kayıtlı");
                        }
                      }
                    } else {
                      dialogManager
                          .showAlertDialog(response.errorDetails.toString());
                    }
                  } else {
                    dialogManager.showAlertDialog(response.message.toString());
                  }
                },
                icon: const Icon(Icons.save))
          ],
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                children: [
                  const Text("Firma E-Posta Adresi"),
                  TextFormField(
                    controller: _controller,
                  ),
                ],
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: Wrap(
                  children: [
                    const Text("Şifre"),
                    TextFormField(
                      obscureText: true,
                      controller: _controller2,
                    ),
                  ],
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                children: const [
                  Icon(Icons.question_mark_rounded),
                  Text(
                    "Bilgileri girerken büyük-küçük uyumuna dikkat ediniz.",
                    softWrap: true,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    _getQR(context);
                  },
                  child: const Text("BİLGİLERİ QR KOD'DAN AL"))
            ],
          ),
        ));
  }

  Future<void> _getQR(BuildContext context) async {
    final barcode = await Get.toNamed("/qr");
    try {
      var map = jsonDecode(barcode.toString());
      if (map is Map && map.keys.contains("user")) {
        _controller.text = map["user"];
        _controller2.text = map["password"].toString();
        setState(() {});
      } else {
        dialogManager.showAlertDialog("Hata QR Kodu Okunamadı");
      }
    } catch (e) {
      dialogManager.showAlertDialog("Geçerli bir QR Kodu okutunuz.");
    }
  }
}
