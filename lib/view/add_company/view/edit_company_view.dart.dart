import 'package:flutter/material.dart';
import 'package:picker/view/add_company/page_view/company_page.dart';
import "package:picker/view/add_company/page_view/add_account_view.dart";

import '../../../core/base/state/base_state.dart';

class AddCompanyView extends StatefulWidget {
  const AddCompanyView({super.key});

  @override
  State<AddCompanyView> createState() => _AddCompanyViewState();
}

class _AddCompanyViewState extends BaseState<AddCompanyView> {
  final PageController controller = PageController();
  bool isMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (controller.page == 0) {
                isMenu = true;
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              } else {
                isMenu = false;
                controller.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }
              setState(() {});
            },
            child: AnimatedRotation(
              turns: isMenu ? (1 / 8) : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.add),
            )),
        appBar: AppBar(
          title: Column(
            children: const [Text("Firmalar")],
          ),
          centerTitle: false,
          actions: [
            isMenu
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.save))
                : const SizedBox()
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [AccountsView(), AddAccountView()],
        ));
  }
}
