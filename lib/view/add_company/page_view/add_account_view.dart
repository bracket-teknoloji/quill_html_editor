import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends State<AddAccountView> {
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
                  child: const Text("QR Kodu Okut"))
            ],
          ),
        ));
  }

  Future<void> _getQR(BuildContext context) async {
    final qr = await Get.toNamed("/qr");
    var map = jsonDecode(qr.toString());
    if (map is Map && map.keys.contains("user")) {
      _controller.text = map["user"];
      _controller2.text = map["password"].toString();
      setState(() {});
    }
  }
}
