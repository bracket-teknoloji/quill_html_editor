import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/state/base_state.dart';
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
          title: const Text("Firmalar"),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: loginMethod,
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
        ));
  }

  Future<void> loginMethod() async {
    {
      dialogManager.loadingDialog();
      // ignore: await_only_futures
      var model = await AccountModel.create()
        ..uyeEmail = _controller.text
        ..uyeSifre = md5.convert(utf8.encode(_controller2.text)).toString();
      var data = model.toJson();
      final response = await networkManager.dioPost<AccountResponseModel>(
        bodyModel: AccountResponseModel(),
        data: data,
        addTokenKey: false,
        path: ApiUrls.getUyeBilgileri,
      );
      if (response.data != null) {
        if (response.success!) {
          Get.offAndToNamed("/addCompany");
          Box box = Hive.box("accounts");
          for (AccountResponseModel item in response.data!) {
            if (!box.containsKey(item.firmaKisaAdi)) {
              box.put(item.firmaKisaAdi, item);
              dialogManager.showSnackBar("Başarılı");
            } else {
              dialogManager.showSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
            }
          }
        } else {
          dialogManager.showAlertDialog(response.errorDetails.toString());
        }
      } else {
        dialogManager.showAlertDialog(response.message.toString());
      }
    }
  }

  Future<void> _getQR(BuildContext context) async {
    String barcode = await Get.toNamed("/qr");
    var model = AccountModel.create()..qrData = barcode;
    var data = model.toJson();
    final response = await networkManager.dioPost<AccountResponseModel>(
      bodyModel: AccountResponseModel(),
      addTokenKey: false,
      data: data,
      path: ApiUrls.getUyeBilgileri,
    );
    if (response.data != null) {
      if (response.success ?? false) {
        Box box = Hive.box("accounts");
        for (AccountResponseModel item in response.data!) {
          Get.offAndToNamed("/addCompany");
          if (!box.containsKey(item.firmaKisaAdi)) {
            box.put(item.firmaKisaAdi, item);
            log("item: ${item.toJson()}");
            dialogManager.showSnackBar("Başarılı");
          } else {
            dialogManager.showSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
          }
        }
      } else {
        dialogManager.showAlertDialog(response.errorDetails.toString());
      }
    } else {
      dialogManager.showAlertDialog(response.message.toString());
    }
  }
}
