import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../core/base/view/base_view.dart';

import '../view_model/main_page_view_model.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final _viewModel = MainPageViewModel();
    return BaseView(
      builder: (context, value) => buildScaffold(scaffoldKey),
      title: "Picker",
      leading: IconButton(
        icon: const Icon(Icons.menu_open_outlined),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.pop(context);
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
    );
  }
}

Widget buildScaffold(Key key) {
  return Scaffold(
      key: key,
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
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
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Card(
                    child: Center(
                      child: Text("Item $index"),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ));
}
