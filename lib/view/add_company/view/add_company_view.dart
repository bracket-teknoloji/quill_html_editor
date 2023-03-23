import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/state/base_state.dart';

class AddCompanyView extends StatefulWidget {
  const AddCompanyView({super.key});

  @override
  State<AddCompanyView> createState() => _AddCompanyViewState();
}

class _AddCompanyViewState extends BaseState<AddCompanyView> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Firmalar"),
          centerTitle: false,
          actions: [
            controller.initialPage == 0
                ? IconButton(
                    onPressed: () {
                      controller.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    icon: const Icon(Icons.arrow_back))
                : const SizedBox()
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            ListView(
              children: [
                Card(
                  margin: const EdgeInsets.all(8),
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
                  padding: context.paddingMedium,
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          const Text("Firma E-Posta Adresi"),
                          TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down)),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          const Text("Şifre"),
                          TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down)),
                          ),
                        ],
                      ),
                      Wrap(
                        children: const [
                          Icon(Icons.question_mark_rounded),
                          Text(
                              "Bilgileri girerken büyük-küçük uyumuna dikkat ediniz.")
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
