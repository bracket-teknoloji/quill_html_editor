import 'package:flutter/material.dart';

import '../view_model/main_page.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = MainPageViewModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: Text(""));
  }
}
