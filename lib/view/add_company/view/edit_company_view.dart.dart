import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/state/base_state.dart';
import '../model/add_account_view.dart';
import '../model/company_page.dart';

class AddCompanyView extends StatefulWidget {
  const AddCompanyView({super.key});

  @override
  State<AddCompanyView> createState() => AddCompanyViewState();
}

class AddCompanyViewState extends BaseState<AddCompanyView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController controller = PageController();
  bool isMenu = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.page == 0) {
          Get.toNamed('/');
          return false;
        } else {
          isMenu = false;
          controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
          setState(() {});
          return false;
        }
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (controller.page == 0) {
                  isMenu = true;
                  controller.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                } else {
                  isMenu = false;
                  controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                }
                setState(() {});
              },
              child: AnimatedRotation(
                turns: isMenu ? (7 / 8) : 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.elasticIn,
                child: const Icon(Icons.add),
              )),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const [AccountsView(), AddAccountView()],
          )),
    );
  }
}
