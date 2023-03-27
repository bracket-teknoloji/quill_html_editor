import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/state/base_state.dart';

class AddCompanyView extends StatefulWidget {
  const AddCompanyView({super.key});

  @override
  State<AddCompanyView> createState() => _AddCompanyViewState();
}

class _AddCompanyViewState extends BaseState<AddCompanyView> {
  final PageController controller = PageController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool isMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              isMenu = !isMenu;
              setState(() {});
              if (controller.page == 0) {
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              } else {
                controller.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }
            },
            child: AnimatedRotation(
              turns: isMenu ? (1 / 8) : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.add),
            )),
        appBar: AppBar(
          title: const Text("Firmalar"),
          centerTitle: false,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            ListView(
              children: [
                Card(
                  margin: context.paddingNormal,
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Column(children: const [
                                ListTile(
                                  title: Text("Firma Adı"),
                                  subtitle: Text("Bracket Teknoloji"),
                                ),
                                ListTile(
                                    title: Text("Firma E-Posta Adresi"),
                                    subtitle: Text(""))
                              ]));
                    },
                    title: const Text("Add Company"),
                    trailing: const Icon(Icons.chevron_right_outlined),
                    subtitle: const Text("Bracket Teknoloji"),
                  ),
                ),
              ],
            ),
            Scaffold(
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
                ))
          ],
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
