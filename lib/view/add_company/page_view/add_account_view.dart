import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/state/base_state.dart';

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
