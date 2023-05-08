import 'package:flutter/material.dart';

import '../../../constants/ui_helper/ui_helper.dart';

class ToggleButton extends StatefulWidget {
  static String selected = "Tümü";
  // onCHanged fonksiyonu ile seçilen butonun değerini almak için kullanılan değişken
  final Function(String)? onChanged;
  const ToggleButton({super.key, this.onChanged});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<String> title = ["Tümü", "Tahsil Edilecek", "Ödeme Yapılacak", "Sıfır Bakiye", "Bakiyeli"];
  var isSelected2 = [false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < isSelected2.length; i++) {
      if (title[i] == ToggleButton.selected) {
        isSelected2[i] = true;
      }
    }
    if (ToggleButton.selected == "" || ToggleButton.selected == "Tümü") {
      setState(() {
        isSelected2 = [true, false, false, false, false];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      isSelected: isSelected2,
      children: List.generate(title.length, (index) {
        return Padding(
          padding: UIHelper.lowPadding,
          child: Text(
            title[index],
          ),
        );
      }),
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < isSelected2.length; i++) {
            isSelected2[i] = i == index;
          }
        });
        ToggleButton.selected = title[index];
      },
    );
  }
}
