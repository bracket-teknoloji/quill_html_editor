import 'package:flutter/material.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';

class FiyatGecmisiView extends StatefulWidget {
  const FiyatGecmisiView({super.key});

  @override
  State<FiyatGecmisiView> createState() => _FiyatGecmisiViewState();
}

class _FiyatGecmisiViewState extends State<FiyatGecmisiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Flexible(
              flex: 1,
              child: Row(
                children: [CustomTextField(), CustomTextField()],
              ),
            ),
            Expanded(flex: 9, child: ListView.builder(itemCount: 10, itemBuilder: (context, index) => const Text("data")))
          ],
        ));
  }
}
