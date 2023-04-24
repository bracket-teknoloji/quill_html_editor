import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/model/base_network_mixin.dart';
import '../../../core/base/model/generic_response_model.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/components/textfield/custom_textfield.dart';
import '../../../core/init/network/login/api_urls.dart';
import '../model/account_model.dart';
import '../model/account_response_model.dart';

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
          title: const Text("Firmalar"),
          centerTitle: false,
          actions: [IconButton(onPressed: loginMethod, icon: const Icon(Icons.save))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  text: "Firma E-Posta Adresi",
                  children: [
                    TextFormField(
                        controller: _controller,
                        inputFormatters: [
                          //email
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
                        ],
                        textInputAction: TextInputAction.next),
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
                Padding(
                  padding: context.verticalPaddingLow,
                  child: ElevatedButton(
                      onPressed: () {
                        _getQR(context);
                      },
                      child: const Text("BİLGİLERİ QR KOD'DAN AL")),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> loginMethod() async {
    String encodedPassword = passwordDecoder(_controller2.text);
    dialogManager.loadingDialog();
    if (_controller.text != "" && _controller2.text != "") {
      var model = AccountModel.instance
        ..uyeEmail = _controller.text
        ..uyeSifre = encodedPassword;
      var data = model.toJson();
      final response = await networkManager.dioPost<AccountResponseModel>(bodyModel: AccountResponseModel(), data: data, addTokenKey: false, path: ApiUrls.getUyeBilgileri);
      if (response.success!) {
        Box box = Hive.box("accounts");
        for (AccountResponseModel item in response.data!) {
          if (!box.containsKey(item.firma)) {
            Get.back(result: true);
            setState(() {});
            box.put(item.firma, item);
            dialogManager.showSnackBar("Başarılı");
          } else {
            dialogManager.showSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
          }
        }
      } else {
        dialogManager.showAlertDialog(response.message.toString());
      }
    } else {
      dialogManager.showSnackBar("Lütfen boş alan bırakmayınız");
    }
  }

  Future<void> _getQR(BuildContext context) async {
    dynamic barcode = await Get.toNamed("/qr");
    var model = AccountModel.instance..qrData = barcode;
    var data = model.toJson();
    GenericResponseModel<NetworkManagerMixin> response;

    if (barcode != null) {
      response = await networkManager.dioPost<AccountResponseModel>(
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
          dialogManager.showAlertDialog(response.message.toString());
        }
      } else {
        //?
        dialogManager.showAlertDialog(response.message.toString());
      }
    }
  }

  String passwordDecoder(String password) {
    String password = md5.convert(utf8.encode(_controller2.text)).toString();
    return password;
  }
}
