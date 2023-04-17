import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/textfield/custom_textfield.dart';
import '../../../core/init/network/login/api_urls.dart';
import 'account_model.dart';
import 'account_response_model.dart';

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
          automaticallyImplyLeading: false,
          title: const Text("Firmalar"),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty && _controller2.text.isNotEmpty) {
                    loginMethod();
                  } else {
                    dialogManager.showAlertDialog("Lütfen bilgileri giriniz");
                  }
                },
                icon: const Icon(Icons.save))
          ],
        ),
        backgroundColor: Colors.white12,
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                text: "Firma E-Posta Adresi",
                children: [
                  TextFormField(controller: _controller),
                ],
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: CustomTextField(
                  text: "Şifre",
                  children: [
                    TextFormField(obscureText: true, controller: _controller2),
                  ],
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.question_mark_rounded),
                  Text(
                    "Bilgileri girerken büyük-küçük uyumuna dikkat ediniz.",
                    softWrap: true,
                  )
                ],
              ),
              //context.isAndroidDevice || context.isIOSDevice
              false == true
                  ? Padding(
                      padding: context.verticalPaddingLow,
                      child: ElevatedButton(
                          onPressed: () {
                            _getQR(context);
                          },
                          child: const Text("BİLGİLERİ QR KOD'DAN AL")),
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }

  Future<void> loginMethod() async {
    String encodedPassword = passwordDecoder(_controller2.text);
    dialogManager.loadingDialog();
    var model = AccountModel.instance
      ..uyeEmail = _controller.text
      ..uyeSifre = encodedPassword;
    var data = model.toJson();
    final response = await networkManager.dioPost<AccountResponseModel>(bodyModel: AccountResponseModel(), data: data, addTokenKey: false, path: ApiUrls.getUyeBilgileri);
    if (response.success!) {
      Box box = Hive.box("accounts");
      for (AccountResponseModel item in response.data!) {
        if (!box.containsKey(item.firma)) {
          Get.offAndToNamed("/addCompany");
          box.put(item.firma, item);
          dialogManager.showSnackBar("Başarılı");
        } else {
          dialogManager.showSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
        }
      }
    } else {
      dialogManager.showAlertDialog(response.message.toString());
    }
  }

  Future<void> _getQR(BuildContext context) async {
    String? barcode = await Get.toNamed("/qr");
    var model = AccountModel.instance..qrData = barcode;
    var data = model.toJson();

    final response = await networkManager.dioPost<AccountResponseModel>(
      bodyModel: AccountResponseModel(),
      addTokenKey: false,
      data: data,
      path: ApiUrls.getUyeBilgileri,
    );
    if (response.data != null) {
      if (response.success ?? false) {
        var anaHesapBox = Hive.box("anaHesap");
        response.data.forEach((element) {
          anaHesapBox.put("anaHesap", [element.uyeEmail, element.uyeSifre]);
        });
        AccountModel.instance
          ..uyeEmail = response.data![0].uyeEmail
          ..uyeSifre = response.data![0].uyeSifre;
        Box box = Hive.box("accounts");
        for (AccountResponseModel item in response.data!) {
          if (!box.containsKey(item.firma)) {
            Get.offAndToNamed("/addCompany");
            box.put(item.firma, item);
            log("item: ${item.toJson()}");
            dialogManager.showSnackBar("Başarılı");
          } else {
            dialogManager.showSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
          }
        }
      } else {
        dialogManager.showAlertDialog(response.errorDetails.toString());
      }
    } else {}
  }

  String passwordDecoder(String password) {
    String password = md5.convert(utf8.encode(_controller2.text)).toString();
    return password;
  }
}
