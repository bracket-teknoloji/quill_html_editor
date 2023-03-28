import 'dart:convert';

import 'package:flutter/material.dart';
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
        backgroundColor: Colors.grey,
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
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Text("Şifre"),
                  TextFormField(
                    controller: _controller2,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                  ),
                ],
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
    final qr = await Navigator.of(context).pushNamed("/qr");
    var map = jsonDecode(qr.toString());
    if (map is Map) {
      _controller.text = map["user"];
      _controller2.text = map["password"];
    }
  }
}
