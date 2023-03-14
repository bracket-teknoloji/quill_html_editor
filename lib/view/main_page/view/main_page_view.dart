import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../view_model/main_page_view_model.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = MainPageViewModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: AnimationLimiter(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: 50,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 100),
                child: const SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Card(
                      color: Colors.blueGrey,
                      child: Center(child: Text("Cari")),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
